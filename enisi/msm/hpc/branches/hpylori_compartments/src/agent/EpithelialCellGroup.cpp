#include "EpithelialCellGroup.h"

#include "grid/Borders.h"
#include "compartment/Compartment.h"
using namespace ENISI;

EpithelialCellGroup::EpithelialCellGroup(Compartment * pCompartment, const size_t & count):
  mpCompartment(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(count);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::EpithelialCell, EpithelialCellState::HEALTHY));
    }
}

void EpithelialCellGroup::act()
{
  for (Iterator it = mpCompartment->begin(); it; it.next())
    {
      act(*it);
    }
}


void EpithelialCellGroup::act(const repast::Point<int> & pt)
{
  std::vector< Agent * > EpithelialCells;
  mpCompartment->getAgents(pt, Agent::EpithelialCell, EpithelialCells);
  std::vector< Agent * >::iterator it = EpithelialCells.begin();
  std::vector< Agent * >::iterator end = EpithelialCells.end();

  // We only request information if we are at the border
  std::vector< Agent * > Bacteria;
  StateCount BacteriaStateCount;

  std::vector< Agent * > Tcells;
  StateCount TcellsCellStateCount;

  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.0)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::Bacteria, Bacteria);
      CountStates(Agent::Bacteria, Bacteria, BacteriaStateCount);

      mpCompartment->getAgents(pt, 0, 1, Agent::Tcell, Tcells);
      CountStates(Agent::Tcell, Tcells, TcellsCellStateCount);
    }
  else if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 1.0)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::Bacteria, Bacteria);
      CountStates(Agent::Bacteria, Bacteria, BacteriaStateCount);
    }


  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      EpithelialCellState::State state = (EpithelialCellState::State) pAgent->getState();

      if (state == EpithelialCellState::DEAD) continue;

      EpithelialCellState::State newState = state;

      unsigned int infectiousBacteriaCount = BacteriaStateCount[BacteriaState::INFECTIOUS];
      unsigned int tolegenicBacteriaCount = BacteriaStateCount[BacteriaState::TOLEROGENIC];

      //Rules 9 and 10
      unsigned int th17Count = TcellsCellStateCount[TcellState::TH17]; //Rule 10 when Th17 is in contact
      unsigned int th1Count = TcellsCellStateCount[TcellState::TH1]; //RUle 9 when Th1 is in contact

      if (infectiousBacteriaCount && state == EpithelialCellState::HEALTHY)
        {
          newState = EpithelialCellState::DAMAGED;
        }
      else if (tolegenicBacteriaCount && state == EpithelialCellState::HEALTHY)
        {
          newState = EpithelialCellState::HEALTHY;
        }
      else if (th17Count && state == EpithelialCellState::HEALTHY
               && mpCompartment->getType() == Compartment::lamina_propria) // TODO CRITICAL This will never be true
        {
          newState = EpithelialCellState::DAMAGED; /*Rule 10*/
          /* CHECK : Here there should be a function for information regarding the Layer,
          for eg. This rule requires the state transition when TH17 in LaminaPropria is in contact with E at 'Epithelium and LaminaPropria' membrane*/
        }
      else if (th1Count && state == EpithelialCellState::HEALTHY
               && mpCompartment->getType() == Compartment::lamina_propria) // TODO CRITICAL This will never be true
        {
          newState = EpithelialCellState::DAMAGED; /*Rule 9*/
          /* CHECK : Here there should be a function for information regarding the Layer,
          for eg. This rule requires the state transition when TH1 in LaminaPropria is in contact with E at 'Epithelium and LaminaPropria' membrane*/
        }
      else if (state == EpithelialCellState::HEALTHY &&
          mpCompartment->getType() == Compartment::epithilium) // TODO CRITICAL This will always be true
        {
          // addCellAt(state, newLoc);/* Rule 8*/
          mpCompartment->removeAgent(pAgent); /*Rule 11*/
        }

      if (newState == EpithelialCellState::DAMAGED)
        {
          mpCompartment->cytokineValue("IL6", pt) = 70;
          mpCompartment->cytokineValue("IL12", pt) = 70;
        }

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}
