#include "MucosalCD4ModelSingleCore.h"

MucosalCD4ModelSingleCore::MucosalCD4ModelSingleCore(
    repast::Properties* p, boost::mpi::communicator* comm) : 
  MucosalCD4ModelBase(p, comm),
  world(comm), 
  context(comm)
{
  props = p;

  initializeRandom(*props, comm);

  /* Initialize the output file */
  if(repast::RepastProcess::instance()->rank() == 0) 
    props->writeToSVFile("./output/record.csv");

  gridDimensions = repast::GridDimensions(
    repast::Point<double>(0, 0), repast::Point<double>(width, height)
  );
}

MucosalCD4ModelSingleCore::~MucosalCD4ModelSingleCore() { 
  //TODO eliminate when raw pointer removed
  for(std::map<std::string, ValueLayer*>::iterator it = cytokines.begin(); 
      it != cytokines.end(); it++) {
      delete it->second;
      cytokines.erase(it);
  }
}

void MucosalCD4ModelSingleCore::init() 
{
  const std::string spaceName = "space";
  const std::string gridName = "grid";
  
  int buffer = 1; // how much one grid overlaps into another

  std::vector<int> processDims;
  processDims.push_back(1);
  processDims.push_back(1);

  //TODO deal with raw pointers
  Space* space = new Space(spaceName,gridDimensions, processDims, buffer, world);
  Grid*  grid  = new Grid(gridName,gridDimensions, processDims, buffer, world);

  std::string name = "Summation";
  bool dense = true;

  //TODO deal with raw pointer
  ValueLayer* ck = new ValueLayer(name, gridDimensions, dense);
   
  context.addValueLayer(ck);
  vl = ck;

  setUpCytokines();

  context.addProjection(space);
  context.addProjection(grid);

  /* agents / cells */
  int bacteriaCount = repast::strToInt(props->getProperty("bacteria.count"));
  createBacteria(bacteriaCount);
  
  int tCellCount = repast::strToInt(props->getProperty("tcell.count"));
  createTcells(tCellCount);

  int dendriticCount = repast::strToInt(props->getProperty("dendritic.count"));
  createDendritics(dendriticCount);

  return; 
} 

void MucosalCD4ModelSingleCore::act() 
{ 
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  int ThNaiveCount = 0;
  int Th1Count = 0;
  int Th17Count = 0;
  int TregCount = 0;

  for (Context::const_iterator agent = context.begin();
       agent != context.end(); ++agent) 
  {
    if ((*agent)->classname() == "Tcell")
    {
      switch ((*agent)->getState()) {
	case AgentState::NAIVE:
	  ThNaiveCount++;
	  break;
	case AgentState::TH1:
	  Th1Count++;
	  break;
	case AgentState::TH17:
	  Th17Count++;
	  break;
	case AgentState::TREG:
	  TregCount++;
	  break;
	default:
	  break;
      }
    }

    (*agent)->act();
  }

  if(repast::RepastProcess::instance()->rank() == 0)
  {
    repast::Properties tcellProps;
    tcellProps.putProperty("tcell.naive.count", ThNaiveCount);
    tcellProps.putProperty("tcell.th1.count", Th1Count);
    tcellProps.putProperty("tcell.th17.count", Th17Count);
    tcellProps.putProperty("tcell.treg.count", TregCount);
    tcellProps.writeToSVFile("./output/tcell-single-core-counts.csv");

    std::cout << "TICK " << runner.currentTick() << "\n";
  }

  diffuse();
  summation();
}

void MucosalCD4ModelSingleCore::initSchedule(repast::ScheduleRunner& runner)
{
  double start = 1, interval = 1;
  runner.scheduleEvent(start, interval, 
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<MucosalCD4ModelSingleCore>(this, &MucosalCD4ModelSingleCore::act)
    )
  );
  runner.scheduleEndEvent(
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<MucosalCD4ModelSingleCore> (this, &MucosalCD4ModelSingleCore::recordResults)
    )
  );

  int stopAt = repast::strToInt(props->getProperty("stop.at"));
  runner.scheduleStop(stopAt); /*Schedule will repeat infinitely without a stop*/
}
