#include "ScheduleTestFixture.h"
#include "agent/TcellGroup.h"
#include "RepastProcess.h"
#include "agent/AgentGroupPackage.h"

class ACellGroupSync: public ScheduleTestFixture 
{ 
public:
  bool _requestCalled, _actCalled, _assertRemoteLocalAgentSyncOccuredCalled;

  ACellGroupSync() : 
    _requestCalled(false), _actCalled(false), _assertRemoteLocalAgentSyncOccuredCalled(false),
    _lumen(_dimensions)
    { }

  void SetUp() {
    InitSharedContext::SetUp(); 


    ENISI::Compartment epithelium(_dimensions);
    ENISI::Compartment gastricLymphNode(_dimensions);
    ENISI::Compartment laminaPropria(_dimensions);

    const int tcellCount = 0;
    AgentGroupFactory::create("TcellGroup", &_lumen, tcellCount);
  }

  void TearDown() { }

  void requestAgents();
  void act();
  void assertRemoteLocalAgentSyncOccured();
  void assertTransfersCleared();

private:
  ENISI::Compartment _lumen;
};

void ACellGroupSync::requestAgents()
{
  _requestCalled = true;
  _lumen.cellLayer()->requestAgents();
}

void ACellGroupSync::act()
{
  _actCalled = true;

  std::vector<CellLayer::AgentType *> localAgents = 
    _lumen.cellLayer()->selectLocalAgents();
  ASSERT_THAT(localAgents.size(), Eq(1));

  std::vector<CellLayer::AgentType*> remoteAgents = _lumen.cellLayer()->selectRemoteAgents();
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int remoteAgentSize = worldSize - 1;
  ASSERT_THAT(remoteAgents.size(), Eq(remoteAgentSize));

  std::vector<CellLayer::AgentType*> allAgents = _lumen.cellLayer()->selectAllAgents();
  ASSERT_THAT(allAgents.size(), Eq(worldSize));

  std::vector<CellLayer::AgentType*>::const_iterator local_it = localAgents.begin();

  while(local_it != localAgents.end())
  {
    TcellGroup * localTcells = (TcellGroup*) (*local_it);
    localTcells->transferStateTo(TcellState::DEAD, repast::Point<int>(0, 0), 5);
    local_it++;
  }

  _lumen.cellLayer()->synchronizeAgentStates();
}

void ACellGroupSync::assertRemoteLocalAgentSyncOccured()
{
  _assertRemoteLocalAgentSyncOccuredCalled = true;
  std::vector<CellLayer::AgentType*> remoteAgents = _lumen.cellLayer()->selectRemoteAgents();

  std::vector<CellLayer::AgentType*>::const_iterator remote_it = remoteAgents.begin();
  while(remote_it != remoteAgents.end())
  {
    TcellGroup * remoteTcells = (TcellGroup*) (*remote_it);

    TcellGroup::Transfers remoteTransfers = remoteTcells->getTransfers();
    ASSERT_THAT(remoteTransfers[TcellState::DEAD].size(), Eq(5));

    remote_it++;
  }

  std::vector<CellLayer::AgentType *> localAgents = _lumen.cellLayer()->selectLocalAgents();
  
  std::vector<CellLayer::AgentType*>::const_iterator local_it = localAgents.begin();

  while(local_it != localAgents.end())
  {
    TcellGroup * localTcells = (TcellGroup*) (*local_it);

    TcellGroup::Transfers localTransfers = localTcells->getTransfers();
    ASSERT_THAT(localTransfers[TcellState::DEAD].size(), Eq(5));

    localTcells->clearTransfers();
    local_it++;
  }

  _lumen.cellLayer()->synchronizeAgentStates();
}

void ACellGroupSync::assertTransfersCleared()
{
  std::vector<CellLayer::AgentType*> remoteAgents = _lumen.cellLayer()->selectRemoteAgents();
  
  std::vector<CellLayer::AgentType*>::const_iterator remote_it = remoteAgents.begin();
  while(remote_it != remoteAgents.end())
  {
    TcellGroup * remoteTcells = (TcellGroup*) (*remote_it);

    TcellGroup::Transfers remoteTransfers = remoteTcells->getTransfers();
    ASSERT_THAT(remoteTransfers[TcellState::DEAD].size(), Eq(0));

    remote_it++;
  }

  std::vector<CellLayer::AgentType *> localAgents = _lumen.cellLayer()->selectLocalAgents();
  
  std::vector<CellLayer::AgentType*>::const_iterator local_it = localAgents.begin();

  while(local_it != localAgents.end())
  {
    TcellGroup * localTcells = (TcellGroup*) (*local_it);

    TcellGroup::Transfers localTransfers = localTcells->getTransfers();
    ASSERT_THAT(localTransfers[TcellState::DEAD].size(), Eq(0));

    local_it++;
  }

  ASSERT_THAT(_requestCalled, Eq(true));
  ASSERT_THAT(_actCalled, Eq(true));
  ASSERT_THAT(_assertRemoteLocalAgentSyncOccuredCalled, Eq(true));
}

TEST_F(ACellGroupSync, SyncsAgentChangesAcrossProcesses)
{
  repast::RepastProcess::init("");

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupSync> (
      this, &ACellGroupSync::requestAgents)));

  runner.scheduleEvent(2, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupSync> (
      this, &ACellGroupSync::act)));

  runner.scheduleEvent(3, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupSync> (
      this, &ACellGroupSync::assertRemoteLocalAgentSyncOccured)));

  /*Schedule will repeat infinitely without a stop*/
  runner.scheduleStop(3); 

  runner.scheduleEndEvent(repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupSync> (this, 
      &ACellGroupSync::assertTransfersCleared)));

  ASSERT_THAT(_requestCalled, Eq(false));
  ASSERT_THAT(_actCalled, Eq(false));
  ASSERT_THAT(_assertRemoteLocalAgentSyncOccuredCalled, Eq(false));

  runner.run();

  repast::RepastProcess::instance()->done();
}
