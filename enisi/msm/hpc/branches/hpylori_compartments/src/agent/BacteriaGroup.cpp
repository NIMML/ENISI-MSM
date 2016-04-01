#include "BacteriaGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

using namespace ENISI;

int p_BacteriaKill;
int p_BacteriaDeath;
int p_BacteriaLPProl;
int p_BacteriaLumProl;
int p_rule1;

BacteriaGroup::BacteriaGroup(Compartment * pCompartment, const size_t & count):
  mpCompartment(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(count);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Bacteria, BacteriaState::TOLEROGENIC));
    }
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
  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
  std::vector< Agent * >::iterator it = Bacteria.begin();
  std::vector< Agent * >::iterator end = Bacteria.end();

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
      BacteriaState::State state = (BacteriaState::State) pAgent->getState();

      if (state == BacteriaState::DEAD) continue;

      BacteriaState::State newState = state;

      /*identify states of Epithelial Cells counted */
      unsigned int damagedEpithelialCellCount = EpithelialCellStateCount[EpithelialCellState::DAMAGED];

      /* move Bacteria across epithelial border if in contact with damaged Epithelial cell */
      if (damagedEpithelialCellCount && mpCompartment->getType() == Compartment::lumen && (p_rule1 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] +=
              Compartment::instance(Compartment::epithilium)->dimensions().extents(Borders::Y) +
              mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);

          mpCompartment->moveTo(pAgent->getId(), Location);
        }

       unsigned int th1Count = TcellStateCount[TcellState::TH1];
      unsigned int th17Count = TcellStateCount[TcellState::TH17];

      /* Bacteria dies is nearby damaged epithelial cell, th1 or th17 and is infectious*/
      if ((newState == BacteriaState::INFECTIOUS)
          && (damagedEpithelialCellCount || th1Count || th17Count) && (p_BacteriaKill > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
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
      if (mpCompartment->getType() == Compartment::lamina_propria && (p_BacteriaLPProl > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
                        {
    	  	  	  	  	  addCellAt(pAgent->getId(), Location);
                          continue;
                        }
      if (mpCompartment->getType() == Compartment::lumen && (p_BacteriaLumProl > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
                        {
    	  	  	  	  	  addCellAt(pAgent->getId(), Location);
                          continue;
                        }

      /* TODO: Bacteria are removed when macrophage uptake/differentiate */

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}

