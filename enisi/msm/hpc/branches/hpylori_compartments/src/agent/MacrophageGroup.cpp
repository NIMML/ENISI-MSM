#include "agent/MacrophageGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

#include "agent/MacrophageODE1.h"
#include "agent/Cytokines.h"

// #include "agent/HPyloriGroup.h"
// #include "agent/Cytokines.h"
// #include "agent/MacrophageODE1.h"
// #include "agent/MacrophageODE2.h"

using namespace ENISI;

MacrophageGroup::MacrophageGroup(Compartment * pCompartment, const size_t & count) :
  mpCompartment(pCompartment)
{
  for (size_t i = 0; i < count; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE));
    }
}

void MacrophageGroup::act()
{
  for (Compartment::GridIterator it = mpCompartment->begin(); it; it.next())
    {
      act(*it);
    }
}

void MacrophageGroup::act(const repast::Point<int> & pt)
{
  std::vector< Agent * > Macrophages;
  mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);
  std::vector< Agent * >::iterator it = Macrophages.begin();
  std::vector< Agent * >::iterator end = Macrophages.end();

  std::vector< Agent * > HPylori;
  mpCompartment->getAgents(pt, Agent::HPylori, HPylori);
  StateCount StateCount;
  CountStates(Agent::HPylori, HPylori, StateCount);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      MacrophageState::State state = (MacrophageState::State) pAgent->getState();

      if (state == MacrophageState::DEAD) continue;

      MacrophageState::State newState = state;

      /* //If monocytes + hp //then new state -> m_reg
      if (state == MacrophageState::MONOCYTE)
      {
        if (hPyloriCount || tolBCount) {newState = MacrophageState::REGULATORY;}
      }
      */
      //If monocytes + TolB
      //then new state -> m_reg-

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      unsigned int liveHPyloriCount = StateCount[HPyloriState::NAIVE];

      /*get concentration of IFNg and IL10 for COPASI input*/
      double IFNg = Cytokines::instance().get("IFNg", pt);
      double IL10 = Cytokines::instance().get("IL10", pt);

      /* if no bacteria is around DC, then stays immature */
      if (liveHPyloriCount && state == MacrophageState::MONOCYTE)
        {
          /* set initial concentrations */
          MacrophageODE1 & odeModel = MacrophageODE1::getInstance();
          odeModel.setInitialConcentration("IFNg", IFNg);
          odeModel.setInitialConcentration("IL10", IL10);

          /* run time course */
          odeModel.runTimeCourse();

          // double IFNg = odeModel.getConcentration("IFNg");
          // double IL10 = odeModel.getConcentration("IL10");
          double Mreg = odeModel.getConcentration("Mreg");
          double Minf = odeModel.getConcentration("Minf");

          /* regulatory macrophages differentiate if ODE predicts regulatory differentiation */
          if (Mreg >= Minf)
            {
              newState = MacrophageState::REGULATORY;
            }

          /* inflammatory macrophages differentiate if ODE predicts inflammatory differentiation */
          if (Minf > Mreg)
            {
              newState = MacrophageState::INFLAMMATORY;
            }
        }

      /* regulatory macrophages produce IL10 */
      if (newState == MacrophageState::REGULATORY)
        {
          ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["IL10"].first->setValueAtCoord(70, pt);
        }
      /* inflammatory macrophages produce IFNg */
      else if (newState == MacrophageState::INFLAMMATORY)
        {
          ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["IFNg"].first->setValueAtCoord(70, pt);
        }

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}

