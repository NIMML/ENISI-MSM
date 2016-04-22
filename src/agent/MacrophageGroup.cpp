#include "agent/MacrophageGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "agent/MacrophageODE1.h"

using namespace ENISI;

MacrophageGroup::MacrophageGroup(Compartment * pCompartment, const double & concentrations):
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_rule42", p_rule42);
  pModel->getValue("p_MinfDiff", p_MinfDiff);
  pModel->getValue("p_rule13", p_rule13);
  pModel->getValue("p_rule28a", p_rule28a);
  pModel->getValue("p_rule28b", p_rule28b);
}

MacrophageGroup::~MacrophageGroup()
{}

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
  Concentration MacrophageConcentration;
  concentrations(Agent::Macrophage, Macrophages, MacrophageConcentration);

  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
  Concentration BacteriaConcentration;
  concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);

  std::vector< Agent * > HPylori;
  Concentration HPyloriConcentration;
  concentrations(Agent::HPylori, HPylori, HPyloriConcentration);

  std::vector< Agent * > EpithelialCells;
  Concentration EpithelialCellConcentration;

  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 1)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
    }

  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);
  Concentration DentriticsConcentration;
  concentrations(Agent::Dentritics, Dentritics, DentriticsConcentration);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      MacrophageState::State state = (MacrophageState::State) pAgent->getState();

      MacrophageState::State newState = state;

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      double liveHPyloriConcentration = HPyloriConcentration[HPyloriState::NAIVE];
      double eDendriticsConcentration = DentriticsConcentration[DendriticState::EFFECTOR];
      double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
      double macrophageregConcentration = MacrophageConcentration[MacrophageState::REGULATORY];
      double macrophageinfConcentration = MacrophageConcentration[MacrophageState::INFLAMMATORY];
      double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];
      // double tolegenicBacteriaConcentration = BacteriaConcentration[BacteriaState::TOLEROGENIC];

      /*get concentration of IFNg and IL10 for COPASI input*/
      double IFNg = mpCompartment->cytokineValue("IFNg", pt);
      double IL10 = mpCompartment->cytokineValue("IL10", pt);

      /* if no bacteria is around macrophage, then stays immature */
      if ((liveHPyloriConcentration > ENISI::Threshold
           || infectiousBacteriaConcentration > ENISI::Threshold)
          && state == MacrophageState::MONOCYTE
          && (p_rule42 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
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

      // TODO We should use the production fo the ODE model
      /* regulatory macrophages produce IL10 */
      if (newState == MacrophageState::REGULATORY)
        {
          mpCompartment->cytokineValue("IL10", pt) += 70;
        }

      /* inflammatory macrophages produce IFNg */
      if (newState == MacrophageState::INFLAMMATORY)
        {
          mpCompartment->cytokineValue("IFNg", pt) += 70;
        }

      if (state == MacrophageState::MONOCYTE
          && (damagedEpithelialCellConcentration || eDendriticsConcentration) && (p_rule13 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
        }

      if (state == MacrophageState::REGULATORY && macrophageinfConcentration &&
          (p_rule28a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if (state == MacrophageState::INFLAMMATORY && macrophageregConcentration &&
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
