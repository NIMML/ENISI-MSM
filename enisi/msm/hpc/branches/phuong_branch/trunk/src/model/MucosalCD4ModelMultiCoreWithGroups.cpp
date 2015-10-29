#include "MucosalCD4ModelMultiCoreWithGroups.h"

MucosalCD4ModelMultiCoreWithGroups::MucosalCD4ModelMultiCoreWithGroups(
    repast::Properties* p, boost::mpi::communicator* c)
  : MucosalCD4ModelMultiCore(p, c) { }

void MucosalCD4ModelMultiCoreWithGroups::init() 
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
  AgentFactory factory(&context);

  createBacteria();
  createTcells();
  createDendritics();
  
  return; 
} 

void MucosalCD4ModelMultiCoreWithGroups::setUpCytokines()
{
  double evaporationConst = 0.95,
	 diffusionConst = 0.6;
  bool toroidal = false;

  Cytokines::CytoMap & cytomap = Cytokines::instance().map();

  cytomap["IL6"] = new ValueLayer("IL6", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytomap["IL6"], evaporationConst, diffusionConst, toroidal));

  cytomap["TGFb"] = new ValueLayer("TGFb", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytomap["TGFb"], 0.98, diffusionConst, toroidal));

  cytomap["IL12"] = new ValueLayer("IL12", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytomap["IL12"], 0.98, diffusionConst, toroidal));

  cytomap["IL17"] = new ValueLayer("IL17", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytomap["IL17"], 0.98, diffusionConst, toroidal));

  cytomap["IL10"] = new ValueLayer("IL10", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytomap["IL10"], 0.98, diffusionConst, toroidal));

  cytomap["IFNg"] = new ValueLayer("IFNg", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytomap["IFNg"], 0.98, diffusionConst, toroidal));

  setUpCytokineMultipliers();
  summation();
}

void MucosalCD4ModelMultiCoreWithGroups::summation() 
{
  Cytokines::CytoMap & cytomap = Cytokines::instance().map();

  for (int x = 0; x < width; ++x) 
  {
    for (int y = 0; y < height; ++y) 
    {
      double value = 0.0f;
      for(std::map<std::string, ValueLayer*>::iterator it = cytomap.begin(); 
	  it != cytomap.end(); it++) 
      {
	std::string cytokineName = it->first;
	ValueLayer* cytokineValueLayer = it->second;

	int currentVal = cytokineValueLayer->get(Point<int>(x, y));
	int multiplier = cytokineMultipliers[cytokineName];
	value += currentVal * multiplier;
      }
      vl->set(value, Point<int>(x, y));
    }
  }
}

void MucosalCD4ModelMultiCoreWithGroups::act() 
{
 int initialRank = 0;
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  if(repast::RepastProcess::instance()->rank() == initialRank) 
    std::cout << " TICK " << runner.currentTick() << std::endl;

  int worldSize = repast::RepastProcess::instance()->worldSize();
  int countOfAgents = ENISIAgent::getAgentCount() * worldSize;

  std::vector<ENISIAgent*> agents;
  context.selectAgents(
    repast::SharedContext<ENISIAgent>::LOCAL, countOfAgents, agents
  );

  std::vector<ENISIAgent*>::iterator it = agents.begin();

  int ThNaiveCount = 0;
  int Th1Count = 0;
  int Th17Count = 0;
  int TregCount = 0;

  while(it != agents.end())
  {
    if ( (*it)->classname() == "Tcell" )
    {
      switch ((*it)->getState()) {
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

    (*it)->act();

    int currentTick = runner.currentTick();

    double x = (*it)->getX();
    double y = (*it)->getY();

    ENISIAgent::Color color = (*it)->getColor();

    SiloWriter::writer().addCycleCoordinates(currentTick, x, y, color);

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

 repast::RepastProcess::instance()->synchronizeAgentStatus
  <
    ENISIAgent, 
    RepastHPCDemoAgentPackage, 
    RepastHPCDemoAgentPackageProvider, 
    RepastHPCDemoAgentPackageReceiver
  >(context, *provider, *receiver, *receiver);
    //RepastHPCDemoAgentPackageReceiver
  /* This code is supposedly necessary, but causes a segfault */
  //repast::RepastProcess::instance()->synchronizeProjectionInfo
  //<
    //ENISIAgent, 
    //RepastHPCDemoAgentPackage, 
    //RepastHPCDemoAgentPackageProvider, 
    //RepastHPCDemoAgentPackageReceiver
  //>(context, *provider, *receiver, *receiver);

  /*>(context, *provider, *receiver, *receiver);*/
  
  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    RepastHPCDemoAgentPackage, 
    RepastHPCDemoAgentPackageProvider, 
    RepastHPCDemoAgentPackageReceiver
  >(*provider, *receiver);

  diffuse();
  summation();
}

void MucosalCD4ModelMultiCoreWithGroups::createBacteria()
{
  AgentFactory factory(&context);

  unsigned int bacteriaCount 
    = repast::strToInt(props->getProperty("bacteria.count"));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (bacteriaCount % worldSize)
    std::cerr << "Bacteria count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  unsigned int numOfBacteriaPerProcess = bacteriaCount / worldSize;

  factory.create("BacteriaGroup", numOfBacteriaPerProcess);
}

void MucosalCD4ModelMultiCoreWithGroups::createTcells()
{
  AgentFactory factory(&context);

  unsigned int tcellCount 
    = repast::strToInt(props->getProperty("tcell.count"));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (tcellCount % worldSize)
    std::cerr << "Tcell count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  unsigned int numOfTcellsPerProcess = tcellCount / worldSize;

  factory.create("TcellGroup", numOfTcellsPerProcess);
}

void MucosalCD4ModelMultiCoreWithGroups::createDendritics()
{
  AgentFactory factory(&context);

  unsigned int dendriticCount 
      = repast::strToInt(props->getProperty("dendritic.count"));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (dendriticCount % worldSize)
    std::cerr << "dendritic count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  unsigned int numOfDendriticsPerProcess = dendriticCount / worldSize;

  factory.create("DendriticsGroup", numOfDendriticsPerProcess);
}
