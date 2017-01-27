#include "DendriticsGroup.h"
#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "DataWriter/LocalFile.h"
#include <iostream>
#include <iomanip>

using namespace ENISI;

DendriticsGroup::DendriticsGroup(Compartment * pCompartment, const double & concentrations) :
  GroupInterface(pCompartment)
{
	size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++){
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Dentritics, DendriticState::IMMATURE));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_iDCtoeDCLP", p_iDCtoeDCLP);
  pModel->getValue("p_iDCtotDCLP", p_iDCtotDCLP);
  pModel->getValue("p_iDCtoeDCE", p_iDCtoeDCE);
  pModel->getValue("p_iDCtotDCE", p_iDCtotDCE);
  pModel->getValue("p_DCDeath", p_DCDeath);
  pModel->getValue("p_iDCrep", p_iDCrep);
  pModel->getValue("p_eDCcyto", p_eDCcyto);
  pModel->getValue("p_tDCcyto", p_tDCcyto);	  
  pModel->getValue("p_iDCmoveLPtoEpi", p_iDCmoveLPtoEpi);
  pModel->getValue("p_iDCmoveEpitoLP", p_iDCmoveEpitoLP);
  pModel->getValue("p_DCLPtoGLN", p_DCLPtoGLN);
  pModel->getValue("p_DCEpitoLP", p_DCEpitoLP);	  
  pModel->getValue("p_DCbasal", p_DCbasal);
}

void DendriticsGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);

  // We only request information if we are at the border
  std::vector< Agent * > Bacteria;
  std::vector< Agent * > HPylori;
  std::vector< Agent * > Tcells;
  std::vector< Agent * > EpithelialCells;

  // We only request information if we are at the border
  if (mpCompartment->getType() == Compartment::epithilium)
    {
      mpCompartment->getAgents(pt, Agent::EpithelialCell, EpithelialCells);

      if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
        {
          //LocalFile::debug() << "I am in Epithelium near the border looking down" << std::endl;
          mpCompartment->getAgents(pt, 0, 1, Agent::Bacteria, Bacteria);
          mpCompartment->getAgents(pt, 0, 1, Agent::HPylori, HPylori);
          mpCompartment->getAgents(pt, 0, 1, Agent::Tcell, Tcells);
        }

      if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
        {
          //LocalFile::debug() << "I am in Epithelium near the border()" << std::endl;
          mpCompartment->getAgents(pt, 0, -1, Agent::Bacteria, Bacteria);
          mpCompartment->getAgents(pt, 0, -1, Agent::HPylori, HPylori);
        }
    }
  if (mpCompartment->getType() == Compartment::lamina_propria)
    {
      mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
      mpCompartment->getAgents(pt, Agent::HPylori, HPylori);
      mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
    }
  if (mpCompartment->getType() == Compartment::gastric_lymph_node)
      {
        mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
      }

  Concentration DendriticsConcentration;
  concentrations(Agent::Dentritics, Dentritics, DendriticsConcentration);
  Concentration BacteriaConcentration;
  concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);
  Concentration HPyloriConcentration;
  concentrations(Agent::HPylori, HPylori, HPyloriConcentration);
  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);
  Concentration EpithelialCellConcentration;
  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  double liveHPyloriConcentration = HPyloriConcentration[HPyloriState::NAIVE];
  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
  double eDendriticsConcentration = DendriticsConcentration[DendriticState::EFFECTOR];
  double itregConcentration = TcellConcentration[TcellState::iTREG];
  double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];
  double tolerogenicBacteriaConcentration = BacteriaConcentration[BacteriaState::TOLEROGENIC];
  double dcConcentration = DendriticsConcentration[DendriticState::IMMATURE] + DendriticsConcentration[DendriticState::TOLEROGENIC] 
	  			+ DendriticsConcentration[DendriticState::EFFECTOR];

  std::vector< Agent * >::iterator it = Dentritics.begin();
  std::vector< Agent * >::iterator end = Dentritics.end();
  for (; it != end; ++it){
      Agent * pAgent = *it;
      DendriticState::State state = (DendriticState::State) pAgent->getState();

      if (state == DendriticState::DEAD) continue;

      DendriticState::State newState = state;

      if (state == DendriticState::IMMATURE)
        {
          if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < 0.5
              && mpCompartment->getType() == Compartment::lamina_propria
              && (p_iDCmoveLPtoEpi > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
              mpCompartment->moveTo(pAgent->getId(), Location);
              continue;
            }//movement of iDCs from LP to epithelium

          if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)) < 1.5 //TODO - CRITICAL Determine this value
              && mpCompartment->getType() == Compartment::epithilium
              && (p_iDCmoveEpitoLP > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              mpCompartment->moveTo(pAgent->getId(), Location);
              continue;
            }//move of iDCs from epithelium to LP

          /* if no bacteria is around DC, then stays immature */
          /*if (infectiousBacteriaConcentration + liveHPyloriConcentration == 0)
            {
              newState = DendriticState::IMMATURE;
            }
	  */
          /*if more HPylori surrounds DC than bacteria and DC is in epithelium then becomes effector --
           *  0.5 is arbitrary *Rule 2*/
          if (mpCompartment->getType() == Compartment::epithilium
              && tolerogenicBacteriaConcentration * p_iDCtoeDCE > liveHPyloriConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
              newState = DendriticState::EFFECTOR;
	      pAgent->setState(newState);
              continue;
             // LocalFile::debug() << "DCS turn into effectors" << std::endl;
              /*std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              //Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
              mpCompartment->moveTo(pAgent->getId(), Location);*/              
          }//movement of eDCs from epithilium to lamina propria
          /* if less HPylori surrounds DC than bacteria and DC is in epithelium then becomes tolerogenic --
           * 0.5 is arbitrary */
          if (mpCompartment->getType() == Compartment::epithilium
        		  //&& (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)< 0.5)
				  && (liveHPyloriConcentration * p_iDCtotDCE > tolerogenicBacteriaConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
          {
              newState = DendriticState::TOLEROGENIC;
	      pAgent->setState(newState);
              continue;
              /*std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              mpCompartment->moveTo(pAgent->getId(), Location);*/              
          }
          /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
           *  1 is arbitrary, Rule 48 */
          if (mpCompartment->getType() == Compartment::lamina_propria
        		  //&& (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)< 1.5)
				  && (tolerogenicBacteriaConcentration * p_iDCtoeDCLP > liveHPyloriConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
          {
              newState = DendriticState::EFFECTOR;
              pAgent->setState(newState);
              continue;
          }
          /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
           *  1 is arbitrary * Rule 17 and Rule 48*/
          if (mpCompartment->getType() == Compartment::lamina_propria
              &&(liveHPyloriConcentration * p_iDCtotDCLP > tolerogenicBacteriaConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
              newState = DendriticState::TOLEROGENIC;
              pAgent->setState(newState);
              continue;
          }
          if (damagedEpithelialCellConcentration > ENISI::Threshold
              && p_iDCrep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
              mpCompartment->getLocation(pAgent->getId(), Location);
              mpCompartment->addAgent(new Agent(Agent::Dentritics, pAgent->getState()), Location);
            }
	  if (p_DCbasal > dcConcentration 
	       && mpCompartment->getType() == Compartment::lamina_propria)
	    {
	      mpCompartment->getLocation(pAgent->getId(), Location);
	      mpCompartment->addAgent(new Agent(Agent::Dentritics, pAgent->getState()), Location);
	    }
        }
      if (state == DendriticState::EFFECTOR)
        {
          if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
        	  && (mpCompartment->getType() == Compartment::lamina_propria)
              && p_DCLPtoGLN > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
              //LocalFile::debug() << "rule parameter > random number" << std::endl;
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              mpCompartment->moveTo(pAgent->getId(), Location);
              continue;
            }//movement from LP to GLN
          if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)) < 1.5 //TODO - CRITICAL Determine this value
        		  && mpCompartment->getType() == Compartment::epithilium
        		  && (p_DCEpitoLP > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              mpCompartment->moveTo(pAgent->getId(), Location);
              continue;
            }//movement from epithilium to LP
	   if (p_eDCcyto > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()
	                  && mpCompartment->getType() == Compartment::lamina_propria
		          || mpCompartment->getType() == Compartment::gastric_lymph_node)
  	    {
              mpCompartment->cytokineValue("eIL6", pt) += 7; 
              mpCompartment->cytokineValue("eIL12",pt) += 7;
            } 
	   if ((p_DCDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
	    {
		mpCompartment->removeAgent(pAgent);
		continue;
	    } 
        }      //End of Effector DC
 if (state == DendriticState::TOLEROGENIC)
        {
          if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
        	  && (mpCompartment->getType() == Compartment::lamina_propria)
              && p_DCLPtoGLN > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
              //LocalFile::debug() << "rule parameter > random number" << std::endl;
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              mpCompartment->moveTo(pAgent->getId(), Location);
              continue;
            }//movement from LP to GLN
          if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)) < 1.5 //TODO - CRITICAL Determine this value
        		  && mpCompartment->getType() == Compartment::epithilium
        		  && (p_DCEpitoLP > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
              std::vector< double > Location;
              mpCompartment->getLocation(pAgent->getId(), Location);
              Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
              mpCompartment->moveTo(pAgent->getId(), Location);
              continue;
            }//movement from epithilium to LP
	   if (p_tDCcyto > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()
	                  && (mpCompartment->getType() == Compartment::lamina_propria)
		          || (mpCompartment->getType() == Compartment::gastric_lymph_node))
  	    {
                mpCompartment->cytokineValue("eTGFb", pt) += 7;
            } 
	   if ((p_DCDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
	    {
	        mpCompartment->removeAgent(pAgent);
		continue;
	    } 
        } //End of Tolerogenic DC
  }//END of for
}// End of act()
void DendriticsGroup::move()
{
  // TODO CRITICAL Determine the maximum speed
  double MaxSpeed = 4.0;

  // Find all local agents and move them
  Compartment::LocalIterator itLocal = mpCompartment->localBegin();
  Compartment::LocalIterator endLocal = mpCompartment->localEnd();

  for (; itLocal != endLocal; ++itLocal)
	{
      mpCompartment->moveRandom((*itLocal)->getId(), MaxSpeed);
	}
}

// virtual
void DendriticsGroup::write(const repast::Point<int> &)
{

}
