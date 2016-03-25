#include "HPyloriGroup.h"

#include "grid/Borders.h"
#include "compartment/Compartment.h"

using namespace ENISI;

HPyloriGroup::HPyloriGroup(Compartment * pCompartment, const size_t & count):
  mpCompartment(pCompartment)
{
  for (size_t i = 0; i < count; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::HPylori, HPyloriState::NAIVE));
    }
}

void HPyloriGroup::act()
{
  for (Compartment::GridIterator it = mpCompartment->begin(); it; it.next())
    {
      act(*it);
    }
}

void HPyloriGroup::act(const repast::Point<int> & pt)
{
  std::vector< Agent * > HPylori;
  mpCompartment->getAgents(pt, Agent::HPylori, HPylori);
  std::vector< Agent * >::iterator it = HPylori.begin();
  std::vector< Agent * >::iterator end = HPylori.end();

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

  StateCount TcellStateCount;
  CountStates(Agent::Tcell, Tcells, TcellStateCount);

  std::vector< Agent * > EpithelialCells;
  // TODO CRITICAL Retrieve epithelial cells in neighboring compartment if appropriate;

  StateCount EpithelialCellStateCount;
  CountStates(Agent::EpithelialCell, EpithelialCells, EpithelialCellStateCount);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      HPyloriState::State state = (HPyloriState::State) pAgent->getState();

      if (state == HPyloriState::DEAD)
        continue;

      /*identify states of Epithelial Cells counted */
      unsigned int damagedEpithelialCellCount = EpithelialCellStateCount[EpithelialCellState::DAMAGED];

      /* move HPylori across epithelial border if in contact with damaged Epithelial cell */
      if (damagedEpithelialCellCount && mpCompartment->getType() == Compartment::lumen)
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] +=
              Compartment::instance(Compartment::epithilium)->dimensions().extents(Borders::Y) +
              mpCompartment->borders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);

          mpCompartment->moveTo(pAgent->getId(), Location);
        }

      unsigned int th1Count = TcellStateCount[TcellState::TH1];
      unsigned int th17Count = TcellStateCount[TcellState::TH17];

      /* HPylori dies is nearby damaged epithelial cell, th1 or th17*/
      if (damagedEpithelialCellCount || th1Count || th17Count)
        {
          // newState = HPyloriState::DEAD;
          mpCompartment->removeAgent(pAgent);
        }

      /* TODO: H Pylori are removed when macrophage uptake/differentiate */

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}

