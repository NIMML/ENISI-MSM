#include "MucosalCD4ModelMultiCoreWithGroups.h"

MucosalCD4ModelMultiCoreWithGroups::~MucosalCD4ModelMultiCoreWithGroups()
{
  delete _p_dendritics;
  delete _p_tcells;
  delete _p_bacteria;

  delete _p_valueLayer;
}

MucosalCD4ModelMultiCoreWithGroups::MucosalCD4ModelMultiCoreWithGroups(
    repast::Properties * p_props, boost::mpi::communicator * p_comm __attribute__((unused)))
  : _p_props(p_props), 
    _height(repast::strToInt(_p_props->getProperty("grid.height"))), 
    _width(repast::strToInt(_p_props->getProperty("grid.width"))),
    _dimensions(
      repast::Point<double>(0, 0), 
      repast::Point<double>(_width, _height)
    ),
    _p_compartment(new ENISI::Compartment(_dimensions))
{ }

void MucosalCD4ModelMultiCoreWithGroups::init() 
{
  setUpValueLayer();

  setUpCytokines();

  createBacteria();
  createTcells();
  createDendritics();
  return; 
} 

void MucosalCD4ModelMultiCoreWithGroups::setUpValueLayer()
{
  std::string name = "Summation";
  bool dense = true;

  _p_valueLayer = new ValueLayer(name, _dimensions, dense);
  _p_compartment->cellLayer()->addValueLayer(_p_valueLayer);
}

void MucosalCD4ModelMultiCoreWithGroups::setUpCytokines()
{
  double evaporation = 0.98,
	 diffusion = 0.6;
  bool toroidal = false;

  Cytokines::CytoMap & cytomap = Cytokines::instance().map();

  DiffuserLayer * p_diffusionLayer = _p_compartment->newDiffuserLayer();

  cytomap["IL6"] = new Diffuser(p_diffusionLayer, 0.95, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL6"]);

  cytomap["TGFb"] = new Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["TGFb"]);

  cytomap["IL12"] = new Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL12"]);

  cytomap["IL17"] = new Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL17"]);

  cytomap["IL10"] = new Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL10"]);

  cytomap["IFNg"] = new Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IFNg"]);

  setUpCytokineMultipliers();
  summation();
}

void MucosalCD4ModelMultiCoreWithGroups::setUpCytokineMultipliers()
{
  /* Yongguo used these values to make the model fit the data. 
  * They don't have any inherent meaning otherwise */
  _cytokineMultipliers["IL6"] = 10000;
  _cytokineMultipliers["TGFb"] = 100;
  _cytokineMultipliers["IL12"] = 1;
  _cytokineMultipliers["IL10"] = 0;
  _cytokineMultipliers["IL17"] = 0;
  _cytokineMultipliers["IFNg"] = 0;
}

void MucosalCD4ModelMultiCoreWithGroups::summation() 
{
  Cytokines::CytoMap & cytomap = Cytokines::instance().map();

  for (int x = 0; x < _width; ++x) 
  {
    for (int y = 0; y < _height; ++y) 
    {
      double value = 0.0f;
      for(std::map<std::string, Diffuser*>::iterator it = cytomap.begin(); 
	  it != cytomap.end(); it++) 
      {
	std::string cytokineName = it->first;
	Diffuser * cytokineValueLayer = it->second;

	int currentVal = cytokineValueLayer->getCoordValue(Point<int>(x, y));
	int multiplier = _cytokineMultipliers[cytokineName];
	value += currentVal * multiplier;
      }
      _p_valueLayer->set(value, Point<int>(x, y));
    }
  }
}

void MucosalCD4ModelMultiCoreWithGroups::createBacteria()
{

  unsigned int bacteriaCount = 
    repast::strToInt(_p_props->getProperty("bacteria.count"));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (bacteriaCount % worldSize)
    std::cerr << "Bacteria count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  unsigned int numOfBacteriaPerProcess = bacteriaCount / worldSize;

  _p_bacteria = AgentGroupFactory::create(
    "BacteriaGroup", _p_compartment, numOfBacteriaPerProcess
  );
}

void MucosalCD4ModelMultiCoreWithGroups::createTcells() 
{
  unsigned int tcellCount 
    = repast::strToInt(_p_props->getProperty("tcell.count"));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (tcellCount % worldSize)
    std::cerr << "Tcell count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  unsigned int numOfTcellsPerProcess = tcellCount / worldSize;

  _p_tcells = 
    AgentGroupFactory::create("TcellGroup", _p_compartment, numOfTcellsPerProcess);
  return;
}

void MucosalCD4ModelMultiCoreWithGroups::createDendritics()
{

  unsigned int dendriticCount 
      = repast::strToInt(_p_props->getProperty("dendritic.count"));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  if (dendriticCount % worldSize)
    std::cerr << "dendritic count not cleanly divisible by world size. "
      << "This will result in lost agents.\n";

  unsigned int numOfDendriticsPerProcess = dendriticCount / worldSize;

  AgentGroupFactory::create(
    "DendriticsGroup", _p_compartment, numOfDendriticsPerProcess
  );
}
void MucosalCD4ModelMultiCoreWithGroups::initSchedule(
    repast::ScheduleRunner & runner) 
{
  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<MucosalCD4ModelMultiCoreWithGroups> (
      this, &MucosalCD4ModelMultiCoreWithGroups::requestAgents)));

  double actStart = 2, interval = 1;
  runner.scheduleEvent(actStart, interval, 
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<MucosalCD4ModelMultiCoreWithGroups>(
      	this, &MucosalCD4ModelMultiCoreWithGroups::act)
    )
  );
  runner.scheduleEndEvent(
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<MucosalCD4ModelMultiCoreWithGroups> (
      	this, &MucosalCD4ModelMultiCoreWithGroups::recordResults)
    )
  );

  /*Schedule will repeat infinitely without a stop*/
  int stopAt = repast::strToInt(_p_props->getProperty("stop.at"));
  runner.scheduleStop(stopAt); 

  return; 
} 

void MucosalCD4ModelMultiCoreWithGroups::act() 
{
  int startRank = 0;
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  if(repast::RepastProcess::instance()->rank() == startRank) 
    std::cout << " TICK " << runner.currentTick() << std::endl;

  std::vector<CellLayer::AgentType*> remoteAgents = 
    _p_compartment->cellLayer()->selectRemoteAgents();

  std::vector<CellLayer::AgentType*> localAgents =
    _p_compartment->cellLayer()->selectLocalAgents();


  std::vector<ENISIAgent*>::iterator it = localAgents.begin();

  while(it != localAgents.end())
  {
    (*it)->act();
    it++;
  }

  syncAgents();
  diffuse();
  summation();
  return;
}

void MucosalCD4ModelMultiCoreWithGroups::syncAgents()
{
  _p_compartment->cellLayer()->synchronizeAgentStates();
}

void MucosalCD4ModelMultiCoreWithGroups::diffuse() 
{
  for (size_t i = 0; i < _valueDiffusers.size(); ++i) 
  {
    _valueDiffusers[i]->diffuse();
  }
}

void MucosalCD4ModelMultiCoreWithGroups::requestAgents()
{
  int rank = repast::RepastProcess::instance()->rank();

  int worldSize = repast::RepastProcess::instance()->worldSize();

  repast::AgentRequest req(rank);

  /* For each process */
  for(int i = 0; i < worldSize; i++)
  {                     
    if(i != rank)// ... except this one
    {                                      
      /* Choose all agents */
      std::vector<CellLayer::AgentType*> agents =
	_p_compartment->cellLayer()->selectAllAgents();

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

  _p_compartment->cellLayer()->requestAgents();

  return;
}

void MucosalCD4ModelMultiCoreWithGroups::recordResults()
{
  return;
}
