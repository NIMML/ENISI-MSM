#include "TcellGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"

#include "agent/TcellODE.h"
#include "grid/Borders.h"

using namespace ENISI;

TcellGroup::TcellGroup(Compartment * pCompartment, const double & concentrations) :
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Tcell, TcellState::NAIVE));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_rule18", p_rule18);
  pModel->getValue("p_rule19", p_rule19);
  pModel->getValue("p_rule20", p_rule20);
  pModel->getValue("p_rule21", p_rule21);
  pModel->getValue("p_rule22", p_rule22);
  pModel->getValue("p_rule23", p_rule23);
  pModel->getValue("p_rule24", p_rule24);
  pModel->getValue("p_rule26", p_rule26);
  pModel->getValue("p_rule27", p_rule27);
  pModel->getValue("p_rule31", p_rule31);
  pModel->getValue("p_rule31a", p_rule31a);
  pModel->getValue("p_rule32", p_rule32);
  pModel->getValue("p_rule33", p_rule33);
  pModel->getValue("p_rule35", p_rule35);
  pModel->getValue("p_rule36", p_rule36);
  pModel->getValue("p_rule37", p_rule37);
  pModel->getValue("p_rule38", p_rule38);
  pModel->getValue("p_rule39", p_rule39);
  pModel->getValue("p_rule40", p_rule40);
  pModel->getValue("p_rule41", p_rule41);
  pModel->getValue("p_rule53", p_rule53);
  pModel->getValue("p_rule55a", p_rule55a);
  pModel->getValue("p_rule55b", p_rule55b);
  pModel->getValue("neardistane_border", neardistane_border);
}

void TcellGroup::act()
{
  for (Iterator it = mpCompartment->begin(); it; it.next())
    {
      act(*it);
    }
}

void TcellGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0.0);

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
  std::vector< Agent * >::iterator it = Tcells.begin();
  std::vector< Agent * >::iterator end = Tcells.end();

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  std::vector< Agent * > Macrophages;
  mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);
  Concentration MacrophageConcentration;
  concentrations(Agent::Macrophage, Macrophages, MacrophageConcentration);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);
  Concentration DentriticsConcentration;
  concentrations(Agent::Dentritics, Dentritics, DentriticsConcentration);

  // We only request information if we are at the border
  std::vector< Agent * > EpithelialCells;
  Concentration EpithelialCellConcentration;

  if (mpCompartment->getType() == Compartment::lamina_propria &&
      mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 1.0)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
      concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);
    }

  double IL6 = mpCompartment->cytokineValue("IL6", pt);
  double TGFb = mpCompartment->cytokineValue("TGFb", pt);
  double IL12 = mpCompartment->cytokineValue("IL12", pt);

  TcellODE & odeModel = TcellODE::getInstance();
  odeModel.setInitialConcentration("IL6", IL6);
  odeModel.setInitialConcentration("TGFb", TGFb);
  odeModel.setInitialConcentration("IL12", IL12);

  /* run time course */
  odeModel.runTimeCourse();

  double IFNg = odeModel.getConcentration("IFNg");
  double IL17 = odeModel.getConcentration("IL17");
  double IL10 = odeModel.getConcentration("IL10");

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      TcellState::State state = (TcellState::State) pAgent->getState();

      if (state == TcellState::DEAD)
        continue;

      TcellState::State newState = state;

      double macrophageregConcentration = MacrophageConcentration[MacrophageState::REGULATORY];

      double th17Concentration = TcellConcentration[TcellState::TH17]; //Rules 22, 23, 36-39 when Th17 is in contact
      double itregConcentration = TcellConcentration[TcellState::iTREG]; //Rules 19-21 when iTreg is in contact
      double th1Concentration = TcellConcentration[TcellState::TH1];

      double eDCConcentration = DentriticsConcentration[DendriticState::EFFECTOR]; //Rule 39 eDC count that is in contact with nT
      double tDCConcentration = DentriticsConcentration[DendriticState::TOLEROGENIC]; //Rule 23 tDC count

      double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];// Rule 18 damagedEpithelialCellConcentration

      if (state != TcellState::Tr)
        {
          if (IL17 > 0.5)
            {
              newState = TcellState::TH17;
            }
          else if (IFNg > 0.5)
            {
              newState = TcellState::TH1;
            }
          else if (IL10 > 0.5)
            {
              newState = TcellState::iTREG;
            }
        }/*Rule 58*/

      if (state == TcellState::TH17)
        {
          mpCompartment->cytokineValue("IL17", pt) += 70;
        }
      else if (state == TcellState::TH1)
        {
          mpCompartment->cytokineValue("IFNg", pt) += 70;
        }
      else if (state == TcellState::iTREG)
        {
          mpCompartment->cytokineValue("IL10", pt) += 70;
        }

      if ((IL10 > p_rule31a * IFNg)
          && (macrophageregConcentration > ENISI::Threshold)
          && state == TcellState::NAIVE
          && mpCompartment->getType() == Compartment::lamina_propria
          && (p_rule31 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::Tr; /* Rule 31- The rule is if nT is in contact with regulatory macrophages, and if IL10> a* IFNg
         //then nT -> Tr (state transition)*/
        }
      else if ((tDCConcentration > ENISI::Threshold)
               && state == TcellState::TH17
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule36 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::iTREG; /*Rule 36*/
        }
      else if ((itregConcentration > ENISI::Threshold)
               && state == TcellState::TH17
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule35 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::iTREG; /*Rule 35*/
        }
      else if ((th17Concentration > ENISI::Threshold)
               && state == TcellState::iTREG
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule37 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH17; /*Rule 37*/
        }
      else if ((eDCConcentration  > ENISI::Threshold)
               && state == TcellState::NAIVE
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule39 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH1; /*Rule 39*/
        }
      else if (mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule40 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
        }
      else if ((eDCConcentration > ENISI::Threshold)
               && state == TcellState::iTREG
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule20 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH17; /*Rule 20*/
        }
      else if ((th17Concentration  > ENISI::Threshold) && state == TcellState::TH17
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule21 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH17; /*Rule 21*/
        }
      else if ((itregConcentration > ENISI::Threshold) && state == TcellState::TH1
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule22 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::iTREG; /*Rule 22*/
        }
      else if ((tDCConcentration  > ENISI::Threshold) && state == TcellState::TH17
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule23 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::iTREG; /*Rule 23*/
        }
      else if ((damagedEpithelialCellConcentration  > ENISI::Threshold)
               && state == TcellState::iTREG
               && mpCompartment->getType() == Compartment::epithilium
               && (p_rule18> repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH17; /*Rule 18*/
          /* CHECK : Here there should be a function for information regarding the Layer,
           for eg. This rule requires the state transition when iTREG is in contact with Edamaged at 'Epithelium and LaminaPropria' membrane*/
        }
      else if ((th1Concentration > ENISI::Threshold) && state == TcellState::iTREG
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule19 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH17; /*Rule 19*/
        }
      else if (mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule41 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(
            new Agent(Agent::Tcell, pAgent->getState()), Location);
          // TODO CRITICAL Proliferation can always happen it is not condition dependent - FIXED
          // addCellAt(TcellState::NAIVE, loc); /*Rule 41* - nT can 'proliferate' when in contact with nT in Propria */
        }
      else if ((th1Concentration > ENISI::Threshold) && state == TcellState::iTREG
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule38 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::TH17;/*Rule 38*//*When iTREG is in contact with TH1 in GLN, iTREG changes to TH17*/
        }
      else if (state == TcellState::TH1
               && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < mpCompartment->spaceToGrid(Borders::Y, ENISI::Distance)
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule32 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))/*Rule 32*/
        {
          std::vector<double> Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }
      else if (state == TcellState::iTREG
               && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW))< mpCompartment->spaceToGrid(Borders::Y, ENISI::Distance) //TODO - CRITICAL Determine this value
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && (p_rule33 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))/*Rule 33*/
        {
          std::vector<double> Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
        }
      else if ((eDCConcentration > ENISI::Threshold)
               && mpCompartment->getType() == Compartment::lamina_propria)
        {
          if (state == TcellState::iTREG)
            {
              newState = TcellState::TH17;
            }
          else if (state == TcellState::NAIVE)
            {
              if (p_rule55a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()) /*Rule 55a*/
                {
                  newState = TcellState::TH17;
                }
              else if (p_rule55b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()) /* Rule 55b*/
                {
                  newState = TcellState::TH1;
                }
            }
        }
      else if ((tDCConcentration > ENISI::Threshold)
               && mpCompartment->getType() == Compartment::gastric_lymph_node
               && state == TcellState::NAIVE
               && (p_rule53 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          newState = TcellState::iTREG; /*Rule 53*/
        }
      else if (state == TcellState::TH1
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule27 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent); /*Rule 27*- Th1 can die in LP*/
          continue;
        }
      else if (state == TcellState::TH17
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule24 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent); /*Rule 24*- TH17 can die in LP*/
          continue;
        }
      else if (state == TcellState::iTREG
               && mpCompartment->getType() == Compartment::lamina_propria
               && (p_rule26 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
          mpCompartment->removeAgent(pAgent); /*Rule 26*- iTREG can die in LP*/
          continue;
        }

      if (newState == TcellState::TH1) //Rule 29 If T cell state is TH1, then release IFNg
        {
          mpCompartment->cytokineValue("IFNg", pt) += 2; // arbitrary value for IFNg
        }
      else if (newState == TcellState::Tr
               || newState == TcellState::iTREG) //Rule 30, If T cell state is Tr then release IL10 [or iTREG]
        {
          mpCompartment->cytokineValue("IL10", pt) += 3; //arbitrary value for IL10
        }

      pAgent->setState(newState);

      // TODO CRITICAL Determine the maximum speed
      double MaxSpeed = 1.0;
      mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
    }
}
