#include "repast_hpc/RepastProcess.h"

#include "HPyloriModel.h"

#include "grid/Properties.h"

#include "compartment/Compartment.h"

#include "agent/BacteriaGroup.h"
#include "agent/DendriticsGroup.h"
#include "agent/EpithelialCellGroup.h"
#include "agent/HPyloriGroup.h"
#include "agent/TcellGroup.h"
#include "agent/MacrophageGroup.h"

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

  double concentration;

  if (!mpProperties->getValue("lumen.HPylori.concentration", concentration)) concentration = 0;
  new HPyloriGroup(mp_lumen, concentration);

  if (!mpProperties->getValue("lumen.Bacteria.concentration", concentration)) concentration = 0;
  new BacteriaGroup(mp_lumen, concentration);

  mp_lumen->synchronizeCells();
}

void HPModel::initialize_epithilium()
{
  mp_epithilium = ENISI::Compartment::instance(ENISI::Compartment::epithilium);

  double concentration;

  if (!mpProperties->getValue("epithilium.EpithelialCell.concentration", concentration)) concentration = 0;
  new EpithelialCellGroup(mp_epithilium, concentration);

  if (!mpProperties->getValue("epithilium.Dendritics.concentration", concentration)) concentration = 0;
  new DendriticsGroup(mp_epithilium, concentration);

  mp_epithilium->synchronizeCells();
}

void HPModel::initialize_lamina_propria()
{
  mp_lamina_propria = ENISI::Compartment::instance(ENISI::Compartment::lamina_propria);

  double concentration;

  if (!mpProperties->getValue("mp_lamina_propria.Dendritics.concentration", concentration)) concentration = 0;
  new DendriticsGroup(mp_lamina_propria, concentration);

  if (!mpProperties->getValue("mp_lamina_propria.Tcell.concentration", concentration)) concentration = 0;
  new TcellGroup(mp_lamina_propria, concentration);

  if (!mpProperties->getValue("mp_lamina_propria.HPylori.concentration", concentration)) concentration = 0;
  new HPyloriGroup(mp_lamina_propria, concentration);

  if (!mpProperties->getValue("mp_lamina_propria.Bacteria.concentration", concentration)) concentration = 0;
  new BacteriaGroup(mp_lamina_propria, concentration);

  if (!mpProperties->getValue("mp_lamina_propria.macrophages.concentration", concentration)) concentration = 0;
  new MacrophageGroup(mp_lamina_propria, concentration);

  mp_epithilium->synchronizeCells();

  mp_lamina_propria->addCytokine("IL6");
  mp_lamina_propria->addCytokine("TGFb");
  mp_lamina_propria->addCytokine("IL12");
  mp_lamina_propria->addCytokine("IL17");
  mp_lamina_propria->addCytokine("IL10");
  mp_lamina_propria->addCytokine("IFNg");

  mp_lamina_propria->initializeDiffuserData();
}

void HPModel::initialize_gastric_lymph_node()
{
  mp_gastric_lymph_node = ENISI::Compartment::instance(ENISI::Compartment::gastric_lymph_node);
}


void HPModel::initSchedule(repast::ScheduleRunner & runner) 
{
  // We need to schedule diffusion and agent interaction.

  runner.scheduleEvent(0.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::recordResults)));

  runner.scheduleEvent(0.8, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::act)));
  runner.scheduleEvent(0.9, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::diffuse)));
  runner.scheduleEvent(1.0, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::recordResults)));

  /* Schedule will repeat infinitely without a stop */
  double stopAt = 1;
  Properties::instance(Properties::run)->getValue("stop.at", stopAt);
  runner.scheduleStop(stopAt); 

  return;
}


void HPModel::act()
{
  mp_lumen->act();
  mp_epithilium->act();
  mp_lamina_propria->act();
  mp_gastric_lymph_node->act();

  return;
}

void HPModel::diffuse() 
{
  mp_lamina_propria->diffuse();
}

void HPModel::recordResults()
{
  mp_lumen->write("\t");
  mp_epithilium->write("\t");
  mp_lamina_propria->write("\t");
  mp_gastric_lymph_node->write("\t");

  return;
}
