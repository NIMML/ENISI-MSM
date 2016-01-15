#include "../InitSharedContextTestFixture.h"
#include "HPyloriModel.h"

using namespace testing;

class AnHPyloriModel: public InitSharedContext { };

TEST_F(AnHPyloriModel, CanCreateMultipleCompartments)
{
  ENISI::Compartment lumen(_dimensions);
  ENISI::Compartment epithelium(_dimensions);
  ENISI::Compartment gastricLymphNode(_dimensions);
  ENISI::Compartment laminaPropria(_dimensions);
}

TEST(BoostUIntMaxDividedByInt, DoesNotLoseFidelity)
{
  boost::uintmax_t numerator = 10000000000000;
  unsigned int denominator = 10;
  boost::uintmax_t result = numerator / denominator;
  ASSERT_THAT(result, Eq(1000000000000));
}

TEST(AStrToUIntMaxFunction, ConvertsStringsLargerThanTenPlacesToInt)
{
  std::string str = "10000000000";
  ASSERT_THAT(strToUIntMax(str), Eq(10000000000));

  std::string str2 = "10000000000000";
  ASSERT_THAT(strToUIntMax(str2), Eq(10000000000000));
}
