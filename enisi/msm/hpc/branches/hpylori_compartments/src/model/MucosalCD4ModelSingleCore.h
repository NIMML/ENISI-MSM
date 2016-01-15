#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_SINGLECORE_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_SINGLECORE_H

#include "MucosalCD4ModelBase.h"

class MucosalCD4ModelSingleCore : public MucosalCD4ModelBase
{
public:
  MucosalCD4ModelSingleCore(std::string, int, char**, boost::mpi::communicator*);
  MucosalCD4ModelSingleCore(repast::Properties*, boost::mpi::communicator*);
  ~MucosalCD4ModelSingleCore();

  void init();
  void act();
  void initSchedule(repast::ScheduleRunner& runner);

private:
  boost::mpi::communicator* world;

  Context context;
};

#endif
