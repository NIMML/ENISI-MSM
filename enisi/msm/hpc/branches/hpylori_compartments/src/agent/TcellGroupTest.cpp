#include "../InitSharedContextTestFixture.h"
#include "../agent/TcellGroup.h"
#include "RepastProcess.h"

class ATcellGroup: public InitSharedContext 
{ 
public:
  const int tcellCount;
  TcellGroup * _p_tcells;

  ATcellGroup() : tcellCount(2) { }

  void SetUp() 
  {
    InitSharedContext::SetUp(); 

    _p_tcells = (TcellGroup *) 
      AgentGroupFactory::create("TcellGroup", &_compartment, tcellCount);
  }
  void TearDown() { }
};

TEST_F(ATcellGroup, HasHorizontalBoundariesBasedOnWorldSize)
{
  int rank = repast::RepastProcess::instance()->rank();

  repast::Point<int> pt1(0,0);
  repast::Point<int> pt2(51,0);

  if (0 == rank)
  {
    ASSERT_TRUE(_p_tcells->isPointInBounds(pt1));
    ASSERT_FALSE(_p_tcells->isPointInBounds(pt2));
  }
  else if (1 == rank)
  {
    ASSERT_FALSE(_p_tcells->isPointInBounds(pt1));
    ASSERT_TRUE(_p_tcells->isPointInBounds(pt2));
  }
}

TEST_F(ATcellGroup, HasExpectedCount)
{
  ASSERT_THAT(_p_tcells->count(), Eq(tcellCount));

  TcellGroup::StateCount count = _p_tcells->countByState();
  ASSERT_THAT(count.state[TcellState::TH1],   Eq(0));
  ASSERT_THAT(count.state[TcellState::TH17],  Eq(0));
  ASSERT_THAT(count.state[TcellState::TREG],  Eq(0));
  ASSERT_THAT(count.state[TcellState::DEAD],  Eq(0));
  ASSERT_THAT(count.state[TcellState::NAIVE], Eq(tcellCount));
}

TEST_F(ATcellGroup, CanGetCoordinateMap)
{
  TcellGroup::StateCount total = _p_tcells->countByState();

  ASSERT_THAT(total.state[TcellState::NAIVE], Eq(tcellCount));
}

TEST_F(ATcellGroup, CanManuallyAddCells)
{
  TcellGroup::StateCount countBeforeAdd = _p_tcells->countByState();
  ASSERT_THAT(countBeforeAdd.state[TcellState::TH1], Eq(0));

  _p_tcells->addCellAt(TcellState::TH1, repast::Point<int>(0, 0));

  TcellGroup::StateCount countAfterAdd = _p_tcells->countByState();
  ASSERT_THAT(countAfterAdd.state[TcellState::TH1], Eq(1));
}

