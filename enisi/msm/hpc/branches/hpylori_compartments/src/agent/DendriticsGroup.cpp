#include "DendriticsGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

using namespace ENISI;

int p_rule17a;
int p_rule17b;
int p_rule48a;
int p_rule48b;
int p_DCDeath;
int p_rule15;
int p_rule34;
int p_rule51a;
int p_rule51b;
int p_rule52;
double p_iDCEpitheliumDistance;
double p_iDCLPDistance;
double p_mDCGLNDistance;

DendriticsGroup::DendriticsGroup(Compartment * pCompartment, const size_t & count) :
  mpCompartment(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(count);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Dentritics, DendriticState::IMMATURE));
    }
}

void DendriticsGroup::act()
{
  for (Iterator it = mpCompartment->begin(); it; it.next())
    {
      act(*it);
    }
}


void DendriticsGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);
  std::vector< Agent * >::iterator it = Dentritics.begin();
  std::vector< Agent * >::iterator end = Dentritics.end();

  StateCount DendriticsStateCount;
  CountStates(Agent::Dentritics, Dentritics, DendriticsStateCount);

  std::vector< Agent * > Bacteria;
  // TODO CRITICAL Retrieve Bacteria in neighboring compartment if appropriate;

  StateCount BacteriaStateCount;
  CountStates(Agent::Bacteria, Bacteria, BacteriaStateCount);

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

  StateCount TcellStateCount;
  CountStates(Agent::Tcell, Tcells, TcellStateCount);

  std::vector< Agent * > EpithelialCells;
  // TODO CRITICAL Retrieve epithelial cells in neighboring compartment if appropriate;

  StateCount EpithelialCellStateCount;
  CountStates(Agent::EpithelialCell, EpithelialCells, EpithelialCellStateCount);

  std::vector< Agent * > HPylori;
  // TODO CRITICAL Retrieve HPylori in neighboring compartment if appropriate;

  StateCount HPyloriStateCount;
  CountStates(Agent::HPylori, HPylori, HPyloriStateCount);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      DendriticState::State state = (DendriticState::State) pAgent->getState();

      if (state == DendriticState::DEAD) continue;

      DendriticState::State newState = state;

      /* with new compartments bacteria state only needs live and dead, as infectious are all in LP and
       * tolegenic are all in lumen     */
      unsigned int infectiousBacteriaCount = BacteriaStateCount[BacteriaState::INFECTIOUS];
      unsigned int tolegenicBacteriaCount = BacteriaStateCount[BacteriaState::TOLEROGENIC];

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      unsigned int liveHPyloriCount = HPyloriStateCount[HPyloriState::NAIVE];
      unsigned int eDendriticsCount = DendriticsStateCount[DendriticState::EFFECTOR];
      unsigned int damagedEpithelialCellCount = EpithelialCellStateCount[EpithelialCellState::DAMAGED];
      unsigned int itregCount = TcellStateCount[TcellState::iTREG];

      if (state == DendriticState::IMMATURE
               && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < p_iDCEpitheliumDistance // TODO - CRITICAL Determine this value
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule51a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }

      if (state == DendriticState::IMMATURE
               && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < p_iDCLPDistance //TODO - CRITICAL Determine this value
               && mpCompartment->getType() == Compartment::epithilium
               && (p_rule51b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }

      if (state == (DendriticState::EFFECTOR || DendriticState::TOLEROGENIC)
               && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < p_mDCGLNDistance //TODO - CRITICAL Determine this value
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule52 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }

      /* if no bacteria is around DC, then stays immature */
      if (infectiousBacteriaCount + liveHPyloriCount == 0 && state == DendriticState::IMMATURE)
        {
          newState = DendriticState::IMMATURE;
        }
      /*if more HPylori surrounds DC than bacteria and DC is in epithelium then becomes effector --
       *  0.5 is arbitrary *Rule 2*/
      else if (liveHPyloriCount > 0.5 * tolegenicBacteriaCount + 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::epithilium
			   && (p_rule48a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::EFFECTOR;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }
      /*if less HPylori surrounds DC than bacteria and DC is in epithelium then becomes tolerogenic --
       *  0.5 is arbitrary */
      else if (liveHPyloriCount <= 0.5 * tolegenicBacteriaCount + 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::epithilium
			   && (p_rule48b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::TOLEROGENIC;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary, Rule 48 */
      else if (liveHPyloriCount + tolegenicBacteriaCount > 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::lamina_propria
			   && (p_rule17a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::EFFECTOR;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary * Rule 17 and Rule 48*/
      else if (liveHPyloriCount + tolegenicBacteriaCount <= 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::lamina_propria
			   && (p_rule17b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::TOLEROGENIC;
        }

      if (newState == DendriticState::EFFECTOR) /*Rule 56*/
        {
          mpCompartment->cytokineValue("IL6", pt) = 70;
          mpCompartment->cytokineValue("IL12", pt) = 70;
        }
      else if (newState == DendriticState::TOLEROGENIC) /*Rule 57*/
        {
          mpCompartment->cytokineValue("TGFb", pt) = 70;
        }

      if (state == DendriticState::IMMATURE
          && (damagedEpithelialCellCount || eDendriticsCount) && (p_rule15 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Dentritics, pAgent->getState()), Location);
        }
      if ((p_DCDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }
      if (state == DendriticState::EFFECTOR && itregCount && (p_rule34 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}


