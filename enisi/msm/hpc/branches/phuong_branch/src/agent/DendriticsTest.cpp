#include "../InitSharedContextTestFixture.h"
#include "Dendritics.h"

using namespace testing;

class ADendritic: public InitSharedContext { };

TEST_F(ADendritic, IsNotNull) 
{
  Dendritics * pDendr = new Dendritics(global_context);
  ASSERT_THAT( pDendr, NotNull() );
  delete pDendr;
}

