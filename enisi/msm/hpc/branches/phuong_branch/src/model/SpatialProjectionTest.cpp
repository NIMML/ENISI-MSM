#include "../InitSharedContextTestFixture.h"
#include "../agent/TcellGroup.h"
#include "RepastProcess.h"
#include "../agent/AgentGroupPackage.h"

class ASpatialProjection: public InitSharedContext 
{ 
public:
  ASpatialProjection() : tcellCount(0) { }

  void SetUp() {
    InitSharedContext::SetUp(); 

    tcells = new TcellGroup(tcellCount, global_context);

    provider = new AgentGroupPackageProvider(global_context);
    receiver = new AgentGroupPackageReceiver(global_context);
  }

  void TearDown() 
  { 
    delete receiver; 
    delete provider; 
    delete tcells; 
  }

  void requestAgents();
  void act();
  void assertRemoteLocalAgentSyncOccured();
  void assertTransfersCleared();

private:
  TcellGroup * tcells;

  const int tcellCount;

  AgentGroupPackageProvider* provider;
  AgentGroupPackageReceiver* receiver;
};

void ASpatialProjection::requestAgents()
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
      global_context->selectAgents(agents);

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
    >(*global_context, req, *provider, *receiver, *receiver);
}

void ASpatialProjection::act()
{
  std::vector<ENISIAgent*> localAgents;
  global_context->selectAgents(
    repast::SharedContext<ENISIAgent>::LOCAL, 
    localAgents
  );
  ASSERT_THAT(localAgents.size(), Eq(1));

  std::vector<ENISIAgent*> remoteAgents;
  global_context->selectAgents(
    repast::SharedContext<ENISIAgent>::NON_LOCAL, 
    remoteAgents
  );
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int remoteAgentSize = worldSize - 1;
  ASSERT_THAT(remoteAgents.size(), Eq(remoteAgentSize));

  std::vector<ENISIAgent*> allAgents;
  global_context->selectAgents(allAgents);
  ASSERT_THAT(allAgents.size(), Eq(worldSize));

  std::vector<ENISIAgent*>::const_iterator local_it = localAgents.begin();

  while(local_it != localAgents.end())
  {
    TcellGroup * localTcells = (TcellGroup*) (*local_it);
    localTcells->transferStateTo(TcellGroup::DEAD, repast::Point<int>(0, 0), 5);
    local_it++;
  }

  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    AgentGroupPackage, 
    AgentGroupPackageProvider, 
    AgentGroupPackageReceiver
  >(*provider, *receiver);
}

void ASpatialProjection::assertRemoteLocalAgentSyncOccured()
{
  std::vector<ENISIAgent*> remoteAgents;
  global_context->selectAgents(
    repast::SharedContext<ENISIAgent>::NON_LOCAL, 
    remoteAgents
  );

  std::vector<ENISIAgent*>::const_iterator remote_it = remoteAgents.begin();
  while(remote_it != remoteAgents.end())
  {
    TcellGroup * remoteTcells = (TcellGroup*) (*remote_it);

    TcellGroup::Transfers remoteTransfers = remoteTcells->getTransfers();
    ASSERT_THAT(remoteTransfers[TcellGroup::DEAD].size(), Eq(5));

    remote_it++;
  }

  std::vector<ENISIAgent*> localAgents;
  global_context->selectAgents(
    repast::SharedContext<ENISIAgent>::LOCAL, 
    localAgents
  );

  std::vector<ENISIAgent*>::const_iterator local_it = localAgents.begin();

  while(local_it != localAgents.end())
  {
    TcellGroup * localTcells = (TcellGroup*) (*local_it);

    TcellGroup::Transfers localTransfers = localTcells->getTransfers();
    ASSERT_THAT(localTransfers[TcellGroup::DEAD].size(), Eq(5));

    localTcells->clearTransfers();
    local_it++;
  }

  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    AgentGroupPackage, 
    AgentGroupPackageProvider, 
    AgentGroupPackageReceiver
  >(*provider, *receiver);
}

void ASpatialProjection::assertTransfersCleared()
{
  std::vector<ENISIAgent*> remoteAgents;
  global_context->selectAgents(
    repast::SharedContext<ENISIAgent>::NON_LOCAL, 
    remoteAgents
  );

  std::vector<ENISIAgent*>::const_iterator remote_it = remoteAgents.begin();
  while(remote_it != remoteAgents.end())
  {
    TcellGroup * remoteTcells = (TcellGroup*) (*remote_it);

    TcellGroup::Transfers remoteTransfers = remoteTcells->getTransfers();
    ASSERT_THAT(remoteTransfers[TcellGroup::DEAD].size(), Eq(0));

    remote_it++;
  }

  std::vector<ENISIAgent*> localAgents;
  global_context->selectAgents(
    repast::SharedContext<ENISIAgent>::LOCAL, 
    localAgents
  );

  std::vector<ENISIAgent*>::const_iterator local_it = localAgents.begin();

  while(local_it != localAgents.end())
  {
    TcellGroup * localTcells = (TcellGroup*) (*local_it);

    TcellGroup::Transfers localTransfers = localTcells->getTransfers();
    ASSERT_THAT(localTransfers[TcellGroup::DEAD].size(), Eq(0));

    local_it++;
  }

}

TEST_F(ASpatialProjection, SyncsAgentChangesAcrossProcesses)
{
  repast::RepastProcess::init("");

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ASpatialProjection> (
      this, &ASpatialProjection::requestAgents)));

  runner.scheduleEvent(2, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ASpatialProjection> (
      this, &ASpatialProjection::act)));

  runner.scheduleEvent(3, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ASpatialProjection> (
      this, &ASpatialProjection::assertRemoteLocalAgentSyncOccured)));

  /*Schedule will repeat infinitely without a stop*/
  runner.scheduleStop(3); 

  runner.scheduleEndEvent(repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ASpatialProjection> (this, 
      &ASpatialProjection::assertTransfersCleared)));

  runner.run();

  repast::RepastProcess::instance()->done();
}
