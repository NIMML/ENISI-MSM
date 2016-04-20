#include "BacteriaGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"

using namespace ENISI;

BacteriaGroup::BacteriaGroup(Compartment * pCompartment, const double & concentrations) :
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Bacteria, BacteriaState::TOLEROGENIC));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_BacteriaKill", p_BacteriaKill);
  pModel->getValue("p_BacteriaDeath", p_BacteriaDeath);
  pModel->getValue("p_BacteriaLPProl", p_BacteriaLPProl);
  pModel->getValue("p_BacteriaLumProl", p_BacteriaLumProl);
  pModel->getValue("p_rule1", p_rule1);
}

void BacteriaGroup::act()
{
  for (Iterator it = mpCompartment->begin(); it; it.next())
    {
      act(*it);
    }
}

void BacteriaGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0);

  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
  std::vector< Agent * >::iterator it = Bacteria.begin();
  std::vector< Agent * >::iterator end = Bacteria.end();

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  std::vector< Agent * > EpithelialCells;
  Concentration EpithelialCellConcentration;

  // We only request information if we are at the border
  if (mpCompartment->getType() == Compartment::lumen &&
      mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.0)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::EpithelialCell, EpithelialCells);
      concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);
    }
  else if (mpCompartment->getType() == Compartment::lamina_propria &&
           mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 1.0)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
      concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);
    }

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      BacteriaState::State state = (BacteriaState::State) pAgent->getState();

      if (state == BacteriaState::DEAD) continue;

      BacteriaState::State newState = state;

      /*identify states of Epithelial Cells counted */
      double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];

      /* move Bacteria across epithelial border if in contact with damaged Epithelial cell */
      if (damagedEpithelialCellConcentration > ENISI::Threshold
          && mpCompartment->getType() == Compartment::lumen
          && (p_rule1 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] +=
            Compartment::instance(Compartment::epithilium)->dimensions().extents(Borders::Y) +
            mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);

          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
        }

      double th1Concentration = TcellConcentration[TcellState::TH1];
      double th17Concentration = TcellConcentration[TcellState::TH17];

      /* Bacteria dies is nearby damaged epithelial cell, th1 or th17 and is infectious*/
      if ((newState == BacteriaState::INFECTIOUS)
          && (damagedEpithelialCellConcentration > ENISI::Threshold
              || th1Concentration > ENISI::Threshold
              || th17Concentration > ENISI::Threshold)
          && (p_BacteriaKill > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      /* Bacteria become infectious when moved into Lamina Propria */
      if (mpCompartment->getType() == Compartment::lamina_propria)
        {
          newState = BacteriaState::INFECTIOUS;
        }

      if ((p_BacteriaDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if (mpCompartment->getType() == Compartment::lamina_propria
          && (p_BacteriaLPProl > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Bacteria, pAgent->getState()), Location);
        }

      if (mpCompartment->getType() == Compartment::lumen &&
          (p_BacteriaLumProl > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Bacteria, pAgent->getState()), Location);
        }

      /* TODO: Bacteria are removed when macrophage uptake/differentiate */

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}
