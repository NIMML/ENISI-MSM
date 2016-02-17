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

TEST_F(AModel, KillsInfectiousBacteriaGroupActingNearTH17Group)
{
  ENISI::Compartment compartment(_dimensions);

  TcellGroup * p_tcell = 
    (TcellGroup * )AgentGroupFactory::create("TcellGroup", &compartment);
  BacteriaGroup * p_bacteria = 
    (BacteriaGroup * )AgentGroupFactory::create("BacteriaGroup", &compartment);

  repast::Point<int> pt(50, 50);

  p_bacteria->addCellAt(BacteriaState::INFECTIOUS, pt);
  p_tcell->addCellAt(TcellState::TH17, pt);

  const BacteriaGroup::StateCount * p_countBefore = p_bacteria->getCellsAt(pt);
  ASSERT_THAT(p_countBefore->state[BacteriaState::INFECTIOUS], Eq(1));
  ASSERT_THAT(p_countBefore->state[BacteriaState::DEAD], Eq(0));

  p_bacteria->act();

  const BacteriaGroup::StateCount * p_countAfter = p_bacteria->getCellsAt(pt);
  ASSERT_THAT(p_countAfter->state[BacteriaState::INFECTIOUS], Eq(0));
  ASSERT_THAT(p_countAfter->state[BacteriaState::DEAD], Eq(1));
}
