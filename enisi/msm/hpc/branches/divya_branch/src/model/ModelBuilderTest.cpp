#include "../InitSharedContextTestFixture.h"
#include "../agent/Bacteria.h"
#include "../agent/Tcell.h"
#include "../agent/RepastHPCDemoAgentPackage.h"

class AModel: public InitSharedContext { };

TEST_F(AModel, KillsInfectiousBacteriaActingNearTH17)
{
  Bacteria bacteria(global_context, AgentState::INFECTIOUS);
  Tcell tcell(global_context, AgentState::TH17);

  repast::Point<int> pt(50, 50);

  tcell.moveTo(pt.getX(), pt.getY());

  bacteria.moveTo(pt.getX(), pt.getY());
  bacteria.act();

  ASSERT_THAT(bacteria.getState(), Eq(AgentState::DEAD));
}
