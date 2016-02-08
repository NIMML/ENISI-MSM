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
    _p_lumenTcells = (TcellGroup *) AgentGroupFactory::create(
    	"TcellGroup", &_lumen, tcellCount);
    _epitheliumTcells = (TcellGroup *) AgentGroupFactory::create(
    	"TcellGroup", &_epithelium, tcellCount);

    _p_lumenTcells->setBorder("S", _epitheliumTcells);

    _p_cellContext = _lumen.cellLayer()->context();
  }

  void TearDown() { }

  void assertTH17inLumenNotEpithelium();
  void moveTH17betweenLumenEpitheliumBarrier();
  void assertTH17inEpitheliumNotLumen();
  void assertTransfersCleared();

  bool addValueToCoord(const std::vector<double> &);
  std::string getBorderCrossingDirection(const std::vector<double> &);

private:
  ENISI::Compartment _lumen;
  ENISI::Compartment _epithelium;

  TcellGroup * _p_lumenTcells;
  TcellGroup * _epitheliumTcells;
};

void ACellGroupCompartmentMovement::assertTH17inLumenNotEpithelium()
{
  _assertTH17inLumenNotEpitheliumCalled = true;

  _p_lumenTcells->addCellAt(TcellState::TH17, repast::Point<int>(5,5));
  const TcellGroup::StateCount lumenTcellCount = _p_lumenTcells->countByState();
  ASSERT_THAT(lumenTcellCount.state[TcellState::TH17], Eq(1));

  const TcellGroup::StateCount epitheliumTcellCount = _epitheliumTcells->countByState();
  ASSERT_THAT(epitheliumTcellCount.state[TcellState::TH17], Eq(0));
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

std::string ACellGroupCompartmentMovement::getBorderCrossingDirection(
    const std::vector<double> & pt)
{
   int endX = _oriX + _extentX;
   int endY = _oriY + _extentY;

   int ptX = pt[0]; int ptY = pt[1];

   bool xEastOfBounds = (ptX > endX);
   bool xWestOfBounds = (ptX < _oriX);
   bool xInBounds = (ptX >= _oriX && ptX <= endX);

   bool yNorthOfBounds = (ptY < _oriY);
   bool ySouthOfBounds = (ptY > endY);
   bool yInBounds = (ptY >= _oriY && ptY <= endY);

   if      (xInBounds && yNorthOfBounds) { return "N"; }
   if      (xInBounds && ySouthOfBounds) { return "S"; }
   if      (xEastOfBounds && yInBounds)  { return "E"; }
   else if (xWestOfBounds && yInBounds)  { return "W"; }
   else { throw std::invalid_argument("Point not out of bounds"); }
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
  std::vector<double> pt(2);
  pt[0] = _oriX + _extentX - 1; pt[1] = _oriY + _extentY - 1;
  borders.transform(pt, pt);

  std::vector<double> northPt(2);
  northPt[0] = _oriX + _extentX/2; northPt[1] = _oriY - 1;

  std::vector<double> southPt(2);
  southPt[0] = _oriX + _extentX/2; southPt[1] = _oriY + _extentY + 1;

  std::vector<double> westPt(2);
  westPt[0] = _oriX - 1; westPt[1] = _oriY + _extentY/2;

  std::vector<double> eastPt(2);
  eastPt[0] = _oriX + _extentX + 1; eastPt[1] = _oriY + _extentY/2;

  ASSERT_THAT(getBorderCrossingDirection(northPt), Eq("N"));
  ASSERT_THAT(getBorderCrossingDirection(southPt), Eq("S"));
  ASSERT_THAT(getBorderCrossingDirection(eastPt), Eq("E"));
  ASSERT_THAT(getBorderCrossingDirection(westPt), Eq("W"));
/*  if (! addValueToCoord(pt))*/
  //{
    //std::string direction = getBorderCrossingDirection(pt);
  /*}*/
}

