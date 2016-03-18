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
    _p_lumenTcells = static_cast< ENISI::TcellGroup * >(ENISI::AgentGroupFactory::create("TcellGroup", &_lumen, tcellCount));
    _epitheliumTcells = static_cast< ENISI::TcellGroup * >(ENISI::AgentGroupFactory::create("TcellGroup", &_epithelium, tcellCount));

    _p_lumenTcells->setRightBorder(1, ENISI::Borders::PERMIABLE, _epitheliumTcells);
  }

  void TearDown() { }

  void assertTH17inLumenNotEpithelium();
  void moveTH17betweenLumenEpitheliumBarrier();
  void assertTH17inEpitheliumNotLumen();
  void assertTransfersCleared();

  bool addValueToCoord(const std::vector<double> &);

private:
  ENISI::Compartment _lumen;
  ENISI::Compartment _epithelium;

  ENISI::TcellGroup * _p_lumenTcells;
  ENISI::TcellGroup * _epitheliumTcells;
};

void ACellGroupCompartmentMovement::assertTH17inLumenNotEpithelium()
{
  _assertTH17inLumenNotEpitheliumCalled = true;

  _p_lumenTcells->addCellAt(ENISI::TcellState::TH17, repast::Point<int>(5,5));
  const ENISI::TcellGroup::StateCount
		lumenTcellCount = _p_lumenTcells->countByState();
  ASSERT_THAT(lumenTcellCount.state[ENISI::TcellState::TH17], Eq(1));

  const ENISI::TcellGroup::StateCount
		epitheliumTcellCount = _epitheliumTcells->countByState();
  ASSERT_THAT(epitheliumTcellCount.state[ENISI::TcellState::TH17], Eq(0));
}

void ACellGroupCompartmentMovement::moveTH17betweenLumenEpitheliumBarrier()
{
  _moveTH17betweenLumenEpitheliumBarrierCalled = true;
  _p_lumenTcells->delCellAt(ENISI::TcellState::TH17, repast::Point<int>(5,5));

	repast::Point<int> outOfSouthBounds(_oriX + _extentX/2, _oriY + _extentY + 1);
  _p_lumenTcells->addCellAt(ENISI::TcellState::TH17, outOfSouthBounds);
}

void ACellGroupCompartmentMovement::assertTH17inEpitheliumNotLumen()
{
  _assertTH17inEpitheliumNotLumenCalled = true;

  const ENISI::TcellGroup::StateCount
		lumenTcellCount = _p_lumenTcells->countByState();
  ASSERT_THAT(lumenTcellCount.state[ENISI::TcellState::TH17], Eq(0));

  const ENISI::TcellGroup::StateCount
		epitheliumTcellCount = _epitheliumTcells->countByState();
  ASSERT_THAT(epitheliumTcellCount.state[ENISI::TcellState::TH17], Eq(1));
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

bool ACellGroupCompartmentMovement::addValueToCoord(
    const std::vector<double> & in) 
{
  repast::StrictBorders borders(_dimensions);

  std::vector<double> out;
  try { borders.transform(in, out); } 
  catch(const std::exception&) { return false; }

  return true;
}

TEST_F(ACellGroupCompartmentMovement, ChecksPointInBounds)
{
  repast::StickyBorders borders(_dimensions);

  /* Illustrate the closest to the border a point can go before throwing
   * exceptions */
  std::vector<double> pt(2);
  pt[0] = _oriX + _extentX - 1; pt[1] = _oriY + _extentY - 1;

  std::vector<double> pt2(2);
  pt2[0] = _oriX; pt2[1] = _oriY;

	ASSERT_NO_THROW( borders.transform(pt, pt) );
	ASSERT_NO_THROW( borders.transform(pt2, pt2) );

	std::vector<double> outOfBounds(2);
	outOfBounds[0] = _oriX + _extentX; outOfBounds[1] = _oriY + _extentY;
	ASSERT_THROW( borders.transform(outOfBounds, outOfBounds), std::exception);

	std::vector<double> outOfBounds2(2);
	outOfBounds2[0] = _oriX - 1; outOfBounds2[1] = _oriY - 1;
	ASSERT_THROW( borders.transform(outOfBounds2, outOfBounds2), std::exception);

}
