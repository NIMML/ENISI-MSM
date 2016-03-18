#include "../InitSharedContextTestFixture.h"
#include "Dendritics.h"

using namespace testing;

class ADendritic: public InitSharedContext {};

TEST_F(ADendritic, IsNotNull)
{
  Dendritics * p_dendritics =
    (Dendritics *) _factory.create("Dendritics", &_compartment);

  ASSERT_THAT(p_dendritics, NotNull());
}
