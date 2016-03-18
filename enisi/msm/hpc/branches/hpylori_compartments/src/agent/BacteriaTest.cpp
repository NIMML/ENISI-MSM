#include "InitSharedContextTestFixture.h"
#include "agent/AgentFactory.h"

using namespace testing;

class ABacteria: public InitSharedContext
{
public:
  Bacteria * _p_bacteria;
  void SetUp()
  {
    _p_bacteria = (Bacteria *) _factory.create("Bacteria", &_compartment);
  }
  void TearDown() {}
};

TEST_F(ABacteria, DefaultStateIsINFECTIOUS)
{
  ASSERT_THAT(_p_bacteria->getState(), Eq(ENISI::AgentState::INFECTIOUS));
}

TEST_F(ABacteria, SuccessfullyChangesState)
{
  _p_bacteria->setState(ENISI::AgentState::TOLEGENIC);
  ASSERT_THAT(_p_bacteria->getState(), Eq(ENISI::AgentState::TOLEGENIC));
}
