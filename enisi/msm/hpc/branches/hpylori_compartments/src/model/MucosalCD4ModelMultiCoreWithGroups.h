#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_WITH_COMPONENTS_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_WITH_COMPONENTS_H

#include "MucosalCD4ModelMultiCore.h"
#include "../agent/AgentGroupPackage.h"
#include "../agent/Cytokines.h"

class MucosalCD4ModelMultiCoreWithGroups 
{
public:
  typedef repast::StickyBorders Borders;
  typedef repast::DiscreteValueLayer<double, Borders> ValueLayer;

  MucosalCD4ModelMultiCoreWithGroups(
      repast::Properties* p, boost::mpi::communicator* c);
  ~MucosalCD4ModelMultiCoreWithGroups();

  void init();
  void initSchedule(repast::ScheduleRunner& runner);

protected:
  void act();
  void requestAgents();

  void createBacteria();
  void createTcells();
  void createDendritics();

  void setUpValueLayer();

  void setUpCytokines();
  void setUpCytokineMultipliers();
  void syncAgents();
  void diffuse();
  void summation();

  void recordResults();

private:
  repast::Properties * _p_props;


  const int _height;
  const int _width;

  repast::GridDimensions _dimensions;

  std::vector<Diffuser *> _valueDiffusers;

  ENISI::Compartment * _p_compartment;

  CellGroup::Context * _p_context;

  AgentGroupPackageProvider * _p_provider;
  AgentGroupPackageReceiver * _p_receiver;

  ValueLayer * _p_valueLayer;

  std::map<std::string, int> _cytokineMultipliers; 

  CellGroup * _p_bacteria;
  CellGroup * _p_tcells;
  CellGroup * _p_dendritics;
};

#endif
