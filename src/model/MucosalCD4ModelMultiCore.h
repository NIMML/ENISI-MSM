#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_MULTICORE_H

#include "MucosalCD4ModelBase.h"

#include "../agent/RepastHPCDemoAgentPackage.h"
#include "SharedNetwork.h"

class MucosalCD4ModelMultiCore : public MucosalCD4ModelBase
{
public:
  typedef ENISIAgent Node;
  typedef repast::RepastEdge<ENISIAgent> Edge;
  typedef repast::RepastEdgeContent<ENISIAgent> EdgeCont;
  typedef repast::RepastEdgeContentManager<ENISIAgent> EdgeContMgr;
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
