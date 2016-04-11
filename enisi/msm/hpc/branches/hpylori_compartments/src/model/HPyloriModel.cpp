#include "repast_hpc/RepastProcess.h"

#include "HPyloriModel.h"

#include "grid/Properties.h"

#include "compartment/Compartment.h"

#include "agent/BacteriaGroup.h"
#include "agent/DendriticsGroup.h"
#include "agent/EpithelialCellGroup.h"
#include "agent/HPyloriGroup.h"

#include "DataWriter/LocalFile.h"

using namespace ENISI;

HPModel::~HPModel()
{
  if (mp_lumen != NULL) delete mp_lumen;
  if (mp_epithilium != NULL) delete mp_epithilium;
  if (mp_lamina_propria != NULL) delete mp_lamina_propria;
  if (mp_gastric_lymph_node != NULL) delete mp_gastric_lymph_node;
}

HPModel::HPModel():
  mp_lumen(NULL),
  mp_epithilium(NULL),
  mp_lamina_propria(NULL),
  mp_gastric_lymph_node(NULL),
  mpProperties(Properties::instance(Properties::model))
{ 
  ENISI::init();

  initialize_lumen();
  initialize_epithilium();
  initialize_lamina_propria();
  initialize_gastric_lymph_node();

}

void HPModel::initialize_lumen()
{
  mp_lumen = ENISI::Compartment::instance(ENISI::Compartment::lumen);

  size_t count;

  if (!mpProperties->getValue("lumen.HPylori.count", count)) count = 0;
  new HPyloriGroup(mp_lumen, count);

  if (!mpProperties->getValue("lumen.Bacteria.count", count)) count = 0;
  new BacteriaGroup(mp_lumen, count);

  mp_lumen->synchronizeCells();
  mp_lumen->write(LocalFile::instance(mp_lumen->getName())->stream(), "\t", mp_lumen);
}

void HPModel::initialize_epithilium()
{
  mp_epithilium = ENISI::Compartment::instance(ENISI::Compartment::epithilium);

  size_t count;

  if (!mpProperties->getValue("epithilium.EpithelialCell.count", count)) count = 0;
  new EpithelialCellGroup(mp_epithilium, count);

  if (!mpProperties->getValue("epithilium.Dendritics.count", count)) count = 0;
  new DendriticsGroup(mp_epithilium, count);

  mp_epithilium->synchronizeCells();
  mp_epithilium->write(LocalFile::instance(mp_epithilium->getName())->stream(), "\t", mp_epithilium);
}

void HPModel::initialize_lamina_propria()
{
  mp_lamina_propria = ENISI::Compartment::instance(ENISI::Compartment::lamina_propria);

  mp_lamina_propria->addCytokine("IL6");
  mp_lamina_propria->addCytokine("TGFb");
  mp_lamina_propria->addCytokine("IL12");
  mp_lamina_propria->addCytokine("IL17");
  mp_lamina_propria->addCytokine("IL10");
  mp_lamina_propria->addCytokine("IFNg");

  mp_lamina_propria->initializeDiffuserData();
  mp_lamina_propria->write(LocalFile::instance(mp_lamina_propria->getName())->stream(), "\t", mp_lamina_propria);
}

void HPModel::initialize_gastric_lymph_node()
{
  mp_gastric_lymph_node = ENISI::Compartment::instance(ENISI::Compartment::gastric_lymph_node);

  mp_gastric_lymph_node->write(LocalFile::instance(mp_gastric_lymph_node->getName())->stream(), "\t", mp_gastric_lymph_node);
}


void HPModel::initSchedule(repast::ScheduleRunner & runner) 
{
  /*
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
  */

  /* Schedule will repeat infinitely without a stop */
  int stopAt = 1;
  Properties::instance(Properties::run)->getValue("stop.at", stopAt);
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
}

void HPModel::recordResults()
{
  return;
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
