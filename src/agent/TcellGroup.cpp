#include "TcellGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"

#include "agent/TcellODE.h"
#include "grid/Borders.h"

using namespace ENISI;
int p_rule18;/*Rule 18 parameter*/
int p_rule19;/*Rule 19 parameter*/
int p_rule20;/*Rule 20 parameter*/
int p_rule21;/*Rule 21 parameter*/
int p_rule22;/*Rule 22 parameter*/
int p_rule23;/*Rule 23 parameter*/
int p_rule24;/*Rule 24 parameter*/
int p_rule26;/*Rule 26 parameter*/
int p_rule27;/*Rule 27 parameter*/
int p_rule31;/*Rule 31 parameter*/
int p_rule_31a;/*Rule 31a parameter*/
int p_rule32;/*Rule 32 parameter*/
int p_rule33;/*Rule 33 parameter*/
int p_rule35;/*Rule 35 parameter*/
int p_rule36;/*Rule 36 parameter*/
int p_rule37;/*Rule 37 parameter*/
int p_rule38;/*Rule 38 parameter*/
int p_rule39;/*Rule 39 parameter*/
int p_rule40;/*Rule 40 parameter*/
int p_rule41;/*Rule 41 parameter*/
int p_rule53;/*Rule 53 parameter*/
int p_rule55a;/*Rule 55a parameter*/
int p_rule55b;/*Rule 55b parameter*/
int neardistance_border;/* For the rules that mention nearest distance from Border, earlier it was set as 2*/

TcellGroup::TcellGroup(Compartment * pCompartment, const size_t & count):
  mpCompartment(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(count);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Tcell, TcellState::NAIVE));
    }
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
  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
  std::vector< Agent * >::iterator it = Tcells.begin();
  std::vector< Agent * >::iterator end = Tcells.end();

  StateCount TcellStateCount;
  CountStates(Agent::Tcell, Tcells, TcellStateCount);

  std::vector< Agent * > Macrophages;
  mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);
  StateCount MacrophageStateCount;
  CountStates(Agent::Macrophage, Macrophages, MacrophageStateCount);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);
  StateCount DentriticsStateCount;
  CountStates(Agent::Dentritics, Dentritics, DentriticsStateCount);

  std::vector< Agent * > EpithelialCells;
  // TODO CRITICAL Retrieve epithelial cells in neighboring compartment if appropriate;
  StateCount EpithelialCellStateCount;
  CountStates(Agent::Dentritics, EpithelialCells, EpithelialCellStateCount);

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      TcellState::State state = (TcellState::State) pAgent->getState();

      if (state == TcellState::DEAD)
        continue;

      TcellState::State newState = state;

      double IL6 = mpCompartment->cytokineValue("IL6", pt);
      double TGFb = mpCompartment->cytokineValue("TGFb", pt);
      double IL12 = mpCompartment->cytokineValue("IL12", pt);

      unsigned int macrophageregCount = MacrophageStateCount[MacrophageState::REGULATORY];

      unsigned int th17Count = TcellStateCount[TcellState::TH17]; //Rules 22, 23, 36-39 when Th17 is in contact
      unsigned int itregCount = TcellStateCount[TcellState::iTREG]; //Rules 19-21 when iTreg is in contact
      unsigned int th1Count = TcellStateCount[TcellState::TH1];

      unsigned int eDCCount = DentriticsStateCount[DendriticState::EFFECTOR]; //Rule 39 eDC count that is in contact with nT
      unsigned int tDCCount = DentriticsStateCount[DendriticState::TOLEROGENIC]; //Rule 23 tDC count

      unsigned int damagedEpithelialCellCount = EpithelialCellStateCount[EpithelialCellState::DAMAGED];// Rule 18 damagedEpithelialCellCount

      if (IL6 + TGFb + IL12 > 1.0)
        {
          /* set initial concentrations */
          TcellODE & odeModel = TcellODE::getInstance();
          odeModel.setInitialConcentration("IL6", IL6);
          odeModel.setInitialConcentration("TGFb", TGFb);
          odeModel.setInitialConcentration("IL12", IL12);

          /* run time course */
          odeModel.runTimeCourse();

          double IFNg = odeModel.getConcentration("IFNg");
          double IL17 = odeModel.getConcentration("IL17");
          double IL10 = odeModel.getConcentration("IL10");

          /* get output cytokines */
          mpCompartment->cytokineValue("IFNg", pt) = 70;
          mpCompartment->cytokineValue("IL17", pt) = 70;
          mpCompartment->cytokineValue("IL10", pt) = 70;
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
          else if ((IL10 > p_rule31a * IFNg) && (macrophageregCount > 0)
                   && state == TcellState::NAIVE
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule31 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::Tr; /* Rule 31- The rule is if nT is in contact with regulatory macrophages, and if IL10> a* IFNg
           //then nT -> Tr (state transition)*/
            }
          else if ((tDCCount > 0) && state == TcellState::TH17
                   && mpCompartment->getType() == Compartment::gastric_lymph_node && (p_rule36 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::iTREG; /*Rule 36*/
            }
          else if ((itregCount > 0) && state == TcellState::TH17
                   && mpCompartment->getType() == Compartment::gastric_lymph_node && (p_rule35 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::iTREG; /*Rule 35*/
            }
          else if ((th17Count > 0) && state == TcellState::iTREG
                   && mpCompartment->getType() == Compartment::gastric_lymph_node && (p_rule37 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH17; /*Rule 37*/
            }
          else if ((eDCCount > 0) && state == TcellState::NAIVE
                   && mpCompartment->getType() == Compartment::gastric_lymph_node && (p_rule39 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH1; /*Rule 39*/
            }
          else if ((eDCCount > 0) && state == TcellState::NAIVE
                   && mpCompartment->getType() == Compartment::gastric_lymph_node && (p_rule40 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              mpCompartment->removeAgent(pAgent); /*Rule 40* - nT can die when in contact with eDC in GLN*/
              continue;

              // TODO CRITICAL Proliferation can always happen it is not condition dependent
              // addCellAt(TcellState::DEAD, loc);   /*Rule 40* - nT can 'proliferate' when in contact with nT in GLN */
            }
          else if ((eDCCount > 0) && state == TcellState::iTREG
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule20 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH17; /*Rule 20*/
            }
          else if ((th17Count > 0) && state == TcellState::TH17
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule21 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH17; /*Rule 21*/
            }
          else if ((itregCount > 0) && state == TcellState::TH1
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule22 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::iTREG; /*Rule 22*/
            }
          else if ((tDCCount > 0) && state == TcellState::TH17
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule23 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::iTREG; /*Rule 23*/
            }
          else if ((damagedEpithelialCellCount > 0) && state == TcellState::iTREG
                   && mpCompartment->getType() == Compartment::epithilium && (p_rule18 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH17; /*Rule 18*/
              /* CHECK : Here there should be a function for information regarding the Layer,
              for eg. This rule requires the state transition when iTREG is in contact with Edamaged at 'Epithelium and LaminaPropria' membrane*/
            }
          else if ((th1Count > 0) && state == TcellState::iTREG
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule19 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH17; /*Rule 19*/
            }
          else if ((eDCCount > 0) && state == TcellState::NAIVE
                   && mpCompartment->getType() == Compartment::lamina_propria && (p_rule41> repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              mpCompartment->removeAgent(pAgent); /*Rule 41* - nT can die when in contact with eDC in Lamina Propria*/
              continue;
              // TODO CRITICAL Proliferation can always happen it is not condition dependent
              // addCellAt(TcellState::NAIVE, loc); /*Rule 41* - nT can 'proliferate' when in contact with nT in Propria */
            }
          else if ((th1Count > 0) && state == TcellState::iTREG
                  && mpCompartment->getType() == Compartment::gastric_lymph_node && (p_rule38 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              newState = TcellState::TH17;/*Rule 38*/ /*When iTREG is in contact with TH1 in GLN, iTREG changes to TH17*/
            }
          else if (state == TcellState::TH1
                   && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords() , Borders::Y, Borders::LOW)) < neardistance_border //TODO - CRITICAL Determine this value
                   && mpCompartment->getType() == Compartment::gastric_lymph_node
                   && (p_rule32 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))/*Rule 32*/
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
              mpCompartment->moveTo(pAgent->getId(), Location);
            }
          else if (state == TcellState::iTREG
                   && (mpCompartment->spaceBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < neardistance_border //TODO - CRITICAL Determine this value
                   && mpCompartment->getType() == Compartment::gastric_lymph_node
                   && (p_rule33 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))/*Rule 33*/
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
              mpCompartment->moveTo(pAgent->getId(), Location);
            }
          else if ((eDCCount >0) && mpCompartment->getType() == Compartment::lamina_propria)
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
          else if ((tDCCount>0) && mpCompartment ->getType() == Compartment::gastric_lymph_node && state == TcellState::NAIVE
        		  && (p_rule53 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
          {
        	  newState = TcellState::iTREG; /*Rule 53*/
          }
          else if (state == TcellState::TH1 && mpCompartment ->getType() == Compartment::lamina_propria
        		  && (p_rule27 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
          {
        	  mpCompartment->removeAgent(pAgent); /*Rule 27*- Th1 can die in LP*/
        	                continue;
          }
          else if (state == TcellState::TH17 && mpCompartment ->getType() == Compartment::lamina_propria
                  		  && (p_rule24 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
                    {
                  	  mpCompartment->removeAgent(pAgent); /*Rule 24*- TH17 can die in LP*/
                  	                continue;
                    }
          else if (state == TcellState::iTREG && mpCompartment ->getType() == Compartment::lamina_propria
                  		  && (p_rule26 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
                    {
                  	  mpCompartment->removeAgent(pAgent); /*Rule 26*- iTREG can die in LP*/
                  	                continue;
                    }
        }

        if (newState == TcellState::TH1) //Rule 29 If T cell state is TH1, then release IFNg
          {
            mpCompartment->cytokineValue("IFNg", pt) = 2; // arbitrary value for IFNg
          }
        else if (newState == TcellState::Tr || TcellState::iTREG)   //Rule 30, If T cell state is Tr then release IL10 [or iTREG]
          {
            mpCompartment->cytokineValue("IL10", pt) = 3; //arbitrary value for IL10
          }

        pAgent->setState(newState);

        // TODO CRITICAL Determine the maximum speed
        double MaxSpeed = 1.0;
        mpCompartment->moveRandom(pAgent->getId(), MaxSpeed);
      }
  }
