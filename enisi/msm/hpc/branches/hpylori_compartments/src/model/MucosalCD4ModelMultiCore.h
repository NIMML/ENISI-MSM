#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_H

#include "MucosalCD4ModelBase.h"

#include "../agent/RepastHPCDemoAgentPackage.h"
#include "repast_hpc/SharedNetwork.h"

class MucosalCD4ModelMultiCore : public MucosalCD4ModelBase
{
public:
  typedef ENISI::Agent Node;
  typedef repast::RepastEdge<ENISI::Agent> Edge;
  typedef repast::RepastEdgeContent<ENISI::Agent> EdgeCont;
  typedef repast::RepastEdgeContentManager<ENISI::Agent> EdgeContMgr;
  typedef repast::SharedNetwork<Node, Edge, EdgeCont, EdgeContMgr> Network;

  MucosalCD4ModelMultiCore(repast::Properties*, boost::mpi::communicator*);
  ~MucosalCD4ModelMultiCore();

  virtual void init();
  virtual void act();
  void initSchedule(repast::ScheduleRunner& runner);
  virtual void requestAgents();
protected:
  virtual void createBacteria();
  virtual void createTcells();
  virtual void createDendritics();

  virtual void syncAgents();

  boost::mpi::communicator* world;

private:
  RepastHPCDemoAgentPackageProvider* provider;
  RepastHPCDemoAgentPackageReceiver* receiver;
  Context context;
};

#endif
