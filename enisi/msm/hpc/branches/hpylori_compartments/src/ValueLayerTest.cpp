#include "gmock/gmock.h"
#include "grid/ValueLayer.h" /* should use local modified ValueLayer.h */
#include "repast_hpc/GridComponents.h" /* repast::StickyBorders */

/* Test that the patched ValueLayer.h (originally part of repast, but copied
 * to the ENISI MSM src and modified) will successfully construct a
 * DiscreteValueLayer. The unmodified repast 2.0 version will fail this test
 * due to a default initialization bug and bad repast::*Matrix instantiation */

TEST(ADiscreteValueLayer, IsSuccessfullyConstructed)
{
  repast::Point<double> origin(0,0);

  int width = 100, height = 100;
  repast::Point<double> extents(width,height);

  repast::GridDimensions dimensions(origin, extents);

  std::string name = "ValueLayer";
  bool dense = true;

  repast::DiscreteValueLayer<int, repast::StickyBorders>  
    valueLayer(name, dimensions, dense, 0);
}
