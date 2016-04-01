#include "agent/MacrophageGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

#include "agent/MacrophageODE1.h"

using namespace ENISI;

MacrophageGroup::MacrophageGroup(Compartment * pCompartment, const size_t & count) :
  mpCompartment(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(count);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE));
    }
}

void MacrophageGroup::act()
{
  for (Iterator it = mpCompartment->begin(); it; it.next())
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
      double IFNg = mpCompartment->cytokineValue("IFNg", pt);
      double IL10 = mpCompartment->cytokineValue("IL10", pt);

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
          mpCompartment->cytokineValue("IL10", pt) = 70;
        }
      /* inflammatory macrophages produce IFNg */
      else if (newState == MacrophageState::INFLAMMATORY)
        {
          mpCompartment->cytokineValue("IFNg", pt) = 70;
        }

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}

