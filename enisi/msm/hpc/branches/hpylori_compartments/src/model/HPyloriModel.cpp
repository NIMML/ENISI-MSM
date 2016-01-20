#include "HPyloriModel.h"
#include "agent/AgentFactory.h"
#include "compartment/CellLayer.h"
#include "diffuser/ParallelDiffuser.h" 

HPModel::~HPModel()
{
  /* Context deals with these pointers automatically in its destructor */
  /* Don't delete them unless you want a segmentation fault */
  //delete _p_valueLayer;
}

HPModel::HPModel(const repast::Properties * p_props) 
  : _p_props(p_props),
    _height(repast::strToInt(_p_props->getProperty("grid.height"))), 
    _width(repast::strToInt(_p_props->getProperty("grid.width"))),
    _dimensions(
      repast::Point<double>(0, 0), repast::Point<double>(_width, _height)
    ),
    _lumen(_dimensions),
    _epithelium(_dimensions),
    _gastricLymphNode(_dimensions),
    _laminaPropria(_dimensions),
    _p_lumenCellContext(_lumen.cellLayer()->context()),
    _provider(_p_lumenCellContext),
    _receiver(_p_lumenCellContext)
{ 


  setUpValueLayer();

  setUpCytokines();

  createAgentGroup("Bacteria", "bacteria.count");
  createAgentGroup("Tcell", "tcell.count");
  createAgentGroup("Dendritics", "dendritic.count");
}

void HPModel::initSchedule(repast::ScheduleRunner & runner) 
{
  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<HPModel> (
      this, &HPModel::requestAgents)));

  double actStart = 2, interval = 1;
  runner.scheduleEvent(actStart, interval, 
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<HPModel>(
      	this, &HPModel::act)
    )
  );

  double updateStart = 2.1;
  runner.scheduleEvent(updateStart, interval, 
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<HPModel>(
      	this, &HPModel::updateReferenceDiffuserGrid)
    )
  );


  runner.scheduleEndEvent(
    repast::Schedule::FunctorPtr(
      new repast::MethodFunctor<HPModel> (
      	this, &HPModel::recordResults)
    )
  );

  /*Schedule will repeat infinitely without a stop*/
  int stopAt = repast::strToInt(_p_props->getProperty("stop.at"));
  runner.scheduleStop(stopAt); 

  return;
}


void HPModel::requestAgents()
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
      _p_lumenCellContext->selectAgents(agents);

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
      AgentGroupPackage, 
      AgentGroupPackageProvider, 
      AgentGroupPackageReceiver
    >(*_p_lumenCellContext, req, _provider, _receiver, _receiver);

  _lumen.requestAgents();
}

void HPModel::act()
{
  int startRank = 0;
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  if(repast::RepastProcess::instance()->rank() == startRank) 
    std::cout << " TICK " << runner.currentTick() << std::endl;

  std::vector<ENISIAgent*> remoteAgents;
  _p_lumenCellContext->selectAgents(
    AgentGroup::Context::NON_LOCAL, 
    remoteAgents
  );

  std::vector<ENISIAgent*> localAgents;
  _p_lumenCellContext->selectAgents(
    AgentGroup::Context::LOCAL, 
    localAgents
  );

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

void HPModel::syncAgents()
{
  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    AgentGroupPackage, 
    AgentGroupPackageProvider, 
    AgentGroupPackageReceiver
  >(_provider, _receiver);
}

void HPModel::diffuse() 
{
  _lumen.diffuse();
/*  for (size_t i = 0; i < _valueDiffusers.size(); ++i) */
  //{
    //_valueDiffusers[i]->diffuse();
  /*}*/
}

void HPModel::updateReferenceDiffuserGrid()
{
  _lumen.updateReferenceDiffuserGrid();
}

void HPModel::recordResults()
{
  return;
}

void HPModel::setUpValueLayer()
{
  std::string name = "Summation";
  bool dense = true;

  _p_valueLayer = new ValueLayer(name, _dimensions, dense);
  _p_lumenCellContext->addValueLayer(_p_valueLayer);
}

void HPModel::setUpCytokines()
{
  double evaporation = 0.98,
	 diffusion = 0.6;
  bool toroidal = false;

  Cytokines::CytoMap & cytomap = Cytokines::instance().map();

  cytomap["IL6"] = new ParallelDiffuser(_lumen, 0.95, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL6"]);

  cytomap["TGFb"] = new ParallelDiffuser(_lumen, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["TGFb"]);

  cytomap["IL12"] = new ParallelDiffuser(_lumen, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL12"]);

  cytomap["IL17"] = new ParallelDiffuser(_lumen, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL17"]);

  cytomap["IL10"] = new ParallelDiffuser(_lumen, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IL10"]);

  cytomap["IFNg"] = new ParallelDiffuser(_lumen, evaporation, diffusion, toroidal);
  _valueDiffusers.push_back(cytomap["IFNg"]);

  setUpCytokineMultipliers();
  summation();
}

void HPModel::setUpCytokineMultipliers()
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

void HPModel::summation() 
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

	int currentVal = cytokineValueLayer->getCoordValue(repast::Point<int>(x, y));
	int multiplier = _cytokineMultipliers[cytokineName];
	value += currentVal * multiplier;
      }
      _p_valueLayer->set(value, repast::Point<int>(x, y));
    }
  }
}

void HPModel::createAgentGroup(const std::string & agentName, const std::string & agentCountProperty)
{
  boost::uintmax_t count = 
    strToUIntMax(_p_props->getProperty(agentCountProperty));

  int worldSize = repast::RepastProcess::instance()->worldSize();

  boost::uintmax_t countPerProcess = count / worldSize;
  boost::uintmax_t remainder = count % worldSize;

  /* Deal with uneven agent division by adding 1 to agent count up to the
     total remainder */
  unsigned int rank = repast::RepastProcess::instance()->rank();
  if ( remainder && (remainder > rank) ) countPerProcess++;

  AgentGroupFactory::create(
    agentName + "Group", &_lumen, countPerProcess
  );
}

boost::uintmax_t strToUIntMax(const std::string val)
{
  boost::uintmax_t i;

  std::istringstream stream(val);

  if ( ! (stream >> i) )
  {
    std::string err = 
      "String '" + val + "' cannot be converted to boost::uintmax_t";
    throw std::invalid_argument(err);
  }

  return i;
}
