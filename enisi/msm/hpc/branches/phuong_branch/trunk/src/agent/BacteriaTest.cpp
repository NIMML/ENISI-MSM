#include "../InitSharedContextTestFixture.h"
#include "Bacteria.h"

using namespace testing;

class ABacteria: public InitSharedContext 
{ 
public:
  Bacteria * bacteria;
  void SetUp() {
    InitSharedContext::SetUp(); 
    bacteria = new Bacteria(global_context);
  }
  void TearDown() {
    delete bacteria;
  }
};

TEST_F(ABacteria, DefaultStateIsINFECTIOUS)
{
  ASSERT_THAT(bacteria->getState(), Eq(AgentState::INFECTIOUS));
}

TEST_F(ABacteria, SuccessfullyChangesState)
{
  bacteria->setState(AgentState::TOLEGENIC);
  ASSERT_THAT(bacteria->getState(), Eq(AgentState::TOLEGENIC));
}
