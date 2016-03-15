#include "MucosalCD4ModelMultiCore.h"

MucosalCD4ModelMultiCore::MucosalCD4ModelMultiCore(
    repast::Properties* p, boost::mpi::communicator* comm) : 
  MucosalCD4ModelBase(p, comm),
  world(comm), context(comm)
{
  props = p;

  initializeRandom(*props, comm);

  /* Initialize the output file */
  if(repast::RepastProcess::instance()->rank() == 0) 
    props->writeToSVFile("./output/record.csv");

  provider = new RepastHPCDemoAgentPackageProvider(&context);
  receiver = new RepastHPCDemoAgentPackageReceiver(&context);
  
  gridDimensions = repast::GridDimensions(
    repast::Point<double>(0, 0), repast::Point<double>(width, height)
  );
}

MucosalCD4ModelMultiCore::~MucosalCD4ModelMultiCore() 
{ 
  //TODO eliminate when raw pointer removed
  for(std::map<std::string, ValueLayer*>::iterator it = cytokines.begin(); 
      it != cytokines.end(); it++) {
      delete it->second;
      cytokines.erase(it);
  }

  delete receiver;
  delete provider;
}

void MucosalCD4ModelMultiCore::init() 
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
  createBacteria();
  createTcells();
  createDendritics();
  
  return; 
} 

void MucosalCD4ModelMultiCore::createBacteria()
{
  ENISI::AgentFactory factory;

  int bacteriaCount = repast::strToInt(props->getProperty("bacteria.count"));
  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (bacteriaCount % worldSize)
    std::cerr << "Bacteria count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  int numOfBacteriaPerProcess = bacteriaCount / worldSize;
  MucosalCD4ModelBase::createBacteria(numOfBacteriaPerProcess);
}

void MucosalCD4ModelMultiCore::createTcells()
{
  ENISI::AgentFactory factory;

  int tCellCount = repast::strToInt(props->getProperty("tcell.count"));
  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (tCellCount % worldSize)
    std::cerr << "Tcell count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  int numOfTcellsPerProcess = tCellCount / worldSize;
  MucosalCD4ModelBase::createTcells(numOfTcellsPerProcess);
}

void MucosalCD4ModelMultiCore::createDendritics()
{
  ENISI::AgentFactory factory;

  int dendriticCount = repast::strToInt(props->getProperty("dendritic.count"));
  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (dendriticCount % worldSize)
    std::cerr << "Dendritic count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  int numOfDendriticsPerProcess = dendriticCount / worldSize;
  MucosalCD4ModelBase::createDendritics(numOfDendriticsPerProcess);
}

void MucosalCD4ModelMultiCore::act() 
{
 int initialRank = 0;
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  if(repast::RepastProcess::instance()->rank() == initialRank) 
    std::cout << " TICK " << runner.currentTick() << std::endl;

  std::vector<ENISI::Agent*> agents;
  context.selectAgents(ENISI::Agent::Context::LOCAL, agents);

  std::vector<ENISI::Agent*>::iterator it = agents.begin();

  int ThNaiveCount = 0;
  int Th1Count = 0;
  int Th17Count = 0;
  int TregCount = 0;

  while(it != agents.end())
  {
    if ( (*it)->classname() == "Tcell" )
    {
      switch ((*it)->getState()) {
	case ENISI::AgentState::NAIVE:
	  ThNaiveCount++;
	  break;
	case ENISI::AgentState::TH1:
	  Th1Count++;
	  break;
	case ENISI::AgentState::TH17:
	  Th17Count++;
	  break;
	case ENISI::AgentState::TREG:
	  TregCount++;
	  break;
	default:
	  break;
      }

    }

    (*it)->act();

    it++;
  }

  if(repast::RepastProcess::instance()->rank() == 0){
    repast::Properties tcellProps;
    tcellProps.putProperty("tcell.naive.count", ThNaiveCount);
    tcellProps.putProperty("tcell.th1.count", Th1Count);
    tcellProps.putProperty("tcell.th17.count", Th17Count);
    tcellProps.putProperty("tcell.treg.count", TregCount);
    tcellProps.writeToSVFile("./output/tcell-multi-core-counts.csv");
  }


  context.getProjection("space")->balance();
  context.getProjection("grid")->balance();

  syncAgents();
  diffuse();
  summation();
}

void MucosalCD4ModelMultiCore::initSchedule(repast::ScheduleRunner& runner)
{
  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<MucosalCD4ModelMultiCore> (
      this, &MucosalCD4ModelMultiCore::requestAgents)));

  double actStart = 2, interval = 1;
  runner.scheduleEvent(actStart, interval, 
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<MucosalCD4ModelMultiCore>(this, &MucosalCD4ModelMultiCore::act)
    )
  );
  runner.scheduleEndEvent(
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<MucosalCD4ModelMultiCore> (this, &MucosalCD4ModelMultiCore::recordResults)
    )
  );

  int stopAt = repast::strToInt(props->getProperty("stop.at"));
  runner.scheduleStop(stopAt); /*Schedule will repeat infinitely without a stop*/
}

void MucosalCD4ModelMultiCore::requestAgents()
{
  int rank = repast::RepastProcess::instance()->rank();
  int worldSize= repast::RepastProcess::instance()->worldSize();
  repast::AgentRequest req(rank);

  /* For each process */
  for(int i = 0; i < worldSize; i++)
  {                     
    if(i != rank)// ... except this one
    {                                      
      std::vector<ENISI::Agent*> agents;
      /* Choose all agents */
      context.selectAgents(agents);

      for(size_t j = 0; j < agents.size(); j++)
      {
	/* Transform each local agent's id into a matching non-local one */
	repast::AgentId local = agents[j]->getId();
	repast::AgentId other(local.id(), i, 0);
	other.currentRank(i);

	/* Add it to the agent request */
	req.addRequest(other);
      }
    }
  }
  repast::RepastProcess::instance()->requestAgents
    <
    ENISI::Agent,
      RepastHPCDemoAgentPackage, 
      RepastHPCDemoAgentPackageProvider, 
      RepastHPCDemoAgentPackageReceiver
    >(context, req, *provider, *receiver, *receiver);
}

void MucosalCD4ModelMultiCore::syncAgents()
{
 repast::RepastProcess::instance()->synchronizeAgentStatus
  <
  ENISI::Agent,
    RepastHPCDemoAgentPackage, 
    RepastHPCDemoAgentPackageProvider, 
    RepastHPCDemoAgentPackageReceiver
  >(context, *provider, *receiver, *receiver);
  
  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    RepastHPCDemoAgentPackage, 
    RepastHPCDemoAgentPackageProvider, 
    RepastHPCDemoAgentPackageReceiver
  >(*provider, *receiver);
}
