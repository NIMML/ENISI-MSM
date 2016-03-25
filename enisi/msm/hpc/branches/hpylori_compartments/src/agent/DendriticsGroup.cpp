#include "DendriticsGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

#include "agent/Cytokines.h"

using namespace ENISI;

DendriticsGroup::DendriticsGroup(Compartment * pCompartment, const size_t & count) :
  mpCompartment(pCompartment)
{
  for (size_t i = 0; i < count; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Dentritics, DendriticState::IMMATURE));
    }
}
void DendriticsGroup::act()
{
  Compartment::GridIterator it = mpCompartment->begin();

  do
    {
      act(*it);
    }
  while (it.next());
}


void DendriticsGroup::act(const repast::Point<int> & pt)
{
  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);
  std::vector< Agent * >::iterator it = Dentritics.begin();
  std::vector< Agent * >::iterator end = Dentritics.end();

  std::vector< Agent * > Bacteria;
  // TODO CRITICAL Retrieve Bacteria in neighboring compartment if appropriate;

  StateCount BacteriaStateCount;
  CountStates(Agent::Bacteria, Bacteria, BacteriaStateCount);

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

      /* if no bacteria is around DC, then stays immature */
      if (infectiousBacteriaCount + liveHPyloriCount == 0 && state == DendriticState::IMMATURE)
        {
          newState = DendriticState::IMMATURE;
        }
      /*if more HPylori surrounds DC than bacteria and DC is in epithelium then becomes effector --
       *  0.5 is arbitrary */
      else if (liveHPyloriCount > 0.5 * tolegenicBacteriaCount + 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "Epithelium")
        {
          newState = DendriticState::EFFECTOR;
        }
      /*if less HPylori surrounds DC than bacteria and DC is in epithelium then becomes tolerogenic --
       *  0.5 is arbitrary */
      else if (liveHPyloriCount <= 0.5 * tolegenicBacteriaCount + 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "Epithelium")
        {
          newState = DendriticState::TOLEROGENIC;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary */
      else if (liveHPyloriCount + tolegenicBacteriaCount > 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "LaminaPropria")
        {
          newState = DendriticState::EFFECTOR;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary */
      else if (liveHPyloriCount + tolegenicBacteriaCount <= 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "LaminaPropria")
        {
          newState = DendriticState::TOLEROGENIC;
        }

      if (newState == DendriticState::EFFECTOR)
        {
          ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["IL6"].first->setValueAtCoord(70, pt);
          cytoMap["IL12"].first->setValueAtCoord(70, pt);
        }
      else if (newState == DendriticState::TOLEROGENIC)
        {
          ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["TGFb"].first->setValueAtCoord(70, pt);
        }

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}


