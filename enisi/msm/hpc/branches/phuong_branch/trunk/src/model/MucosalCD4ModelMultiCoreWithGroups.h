#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_WITH_COMPONENTS_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_WITH_COMPONENTS_H

#include "MucosalCD4ModelMultiCore.h"
#include "../agent/Cytokines.h"

class MucosalCD4ModelMultiCoreWithGroups : public MucosalCD4ModelMultiCore
{
public:
  MucosalCD4ModelMultiCoreWithGroups(
      repast::Properties* p, boost::mpi::communicator* c);

  virtual void init();
  virtual void act();
protected:
  virtual void createBacteria();
  virtual void createTcells();
  virtual void createDendritics();

  virtual void setUpCytokines();
  virtual void summation();

private:
};

#endif
