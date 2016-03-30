#include "HPyloriModel.h"
#include "agent/AgentFactory.h"
#include "compartment/CellLayer.h"
#include "diffuser/ParallelDiffuser.h" 
#include "compartment/Compartment.h"
#include "agent/ENISIAgent.h"

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
    )
{ 
  ENISI::Compartment::instance(ENISI::Compartment::lumen);
  // setUpValueLayer();

  // setUpCytokines();

  // createAgentGroup("Bacteria", "bacteria.count");
  // createAgentGroup("Tcell", "tcell.count");
  // createAgentGroup("Dendritics", "dendritic.count");
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
          /* Choose all agents */
          std::vector< ENISI::Agent * > agents;
          // agents =ENISI::Compartment::instance(ENISI::Compartment::lumen)->cellLayer()->selectAllAgents();

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

  // ENISI::Compartment::instance(ENISI::Compartment::lumen)->cellLayer()->requestAgents();
  // ENISI::Compartment::instance(ENISI::Compartment::lumen)->requestDiffuserAgents();
}

void HPModel::act()
{
  int startRank = 0;
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  if(repast::RepastProcess::instance()->rank() == startRank) 
    std::cout << " TICK " << runner.currentTick() << std::endl;

  std::vector< ENISI::Agent * > remoteAgents;
  // remoteAgents = ENISI::Compartment::instance(ENISI::Compartment::lumen)->cellLayer()->selectRemoteAgents();

  std::vector< ENISI::Agent * > localAgents;
  // localAgents = ENISI::Compartment::instance(ENISI::Compartment::lumen)->cellLayer()->selectLocalAgents();

  std::vector< ENISI::Agent * >::iterator it = localAgents.begin();

  while(it != localAgents.end())
  {
    // (*it)->act();
    it++;
  }

  syncAgents();
  diffuse();

  return;
}

void HPModel::syncAgents()
{
  // ENISI::Compartment::instance(ENISI::Compartment::lumen)->cellLayer()->synchronizeAgentStates();
}

void HPModel::diffuse() 
{
  ENISI::Compartment::instance(ENISI::Compartment::lumen)->diffuse();
/*  for (size_t i = 0; i < _valueDiffusers.size(); ++i) */
  //{
    //_valueDiffusers[i]->diffuse();
  /*}*/
}

void HPModel::updateReferenceDiffuserGrid()
{
  ENISI::Compartment::instance(ENISI::Compartment::lumen)->updateReferenceDiffuserGrid();
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
  // ENISI::Compartment::instance(ENISI::Compartment::lumen)->cellLayer()->addValueLayer(_p_valueLayer);
}

void HPModel::setUpCytokines()
{
  ENISI::Compartment * pCompartment = ENISI::Compartment::instance(ENISI::Compartment::lamina_propria);

  pCompartment->addCytokine("IL6");
  pCompartment->addCytokine("TGFb");
  pCompartment->addCytokine("IL12");
  pCompartment->addCytokine("IL17");
  pCompartment->addCytokine("IL10");
  pCompartment->addCytokine("IFNg");
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

  ENISI::AgentGroupFactory::create(
    agentName + "Group", ENISI::Compartment::instance(ENISI::Compartment::lumen), countPerProcess
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
