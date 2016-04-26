#include "DendriticsGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"

using namespace ENISI;

DendriticsGroup::DendriticsGroup(Compartment * pCompartment, const double & concentrations) :
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Dentritics, DendriticState::IMMATURE));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_rule17a", p_rule17a);
  pModel->getValue("p_rule17b", p_rule17b);
  pModel->getValue("p_rule48a", p_rule48a);
  pModel->getValue("p_rule48b", p_rule48b);
  pModel->getValue("p_DCDeath", p_DCDeath);
  pModel->getValue("p_rule15", p_rule15);
  pModel->getValue("p_rule34", p_rule34);
  pModel->getValue("p_rule51a", p_rule51a);
  pModel->getValue("p_rule51b", p_rule51b);
  pModel->getValue("p_rule52", p_rule52);
  pModel->getValue("p_iDCEpitheliumDistance", p_iDCEpitheliumDistance);
  pModel->getValue("p_iDCLPDistance", p_iDCLPDistance);
  pModel->getValue("p_mDCGLNDistance", p_mDCGLNDistance);
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

  Concentration DendriticsConcentration;
  concentrations(Agent::Dentritics, Dentritics, DendriticsConcentration);

  // We only request information if we are at the border
  std::vector< Agent * > Bacteria;
  Concentration BacteriaConcentration;
  std::vector< Agent * > HPylori;
  Concentration HPyloriConcentration;

  if (mpCompartment->getType() == Compartment::epithilium)
    {
      if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
        {
          mpCompartment->getAgents(pt, 0, 1, Agent::Bacteria, Bacteria);
          mpCompartment->getAgents(pt, 0, 1, Agent::HPylori, HPylori);
        }
      else if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
        {
          mpCompartment->getAgents(pt, 0, -1, Agent::Bacteria, Bacteria);
          mpCompartment->getAgents(pt, 0, 1, Agent::HPylori, HPylori);
        }
    }

  concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);
  concentrations(Agent::HPylori, HPylori, HPyloriConcentration);

  std::vector< Agent * > Tcells;
  Concentration TcellConcentration;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  // We only request information if we are at the border
  std::vector< Agent * > EpithelialCells;
  Concentration EpithelialCellConcentration;

  if (mpCompartment->getType() == Compartment::lamina_propria &&
      mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
    }

  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      DendriticState::State state = (DendriticState::State) pAgent->getState();

      DendriticState::State newState = state;

      /* with new compartments bacteria state only needs live and dead, as infectious are all in LP and
       * tolegenic are all in lumen     */
      double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];
      double tolegenicBacteriaConcentration = BacteriaConcentration[BacteriaState::TOLEROGENIC];

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      double liveHPyloriConcentration = HPyloriConcentration[HPyloriState::NAIVE];
      double eDendriticsConcentration = DendriticsConcentration[DendriticState::EFFECTOR];
      double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
      double itregConcentration = TcellConcentration[TcellState::iTREG];

      if (state == DendriticState::IMMATURE
          && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < p_iDCEpitheliumDistance // TODO - CRITICAL Determine this value
          && mpCompartment->getType() == Compartment::lamina_propria
          && (p_rule51a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
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
          continue;
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
          continue;
        }

      /* if no bacteria is around DC, then stays immature */
      if (infectiousBacteriaConcentration + liveHPyloriConcentration == 0 && state == DendriticState::IMMATURE)
        {
          newState = DendriticState::IMMATURE;
        }
      /*if more HPylori surrounds DC than bacteria and DC is in epithelium then becomes effector --
       *  0.5 is arbitrary *Rule 2*/
      else if (state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::epithilium
               && (tolegenicBacteriaConcentration  * p_rule48a > liveHPyloriConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::EFFECTOR;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
        }
      /* if less HPylori surrounds DC than bacteria and DC is in epithelium then becomes tolerogenic --
       * 0.5 is arbitrary */
      else if (state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::epithilium
               && (liveHPyloriConcentration * p_rule48b > tolegenicBacteriaConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::TOLEROGENIC;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary, Rule 48 */
      else if (state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::lamina_propria
               && (tolegenicBacteriaConcentration * p_rule17a > liveHPyloriConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::EFFECTOR;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary * Rule 17 and Rule 48*/
      else if (state == DendriticState::IMMATURE
               && mpCompartment->getType() == Compartment::lamina_propria
               && (liveHPyloriConcentration * p_rule17b > tolegenicBacteriaConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = DendriticState::TOLEROGENIC;
        }

      // TODO We should use the production from the ODE model.
      if (newState == DendriticState::EFFECTOR) /*Rule 56*/
        {
          mpCompartment->cytokineValue("IL6", pt) += 70;
          mpCompartment->cytokineValue("IL12", pt) += 70;
        }
      else if (newState == DendriticState::TOLEROGENIC) /*Rule 57*/
        {
          mpCompartment->cytokineValue("TGFb", pt) += 70;
        }

      if (state == DendriticState::IMMATURE
          && (damagedEpithelialCellConcentration > ENISI::Threshold
              || eDendriticsConcentration > ENISI::Threshold)
          && (p_rule15 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Dentritics, pAgent->getState()), Location);
        }

      if ((p_DCDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if (state == DendriticState::EFFECTOR && itregConcentration
          && (p_rule34 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
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
