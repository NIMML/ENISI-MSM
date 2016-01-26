#include "ScheduleTestFixture.h"
#include "agent/TcellGroup.h"
#include "RepastProcess.h"
#include "agent/AgentGroupPackage.h"

class ACellGroupCompartmentMovement: public ScheduleTestFixture 
{ 
public:
  bool _assertTH17inLumenNotEpitheliumCalled, 
       _moveTH17betweenLumenEpitheliumBarrierCalled, 
       _assertTH17inEpitheliumNotLumenCalled;

  repast::SharedContext<ENISIAgent> * _p_cellContext;

  ACellGroupCompartmentMovement() : 
    _assertTH17inLumenNotEpitheliumCalled(false), 
    _moveTH17betweenLumenEpitheliumBarrierCalled(false), 
    _assertTH17inEpitheliumNotLumenCalled(false),
    _lumen(_dimensions), _epithelium(_dimensions)
    { }

  void SetUp() 
  {
    InitSharedContext::SetUp(); 

    ENISI::Compartment gastricLymphNode(_dimensions);
    ENISI::Compartment laminaPropria(_dimensions);

    const int tcellCount = 0;
    _lumenTcells = (TcellGroup *) AgentGroupFactory::create(
    	"TcellGroup", &_lumen, tcellCount);
    _epitheliumTcells = (TcellGroup *) AgentGroupFactory::create(
    	"TcellGroup", &_epithelium, tcellCount);

    _p_cellContext = _lumen.cellLayer()->context();
  }

  void TearDown() { }

  void assertTH17inLumenNotEpithelium();
  void moveTH17betweenLumenEpitheliumBarrier();
  void assertTH17inEpitheliumNotLumen();
  void assertTransfersCleared();

private:
  ENISI::Compartment _lumen;
  ENISI::Compartment _epithelium;

  TcellGroup * _lumenTcells;
  TcellGroup * _epitheliumTcells;
};

void ACellGroupCompartmentMovement::assertTH17inLumenNotEpithelium()
{
  _assertTH17inLumenNotEpitheliumCalled = true;

  _lumenTcells->addStateAt(TcellGroup::TH17, repast::Point<int>(5,5));
  TcellGroup::StateCount lumenTcellCount = _lumenTcells->countByState();
  ASSERT_THAT(lumenTcellCount.state[TcellGroup::TH17], Eq(1));

  TcellGroup::StateCount epitheliumTcellCount = _epitheliumTcells->countByState();
  ASSERT_THAT(epitheliumTcellCount.state[TcellGroup::TH17], Eq(0));
}

void ACellGroupCompartmentMovement::moveTH17betweenLumenEpitheliumBarrier()
{
  _moveTH17betweenLumenEpitheliumBarrierCalled = true;
}

void ACellGroupCompartmentMovement::assertTH17inEpitheliumNotLumen()
{
  _assertTH17inEpitheliumNotLumenCalled = true;
}

void ACellGroupCompartmentMovement::assertTransfersCleared()
{
  ASSERT_THAT(_assertTH17inLumenNotEpitheliumCalled, Eq(true));
  ASSERT_THAT(_moveTH17betweenLumenEpitheliumBarrierCalled, Eq(true));
  ASSERT_THAT(_assertTH17inEpitheliumNotLumenCalled, Eq(true));
}

TEST_F(ACellGroupCompartmentMovement, SyncsAgentChangesAcrossProcesses)
{
  repast::RepastProcess::init("");

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupCompartmentMovement> (
      this, &ACellGroupCompartmentMovement::assertTH17inLumenNotEpithelium)));

  runner.scheduleEvent(2, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupCompartmentMovement> (
      this, &ACellGroupCompartmentMovement::moveTH17betweenLumenEpitheliumBarrier)));

  runner.scheduleEvent(3, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupCompartmentMovement> (
      this, &ACellGroupCompartmentMovement::assertTH17inEpitheliumNotLumen)));

  /*Schedule will repeat infinitely without a stop*/
  runner.scheduleStop(3); 

  runner.scheduleEndEvent(repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<ACellGroupCompartmentMovement> (this, 
      &ACellGroupCompartmentMovement::assertTransfersCleared)));

  ASSERT_THAT(_assertTH17inLumenNotEpitheliumCalled, Eq(false));
  ASSERT_THAT(_moveTH17betweenLumenEpitheliumBarrierCalled, Eq(false));
  ASSERT_THAT(_assertTH17inEpitheliumNotLumenCalled, Eq(false));

  runner.run();

  repast::RepastProcess::instance()->done();
}
