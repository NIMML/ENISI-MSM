#include "../InitSharedContextTestFixture.h"
#include "AgentFactory.h"

using namespace testing;

class AnAgentFactory: public InitSharedContext 
{ 
public:
  AgentFactory * factory;
  void SetUp() {
    InitSharedContext::SetUp(); 
    factory = new AgentFactory(global_context);
  }
  void TearDown() {
    delete factory;
  }
};

TEST_F(AnAgentFactory, CreatesValidAgent)
{
  Tcell * tcell = (Tcell *) factory->create("Tcell");
  Bacteria * bact = (Bacteria *) factory->create("Bacteria");
  Dendritics * dendr = (Dendritics *) factory->create("Dendritics");

  ASSERT_THAT( tcell, NotNull() );
  ASSERT_THAT( bact, NotNull() );
  ASSERT_THAT( dendr, NotNull() );
}

TEST_F(AnAgentFactory, ThrowsErrorCreatingInvalidAgent)
{
  ASSERT_ANY_THROW( factory->create("InvalidAgent") );
}
