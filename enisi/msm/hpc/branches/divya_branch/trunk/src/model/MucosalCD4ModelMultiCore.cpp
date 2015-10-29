#include "MucosalCD4ModelMultiCore.h"

//BOOST_CLASS_EXPORT_GUID(
  //repast::SpecializedProjectionInfoPacket<repast::RepastEdgeContent<ENISIAgent> >, 
  //"SpecializedProjectionInfoPacket_EDGE");

MucosalCD4ModelMultiCore::MucosalCD4ModelMultiCore(
    repast::Properties* p, boost::mpi::communicator* comm) : 
  MucosalCD4ModelBase(p),
  world(comm), 
  context(comm)
{
  props = p;

  initializeRandom(*props, comm);

  /* Initialize the output file */
  if(repast::RepastProcess::instance()->rank() == 0) 
    props->writeToSVFile("./output/record.csv");

  provider = new RepastHPCDemoAgentPackageProvider(&context);
  receiver = new RepastHPCDemoAgentPackageReceiver(&context);
  
  //std::string networkName = "agentNetwork";
  /*
   'Directed' networks allow connections that go only in one direction, such as
    from A to B but not B to A;
    'Undirected' networks mean that a connection between two agents is
    reciprocal: if A is connected to B, then B is connected to A
  */
  //bool isDirected = false;
  //agentNetwork = new Network(networkName, isDirected, &edgeContentManager);
  //context.addProjection(agentNetwork);

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
  AgentFactory factory(&context);

  createBacteria();
  createTcells();
  createDendritics();
  
  return; 
} 

void MucosalCD4ModelMultiCore::createBacteria()
{
  AgentFactory factory(&context);

  int bacteriaCount = repast::strToInt(props->getProperty("bacteria.count"));
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int numOfBacteriaPerProcess = bacteriaCount / worldSize;

  if (bacteriaCount % worldSize)
    std::cerr << "Bacteria count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";
  
  for (int i = 0; i < numOfBacteriaPerProcess; i++) 
  {
    //TODO deal with raw pointer
    Bacteria * b = (Bacteria *) factory.create("Bacteria");
    /* 1/2 of bacteria created should be infectious (the default) while the
     * other 1/2 should be tolerogenic */
    if (i >= bacteriaCount/2) { b->setState(AgentState::TOLEGENIC); } 
  }
}

void MucosalCD4ModelMultiCore::createTcells()
{
  AgentFactory factory(&context);

  int tCellCount = repast::strToInt(props->getProperty("tcell.count"));
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int numOfTcellsPerProcess = tCellCount / worldSize;

  if (tCellCount % worldSize)
    std::cerr << "Tcell count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  for (int i = 0; i < numOfTcellsPerProcess; i++) 
  {
    Tcell * t = (Tcell *) factory.create("Tcell"); //TODO deal with raw pointer

    t->addCytoLayer("IL6", cytokines["IL6"]);
    t->addCytoLayer("IL12", cytokines["IL12"]);
    t->addCytoLayer("TGFb", cytokines["TGFb"]);
    t->addCytoLayer("IL17", cytokines["IL17"]);
    t->addCytoLayer("IL10", cytokines["IL10"]);
    t->addCytoLayer("IFNg", cytokines["IFNg"]);
  }
}

void MucosalCD4ModelMultiCore::createDendritics()
{
  AgentFactory factory(&context);

  int dendriticCount = repast::strToInt(props->getProperty("dendritic.count"));
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int numOfDendriticsPerProcess = dendriticCount / worldSize;

  if (dendriticCount % worldSize)
    std::cerr << "Dendritic count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  for (int i = 0; i < numOfDendriticsPerProcess; i++) 
  {
    //TODO deal with raw pointer
    Dendritics * d = (Dendritics *) factory.create("Dendritics");
    d->addCytoLayer("IL6",  cytokines["IL6"]);
    d->addCytoLayer("IL12", cytokines["IL12"]);
    d->addCytoLayer("TGFb", cytokines["TGFb"]);
  }

}

void MucosalCD4ModelMultiCore::act() 
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
  
  /* This code is supposedly necessary, but causes a segfault */
  //repast::RepastProcess::instance()->synchronizeProjectionInfo
  //<
    //ENISIAgent, 
    //RepastHPCDemoAgentPackage, 
    //RepastHPCDemoAgentPackageProvider, 
    //RepastHPCDemoAgentPackageReceiver
  //>(context, *provider, *receiver, *receiver);

  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    RepastHPCDemoAgentPackage, 
    RepastHPCDemoAgentPackageProvider, 
    RepastHPCDemoAgentPackageReceiver
  >(*provider, *receiver);

  diffuse();
  summation();
}

/*void MucosalCD4ModelMultiCore::debugPrintAllAgents()*/
//{
  //int initialRank = 0;
  //int worldSize = repast::RepastProcess::instance()->worldSize();
  //int countOfAgents = ENISIAgent::getAgentCount() * worldSize;

  //if (repast::RepastProcess::instance()->rank() == initialRank) 
  //{
    //Grid * discreteSpace = static_cast<Grid*>(context.getProjection("grid"));
    //std::cout << "LOCAL AGENTS:" << std::endl;
    //for(int r = 0; r < worldSize; r++)
    //{
      //for(int i = 0; i < countOfAgents; i++)
      //{
	//repast::AgentId toDisplay(i, r, 0);
	//ENISIAgent* agent = context.getAgent(toDisplay);

	//if((agent != 0) && (agent->getId().currentRank() == initialRank))
	//{
	  //std::vector<int> agentLoc;
	  //discreteSpace->getLocation(agent->getId(), agentLoc);
	  //repast::Point<int> agentLocation(agentLoc);
	  //std::cout << "\t" << agent->classname() << " " << agent->getId() << " AT " << agentLocation << std::endl;
	//}
      //}
    //}
    
    //std::cout << "NON LOCAL AGENTS:" << std::endl;
    //for(int r = 0; r < worldSize; r++)
    //{
      //for(int i = 0; i < countOfAgents; i++)
      //{
	//repast::AgentId toDisplay(i, r, 0);
	//ENISIAgent* agent = context.getAgent(toDisplay);
	//if((agent != 0) && (agent->getId().currentRank() != initialRank))
	//{
	  //std::vector<int> agentLoc;
	  //discreteSpace->getLocation(agent->getId(), agentLoc);
	  //repast::Point<int> agentLocation(agentLoc);
	  //std::cout << "\t" << agent->classname() << " " << agent->getId() << " AT " << agentLocation << std::endl;
	//}
      //}
    //}
  //}

/*}*/

/*void MucosalCD4ModelMultiCore::act() */
//{ 
  //repast::ScheduleRunner& runner = 
    //repast::RepastProcess::instance()->getScheduleRunner();

 //for (Context::const_iterator agent = context.begin();
       //agent != context.end(); ++agent) 
  //{
    //(*agent)->act();

    //repast::Point <int> gridLoc = (*agent)->getGridLocation();

    //int currentTick = runner.currentTick();
    
    //double x = (*agent)->getX();
    //double y = (*agent)->getY();

    //ENISIAgent::Color color = (*agent)->getColor();

    //SiloWriter::writer().addCycleCoordinates(currentTick, x, y, color);
  //}
  //if(repast::RepastProcess::instance()->rank() == 0){
    //std::cout << "TICK " << runner.currentTick() << "\n";
  //}
/*}*/

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
      std::vector<ENISIAgent*> agents;        
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
      ENISIAgent, 
      RepastHPCDemoAgentPackage, 
      RepastHPCDemoAgentPackageProvider, 
      RepastHPCDemoAgentPackageReceiver
    >(context, req, *provider, *receiver, *receiver);
}
