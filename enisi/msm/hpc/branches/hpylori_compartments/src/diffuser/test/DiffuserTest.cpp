#include "InitSharedContextTestFixture.h"
#include "diffuser/Diffuser.h" /* should use local modified ValueLayer.h */
#include "DiffuserTest.h"

class ADiffuser: public InitSharedContext 
{ 
public:
};

const int DIFFUSION_TEST_START_VALUE = 50;
const repast::Point<int> DIFFUSION_TEST_CENTER_PT(50,50);
const int x = DIFFUSION_TEST_CENTER_PT.getX();
const int y = DIFFUSION_TEST_CENTER_PT.getY();

repast::Point<int> northWestPt(x-1, y-1);
repast::Point<int> northEastPt(x+1, y-1);

repast::Point<int> southWestPt(x-1, y+1);
repast::Point<int> southEastPt(x+1, y+1);

repast::Point<int> northPt(x, y-1);
repast::Point<int> southPt(x, y+1);
repast::Point<int> eastPt(x+1, y);
repast::Point<int> westPt(x-1, y);

repast::Point<int> doubleWestPt(x-2, y);

TEST_F(ADiffuser, SuccessfullyDiffusesValues)
{
  int value = 50;
  int x = 50;
  int y = 50;
  repast::Point<int> centerPt(x, y);

  double evaporationConstant = 0.95;
  double diffusionConstant = 0.6;
  bool toroidal = true;

  ENISI::Diffuser d(
    _compartment.newDiffuserLayer(),
    evaporationConstant,
    diffusionConstant,
    toroidal
  );

  d.setValueAtCoord(value, centerPt);

  assertStepZeroDiffusionValuesAtCoord(d);

  d.diffuse();

  assertStepOneDiffusionValuesAtCoord(d);
  
  d.diffuse();

  assertStepTwoDiffusionValuesAtCoord(d);
}

TEST_F(ADiffuser, IsSuccessfullyConstructed)
{
  ENISI::Diffuser a(_compartment.newDiffuserLayer());
  a.setDimensions(_dimensions);
  ENISI::Diffuser c(_compartment.newDiffuserLayer(),0.95,0.6);
  ENISI::Diffuser d(_compartment.newDiffuserLayer(),0.95,0.6,true);
}
void assertStepZeroDiffusionValuesAtCoord(ENISI::Diffuser & d)
{

  ASSERT_THAT(d.getCoordValue(DIFFUSION_TEST_CENTER_PT), 
              Eq(DIFFUSION_TEST_START_VALUE));

  ASSERT_THAT(d.getCoordValue(northWestPt), Eq(0));
  ASSERT_THAT(d.getCoordValue(westPt),      Eq(0));
  ASSERT_THAT(d.getCoordValue(southWestPt), Eq(0));

  ASSERT_THAT(d.getCoordValue(northEastPt), Eq(0));
  ASSERT_THAT(d.getCoordValue(eastPt),      Eq(0));
  ASSERT_THAT(d.getCoordValue(southEastPt), Eq(0));

  ASSERT_THAT(d.getCoordValue(northPt),     Eq(0));
  ASSERT_THAT(d.getCoordValue(southPt),     Eq(0));

  ASSERT_THAT(d.getCoordValue(doubleWestPt), Eq(0));

}

void assertStepOneDiffusionValuesAtCoord(ENISI::Diffuser & d)
{
  ASSERT_THAT(d.getCoordValue(DIFFUSION_TEST_CENTER_PT),    Eq(19));

  ASSERT_THAT(d.getCoordValue(northWestPt), DoubleEq(1.425));
  ASSERT_THAT(d.getCoordValue(northEastPt), DoubleEq(1.425));

  ASSERT_THAT(d.getCoordValue(southWestPt), DoubleEq(1.425));
  ASSERT_THAT(d.getCoordValue(southEastPt), DoubleEq(1.425));

  ASSERT_THAT(d.getCoordValue(northPt),     DoubleEq(5.7));
  ASSERT_THAT(d.getCoordValue(southPt),     DoubleEq(5.7));
  ASSERT_THAT(d.getCoordValue(eastPt),      DoubleEq(5.7));
  ASSERT_THAT(d.getCoordValue(westPt),      DoubleEq(5.7));

  ASSERT_THAT(d.getCoordValue(doubleWestPt), Eq(0));
}

void assertStepTwoDiffusionValuesAtCoord(ENISI::Diffuser & d)
{
  ASSERT_THAT(d.getCoordValue(DIFFUSION_TEST_CENTER_PT), DoubleEq(9.98165));

  ASSERT_THAT(d.getCoordValue(northWestPt), DoubleEq(2.3826));
  ASSERT_THAT(d.getCoordValue(northEastPt), DoubleEq(2.3826));

  ASSERT_THAT(d.getCoordValue(southWestPt), DoubleEq(2.3826));
  ASSERT_THAT(d.getCoordValue(southEastPt), DoubleEq(2.3826));

  ASSERT_THAT(d.getCoordValue(northPt),     DoubleEq(4.9818));
  ASSERT_THAT(d.getCoordValue(southPt),     DoubleEq(4.9818));
  ASSERT_THAT(d.getCoordValue(eastPt),      DoubleEq(4.9818));
  ASSERT_THAT(d.getCoordValue(westPt),      DoubleEq(4.9818));

  ASSERT_THAT(d.getCoordValue(doubleWestPt), DoubleEq(0.731025));
}
