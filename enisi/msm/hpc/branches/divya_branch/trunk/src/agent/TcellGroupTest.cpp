#include "../InitSharedContextTestFixture.h"
#include "../agent/TcellGroup.h"
#include "RepastProcess.h"

class ATcellGroup: public InitSharedContext 
{ 
public:
  TcellGroup * tcells;
  ATcellGroup() : tcellCount(2) { }
  const int tcellCount;

  void SetUp() {
    InitSharedContext::SetUp(); 

    tcells = new TcellGroup(tcellCount, global_context);
  }
  void TearDown() { delete tcells; }
};

TEST_F(ATcellGroup, HasHorizontalBoundariesBasedOnWorldSize)
{
  int rank = repast::RepastProcess::instance()->rank();

  repast::Point<int> pt1(0,0);
  repast::Point<int> pt2(51,0);

  if (0 == rank)
  {
    ASSERT_TRUE(tcells->isPointInBounds(pt1));
    ASSERT_FALSE(tcells->isPointInBounds(pt2));
  }
  else if (1 == rank)
  {
    ASSERT_FALSE(tcells->isPointInBounds(pt1));
    ASSERT_TRUE(tcells->isPointInBounds(pt2));
  }
}

TEST_F(ATcellGroup, HasExpectedCount)
{
  ASSERT_THAT(tcells->count(), Eq(tcellCount));

  TcellGroup::StateCount count = tcells->countByState();
  ASSERT_THAT(count.state[TcellGroup::TH1],   Eq(0));
  ASSERT_THAT(count.state[TcellGroup::TH17],  Eq(0));
  ASSERT_THAT(count.state[TcellGroup::TREG],  Eq(0));
  ASSERT_THAT(count.state[TcellGroup::DEAD],  Eq(0));
  ASSERT_THAT(count.state[TcellGroup::NAIVE], Eq(tcellCount));
}

TEST_F(ATcellGroup, CanGetCoordinateMap)
{
  TcellGroup::CoordMap coordMap = tcells->getCoordMap();

  TcellGroup::StateCount total;

  typedef TcellGroup::CoordMap::const_iterator it_type;

  for(it_type it = coordMap.begin(); it != coordMap.end(); it++) 
  {
    TcellGroup::StateCount stateCount  = it->second;
    for (unsigned int i = 0; i < TcellGroup::LAST_STATE_DO_NOT_MOVE; ++i)
    {
      total.state[i] += stateCount.state[i];
    }
  }

  ASSERT_THAT(total.state[TcellGroup::NAIVE], Eq(tcellCount));
}

TEST_F(ATcellGroup, CanManuallyAddCells)
{
  TcellGroup::StateCount countBeforeAdd = tcells->countByState();
  ASSERT_THAT(countBeforeAdd.state[TcellGroup::TH1], Eq(0));

  tcells->addStateAt(TcellGroup::TH1, repast::Point<int>(0, 0));

  TcellGroup::StateCount countAfterAdd = tcells->countByState();
  ASSERT_THAT(countAfterAdd.state[TcellGroup::TH1], Eq(1));
}

TEST_F(ATcellGroup, CanSetCoordinateMap)
{
  TcellGroup::CoordMap map;

  TcellGroup::StateCount setCount1;
  setCount1.state[TcellGroup::NAIVE] = 0;
  setCount1.state[TcellGroup::TH1] = 2;
  setCount1.state[TcellGroup::TH17] = 6;
  setCount1.state[TcellGroup::TREG] = 5;
  setCount1.state[TcellGroup::DEAD] = 10;

  map[repast::Point<int>(0,0)] = setCount1;

  TcellGroup::StateCount setCount2;
  setCount2.state[TcellGroup::NAIVE] = 0;
  setCount2.state[TcellGroup::TH1] = 1;
  setCount2.state[TcellGroup::TH17] = 1;
  setCount2.state[TcellGroup::TREG] = 1;
  setCount2.state[TcellGroup::DEAD] = 1;

  map[repast::Point<int>(5,5)] = setCount2;

  tcells->setCoordMap(map);

  TcellGroup::StateCount getCount = tcells->countByState();
  ASSERT_THAT(getCount.state[TcellGroup::NAIVE], Eq(0));
  ASSERT_THAT(getCount.state[TcellGroup::TH1],   Eq(3));
  ASSERT_THAT(getCount.state[TcellGroup::TH17],  Eq(7));
  ASSERT_THAT(getCount.state[TcellGroup::TREG],  Eq(6));
  ASSERT_THAT(getCount.state[TcellGroup::DEAD],  Eq(11));
}
