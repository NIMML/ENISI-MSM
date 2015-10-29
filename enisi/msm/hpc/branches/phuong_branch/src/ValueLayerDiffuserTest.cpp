#include "gmock/gmock.h"
#include "ValueLayer.h" /* should use local modified ValueLayer.h */
#include "ValueLayerDiffuser.h"

using namespace testing;

TEST(AValueLayerDiffuser, HasExpectedNumericalBounds)
{
  ASSERT_THAT(repast::ValueLayerDiffuser::DEFAULT_MAX, Eq(32767));
  ASSERT_THAT(repast::ValueLayerDiffuser::DEFAULT_MIN, Eq(-32767));
}

TEST(AValueLayerDiffuser, IsSuccessfullyConstructed)
{
  repast::Point<double> origin(0,0);

  int width = 100, height = 100;
  repast::Point<double> extents(width,height);

  repast::GridDimensions dimensions(origin, extents);

  std::string name = "ValueLayer";
  bool dense = true;
  repast::DiscreteValueLayer<double, repast::WrapAroundBorders>
    valueLayer(name, dimensions, dense);

  repast::ValueLayerDiffuser a = repast::ValueLayerDiffuser();
  a.setValueLayer(&valueLayer);
  repast::ValueLayerDiffuser b(NULL,0.95,0.6);
  repast::ValueLayerDiffuser c(&valueLayer,0.95,0.6);
  repast::ValueLayerDiffuser d(&valueLayer,0.95,0.6,true);

  std::vector<repast::ValueLayerDiffuser> valueDiffusers;
  valueDiffusers.push_back(d);
}
