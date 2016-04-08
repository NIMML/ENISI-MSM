#include "../InitSharedContextTestFixture.h"
#include "../agent/Bacteria.h"
#include "../agent/Tcell.h"
#include "../agent/RepastHPCDemoAgentPackage.h"

class AModel: public InitSharedContext { };

TEST_F(AModel, KillsInfectiousBacteriaActingNearTH17)
{
  ENISI::Compartment compartment(_dimensions);

  ENISI::AgentFactory factory;

  Bacteria * p_bacteria = (Bacteria *) factory.create("Bacteria", &compartment);
  p_bacteria->setState(ENISI::AgentState::INFECTIOUS);

  Tcell * p_tcell = (Tcell *) factory.create("Tcell", &compartment);
  p_tcell->setState(ENISI::AgentState::TH17);


  repast::Point<int> pt(50, 50);

  p_tcell->move(pt.getX(), pt.getY());

  p_bacteria->move(pt.getX(), pt.getY());
  p_bacteria->act();

  ASSERT_THAT(p_bacteria->getState(), Eq(ENISI::AgentState::DEAD));
}

TEST_F(AModel, KillsInfectiousBacteriaGroupActingNearTH17Group)
{
  ENISI::Compartment compartment(_dimensions);

  ENISI::TcellGroup * p_tcell =
    (ENISI::TcellGroup * )ENISI::AgentGroupFactory::create("TcellGroup", &compartment);
  ENISI::BacteriaGroup * p_bacteria =
    (ENISI::BacteriaGroup * )ENISI::AgentGroupFactory::create("BacteriaGroup", &compartment);

  repast::Point<int> pt(50, 50);

  p_bacteria->addCellAt(ENISI::BacteriaState::INFECTIOUS, pt);
  p_tcell->addCellAt(ENISI::TcellState::TH17, pt);

  const ENISI::BacteriaGroup::Concentration * p_countBefore = p_bacteria->getCellsAt(pt);
  ASSERT_THAT(p_countBefore->state[ENISI::BacteriaState::INFECTIOUS], Eq(1));
  ASSERT_THAT(p_countBefore->state[ENISI::BacteriaState::DEAD], Eq(0));

  p_bacteria->act();

  const ENISI::BacteriaGroup::Concentration * p_countAfter = p_bacteria->getCellsAt(pt);
  ASSERT_THAT(p_countAfter->state[ENISI::BacteriaState::INFECTIOUS], Eq(0));
  ASSERT_THAT(p_countAfter->state[ENISI::BacteriaState::DEAD], Eq(1));
}
