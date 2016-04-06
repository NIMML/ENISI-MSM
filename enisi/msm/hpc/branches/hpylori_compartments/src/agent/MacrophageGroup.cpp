#include "agent/MacrophageGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

#include "agent/MacrophageODE1.h"

using namespace ENISI;

int p_rule42;
int p_MinfDiff;
int p_rule13;
int p_rule28a;
int p_rule28b;

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
  std::vector< double > Location(2, 0);

  std::vector< Agent * > Macrophages;
  mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);
  std::vector< Agent * >::iterator it = Macrophages.begin();
  std::vector< Agent * >::iterator end = Macrophages.end();
  StateCount MacrophageStateCount;
  CountStates(Agent::Macrophage, Macrophages, MacrophageStateCount);

  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
  StateCount BacteriaStateCount;
  CountStates(Agent::Bacteria, Bacteria, BacteriaStateCount);

  std::vector< Agent * > HPylori;
  mpCompartment->getAgents(pt, Agent::HPylori, HPylori);
  StateCount HPyloriStateCount;
  CountStates(Agent::HPylori, HPylori, HPyloriStateCount);

  std::vector< Agent * > EpithelialCells;
  // TODO CRITICAL Retrieve epithelial cells in neighboring compartment if appropriate;

  StateCount EpithelialCellStateCount;
  CountStates(Agent::EpithelialCell, EpithelialCells, EpithelialCellStateCount);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);
  StateCount DentriticsStateCount;
  CountStates(Agent::Dentritics, Dentritics, DentriticsStateCount);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      MacrophageState::State state = (MacrophageState::State) pAgent->getState();

      if (state == MacrophageState::DEAD) continue;

      MacrophageState::State newState = state;

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      unsigned int liveHPyloriCount = HPyloriStateCount[HPyloriState::NAIVE];
      unsigned int eDendriticsCount = DentriticsStateCount[DendriticState::EFFECTOR];
      unsigned int damagedEpithelialCellCount = EpithelialCellStateCount[EpithelialCellState::DAMAGED];
      unsigned int macrophageregCount = MacrophageStateCount[MacrophageState::REGULATORY];
      unsigned int macrophageinfCount = MacrophageStateCount[MacrophageState::INFLAMMATORY];
      unsigned int infectiousBacteriaCount = BacteriaStateCount[BacteriaState::INFECTIOUS];
      // unsigned int tolegenicBacteriaCount = BacteriaStateCount[BacteriaState::TOLEROGENIC];

      /*get concentration of IFNg and IL10 for COPASI input*/
      double IFNg = mpCompartment->cytokineValue("IFNg", pt);
      double IL10 = mpCompartment->cytokineValue("IL10", pt);

      /* if no bacteria is around macrophage, then stays immature */
      if ((liveHPyloriCount|| infectiousBacteriaCount) && state == MacrophageState::MONOCYTE && (p_rule42 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          /* set initial concentrations */
    	  /* NOTE: IFNg and IL10 provide good Mreg variation between values 0 and 10 */
          MacrophageODE1 & odeModel = MacrophageODE1::getInstance();
          odeModel.setInitialConcentration("IFNg", IFNg);
          odeModel.setInitialConcentration("IL10", IL10);

          /* run time course */
          odeModel.runTimeCourse();

          // double IFNg = odeModel.getConcentration("IFNg");
          // double IL10 = odeModel.getConcentration("IL10");
          double Mreg = odeModel.getConcentration("Mreg");

          /* regulatory macrophages differentiate if ODE predicts regulatory differentiation */
          /* NOTE: Mreg value from ODE model will vary from 0 to 1 */
          if (Mreg > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next() &&
              HPylori.size())
            {
              newState = MacrophageState::REGULATORY;

              mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
              HPylori.pop_back();
            }
          /* inflammatory macrophages differentiate if ODE predicts inflammatory differentiation */
          else if (p_MinfDiff > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next() &&
                   HPylori.size())
            {
              newState = MacrophageState::INFLAMMATORY;

              // TODO CRITICAL Does this always consume an HPylori
              mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
              HPylori.pop_back();
            }
        }

      /* regulatory macrophages produce IL10 */
      if (newState == MacrophageState::REGULATORY)
        {
          mpCompartment->cytokineValue("IL10", pt) = 70;
        }
      /* inflammatory macrophages produce IFNg */
      if (newState == MacrophageState::INFLAMMATORY)
        {
          mpCompartment->cytokineValue("IFNg", pt) = 70;
        }

      if (state == MacrophageState::MONOCYTE
          && (damagedEpithelialCellCount || eDendriticsCount) && (p_rule13 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
        }

      if (state == MacrophageState::REGULATORY && macrophageinfCount &&
          (p_rule28a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if (state == MacrophageState::INFLAMMATORY && macrophageregCount &&
          (p_rule28b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
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

