#include "HPyloriGroup.h"

#include "grid/Borders.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"

using namespace ENISI;

HPyloriGroup::HPyloriGroup(Compartment * pCompartment, const double & concentrations):
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::HPylori, HPyloriState::NAIVE));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_rule3", p_rule3);
  pModel->getValue("p_rule4a", p_rule4a);
  pModel->getValue("p_rule4b", p_rule4b);
  pModel->getValue("p_rule5", p_rule5);
  pModel->getValue("p_HPyloriDeath", p_HPyloriDeath);
}

void HPyloriGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0);

  std::vector< Agent * > HPylori;
  mpCompartment->getAgents(pt, Agent::HPylori, HPylori);
  std::vector< Agent * >::iterator it = HPylori.begin();
  std::vector< Agent * >::iterator end = HPylori.end();

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  // We only request information if we are at the border
  std::vector< Agent * > EpithelialCells;
  Concentration EpithelialCellConcentration;

  if (mpCompartment->getType() == Compartment::lumen &&
      mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::EpithelialCell, EpithelialCells);
    }
  else if (mpCompartment->getType() == Compartment::lamina_propria &&
           mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
    }

  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      HPyloriState::State state = (HPyloriState::State) pAgent->getState();

      if (state == HPyloriState::DEAD)
        continue;

      /*identify states of Epithelial Cells counted */
      double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];

      /* move HPylori across epithelial border if in contact with damaged Epithelial cell *Rule 3*/
      if ((p_rule3 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()) && damagedEpithelialCellConcentration && mpCompartment->getType() == Compartment::lumen)
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] +=
            1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH) // Move accross the border
            + Compartment::instance(Compartment::epithilium)->spaceDimensions().extents(Borders::Y); // Move all the way through the epithelium

          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
        }

      double th1Concentration = TcellConcentration[TcellState::TH1];
      double th17Concentration = TcellConcentration[TcellState::TH17];

      /* HPylori dies is nearby damaged epithelial cell, th1 or th17* *Rule 5,6,7*/
      if ((damagedEpithelialCellConcentration > ENISI::Threshold
           || th1Concentration > ENISI::Threshold
           || th17Concentration > ENISI::Threshold) &&
          (p_rule5 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          // newState = HPyloriState::DEAD;
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if ((p_HPyloriDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if (mpCompartment->getType() == Compartment::lamina_propria
          && (p_rule4a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::HPylori, pAgent->getState()), Location);
        }

      if (mpCompartment->getType() == Compartment::lumen
          && (p_rule4b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::HPylori, pAgent->getState()), Location);
        }

      /* H Pylori are removed when macrophage uptake/differentiate handled throu macrophages */

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}

// virtual
void HPyloriGroup::write(const repast::Point<int> &)
{

}