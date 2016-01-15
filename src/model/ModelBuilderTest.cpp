#include "../InitSharedContextTestFixture.h"
#include "../agent/Bacteria.h"
#include "../agent/Tcell.h"
#include "../agent/RepastHPCDemoAgentPackage.h"

class AModel: public InitSharedContext { };

TEST_F(AModel, KillsInfectiousBacteriaActingNearTH17)
{
  ENISI::Compartment compartment(_dimensions);

  AgentFactory factory;

  Bacteria * p_bacteria = (Bacteria *) factory.create("Bacteria", &compartment);
  p_bacteria->setState(AgentState::INFECTIOUS);

  Tcell * p_tcell = (Tcell *) factory.create("Tcell", &compartment);
  p_tcell->setState(AgentState::TH17);


  repast::Point<int> pt(50, 50);

  p_tcell->move(pt.getX(), pt.getY());

  p_bacteria->move(pt.getX(), pt.getY());
  p_bacteria->act();

  ASSERT_THAT(p_bacteria->getState(), Eq(AgentState::DEAD));
}
