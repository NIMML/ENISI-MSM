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
#include "DataWriter/LocalFile.h"

using namespace ENISI;

HPModel::~HPModel()
{
  if (mp_lumen != NULL) delete mp_lumen;
  if (mp_epithilium != NULL) delete mp_epithilium;
  if (mp_lamina_propria != NULL) delete mp_lamina_propria;
  if (mp_gastric_lymph_node != NULL) delete mp_gastric_lymph_node;

  LocalFile::close();
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
}

void HPModel::initialize_epithilium()
{
  mp_epithilium = ENISI::Compartment::instance(ENISI::Compartment::epithilium);

  double concentration;

  if (!mpProperties->getValue("epithilium.EpithelialCell.concentration", concentration)) concentration = 0;
  new EpithelialCellGroup(mp_epithilium, concentration);

  if (!mpProperties->getValue("epithilium.Dendritics.concentration", concentration)) concentration = 0;
  new DendriticsGroup(mp_epithilium, concentration);
}

void HPModel::initialize_lamina_propria()
{
  mp_lamina_propria = ENISI::Compartment::instance(ENISI::Compartment::lamina_propria);

  double concentration;

  if (!mpProperties->getValue("lamina_propria.Dendritics.concentration", concentration)) concentration = 0;
  new DendriticsGroup(mp_lamina_propria, concentration);

  //if (!mpProperties->getValue("lamina_propria.Tcell.concentration", concentration)) concentration = 0;
  //new TcellGroup(mp_lamina_propria, concentration);
  
  if (!mpProperties->getValue("lamina_propria.Tcell.naive.concentration", concentration)) concentration = 0;
  new TcellGroup(mp_lamina_propria, concentration3);
 
  if (!mpProperties->getValue("lamina_propria.HPylori.concentration", concentration)) concentration = 0;
  new HPyloriGroup(mp_lamina_propria, concentration);

  if (!mpProperties->getValue("mp_lamina_propria.Bacteria.concentration", concentration)) concentration = 0;
  new BacteriaGroup(mp_lamina_propria, concentration);

  if (!mpProperties->getValue("lamina_propria.macrophages.monocyte.concentration", concentration)) concentration = 0;

  double concentration2;

  if (!mpProperties->getValue("lamina_propria.macrophages.regulatory.concentration", concentration2)) concentration2 = 0;
  new MacrophageGroup(mp_lamina_propria, concentration, concentration2);

  mp_lamina_propria->addCytokine("eIL6");
  mp_lamina_propria->addCytokine("eTGFb");
  mp_lamina_propria->addCytokine("eIL12");
  mp_lamina_propria->addCytokine("eIL17");
  mp_lamina_propria->addCytokine("eIL10");
  mp_lamina_propria->addCytokine("eIFNg");

  mp_lamina_propria->initializeDiffuserData();
}

void HPModel::initialize_gastric_lymph_node()
{
  mp_gastric_lymph_node = ENISI::Compartment::instance(ENISI::Compartment::gastric_lymph_node);

  double concentration;

  if (!mpProperties->getValue("gastric_lymph_node.Dendritics.concentration", concentration)) concentration = 0;
  new DendriticsGroup(mp_gastric_lymph_node, concentration);

 // if (!mpProperties->getValue("gastric_lymph_node.Tcell.concentration", concentration)) concentration = 0;
 // new TcellGroup(mp_gastric_lymph_node, concentration);
  
  if (!mpProperties->getValue("gastric_lymph_node.Tcell.naive.concentration", concentration)) concentration = 0;
   
  new TcellGroup(mp_gastric_lymph_node, concentration);
  
  
  mp_gastric_lymph_node->addCytokine("eIL6");
  mp_gastric_lymph_node->addCytokine("eTGFb");
  mp_gastric_lymph_node->addCytokine("eIL12");
  mp_gastric_lymph_node->addCytokine("eIL17");
  mp_gastric_lymph_node->addCytokine("eIL10");
  mp_gastric_lymph_node->addCytokine("eIFNg");

  mp_gastric_lymph_node->initializeDiffuserData();
}


void HPModel::initSchedule(repast::ScheduleRunner & runner) 
{
  // We need to schedule diffusion and agent interaction.

  runner.scheduleEvent(0.01, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::synchronize)));
  runner.scheduleEvent(0.02, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::recordResults)));

  runner.scheduleEvent(0.97, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::act)));
  runner.scheduleEvent(0.98, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::diffuse)));
  runner.scheduleEvent(0.99, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::synchronize)));
  runner.scheduleEvent(1.00, 1.0, repast::Schedule::FunctorPtr(new repast::MethodFunctor<HPModel> (this, &HPModel::recordResults)));

  /* Schedule will repeat infinitely without a stop */
  double stopAt = 1;
  Properties::instance(Properties::run)->getValue("stop.at", stopAt);
  stopAt += 0.001;
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
  mp_gastric_lymph_node->diffuse();
}

void HPModel::synchronize()
{
  mp_lumen->synchronizeCells();
  mp_epithilium->synchronizeCells();
  mp_lamina_propria->synchronizeCells();
  mp_gastric_lymph_node->synchronizeCells();

  mp_lumen->synchronizeDiffuser();
  mp_epithilium->synchronizeDiffuser();
  mp_lamina_propria->synchronizeDiffuser();
  mp_gastric_lymph_node->synchronizeDiffuser();
}

void HPModel::recordResults()
{
  mp_lumen->write("\t");
  mp_epithilium->write("\t");
  mp_lamina_propria->write("\t");
  mp_gastric_lymph_node->write("\t");

  return;
}
