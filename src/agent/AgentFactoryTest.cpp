#include "../InitSharedContextTestFixture.h"
#include "AgentFactory.h"

using namespace testing;

class AnAgentFactory: public InitSharedContext 
{ 
public:
  ENISI::AgentFactory * factory;
  void SetUp() {
    InitSharedContext::SetUp(); 
    factory = new ENISI::AgentFactory();
  }
  void TearDown() {
    delete factory;
  }
};

TEST_F(AnAgentFactory, CreatesValidAgent)
{
  ENISI::Compartment compartment(_dimensions);

  Tcell * tcell = (Tcell *) factory->create("Tcell", &compartment);
  Bacteria * bact = (Bacteria *) factory->create("Bacteria", &compartment);
  Dendritics * dendr = (Dendritics *) factory->create("Dendritics", &compartment);

  ASSERT_THAT( tcell, NotNull() );
  ASSERT_THAT( bact, NotNull() );
  ASSERT_THAT( dendr, NotNull() );
}

TEST_F(AnAgentFactory, ThrowsErrorCreatingInvalidAgent)
{
  ENISI::Compartment compartment(_dimensions);
  ASSERT_ANY_THROW( factory->create("InvalidAgent", &compartment) );
}
