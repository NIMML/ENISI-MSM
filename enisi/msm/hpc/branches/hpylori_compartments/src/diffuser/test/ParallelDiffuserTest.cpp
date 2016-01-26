#include "RepastProcess.h"
#include "ScheduleTestFixture.h"
#include "DiffuserTest.h"
#include "diffuser/ParallelDiffuser.h"

class AParallelDiffuser: public ScheduleTestFixture
{ 
public:
  int _requestCalled, _actCalled, _updateCalled;
  /* Create 2 diffusers to verify they diffuse without affecting each other */
  ParallelDiffuser _diffuser;
  ParallelDiffuser _diffuser2;

  AParallelDiffuser() 
    : _requestCalled(0), _actCalled(0), _updateCalled(0),
      _diffuser(_compartment, 0.95, 0.6, true),
      _diffuser2(_compartment, 0.95, 0.6, true)
    { }

  void SetUp() 
  { 
    _diffuser.setValueAtCoord(
    	DIFFUSION_TEST_START_VALUE, DIFFUSION_TEST_CENTER_PT);

    _diffuser2.setValueAtCoord(
    	DIFFUSION_TEST_START_VALUE, DIFFUSION_TEST_CENTER_PT);
  }
  void TearDown() { }

  void requestAgents();
  void diffuse();
  void updateReferenceDiffuserGrid();
  void testStepOneDiffusion();
  void testStepTwoDiffusion();
  void end();

protected:

private:
};

void AParallelDiffuser::requestAgents()
{
  _compartment.requestAgents();
  _requestCalled = 1;
}

void AParallelDiffuser::diffuse()
{
  _compartment.diffuse();
  _actCalled = 1;
}

void AParallelDiffuser::updateReferenceDiffuserGrid()
{
  _compartment.updateReferenceDiffuserGrid();
  _updateCalled = 1;
}

void AParallelDiffuser::testStepOneDiffusion()
{ 
  assertStepOneDiffusionValuesAtCoord(_diffuser); 
  assertStepOneDiffusionValuesAtCoord(_diffuser2); 
}

void AParallelDiffuser::testStepTwoDiffusion()
{ 
  assertStepTwoDiffusionValuesAtCoord(_diffuser); 
  assertStepTwoDiffusionValuesAtCoord(_diffuser2); 
}


void AParallelDiffuser::end()
{
  ASSERT_THAT(_requestCalled, Eq(1));
  ASSERT_THAT(_actCalled, Eq(1));
  ASSERT_THAT(_updateCalled, Eq(1));
}

TEST_F(AParallelDiffuser, GetsExpectedCoordinatesAssignedToCurrentRank)
{
  repast::GridDimensions 
    dimensions(repast::Point<double>(1,1), repast::Point<double>(4,4));

  ENISI::Compartment smallCompartment(dimensions);

  Diffuser diffuser(smallCompartment.newDiffuserLayer());

  std::vector<repast::Point<int> > 
    coords = diffuser.getGridCoordsAssignedToRank();

  if (0 == _rank) 
  {
    ASSERT_THAT(coords.size(), Eq(13));
    ASSERT_THAT(coords[0][0], Eq(1));
    ASSERT_THAT(coords[0][1], Eq(1));
    ASSERT_THAT(coords[12][0], Eq(3));
    ASSERT_THAT(coords[12][1], Eq(3));
  }
  if (1 == _rank) 
  {
    ASSERT_THAT(coords.size(), Eq(12));
  }
}

TEST_F(AParallelDiffuser, SyncsDiffusionChangesAcrossRanks)
{
  repast::RepastProcess::init("");

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  runner.scheduleEvent(1, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::requestAgents)));

  runner.scheduleEvent(2, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::diffuse)));

  runner.scheduleEvent(3, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::updateReferenceDiffuserGrid)));

  runner.scheduleEvent(4, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::testStepOneDiffusion)));

  runner.scheduleEvent(5, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::diffuse)));

  runner.scheduleEvent(6, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::updateReferenceDiffuserGrid)));

  runner.scheduleEvent(7, repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (
      this, &AParallelDiffuser::testStepTwoDiffusion)));

  /*Schedule will repeat infinitely without a stop*/
  runner.scheduleStop(7); 

  runner.scheduleEndEvent(repast::Schedule::FunctorPtr(
    new repast::MethodFunctor<AParallelDiffuser> (this, 
      &AParallelDiffuser::end)));

  ASSERT_THAT(_requestCalled, Eq(0));
  ASSERT_THAT(_actCalled, Eq(0));
  ASSERT_THAT(_updateCalled, Eq(0));

  assertStepZeroDiffusionValuesAtCoord(_diffuser);
  assertStepZeroDiffusionValuesAtCoord(_diffuser2);

  runner.run();

  repast::RepastProcess::instance()->done();
}
