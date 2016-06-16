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

      if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 1.5)
        {
          mpCompartment->getAgents(pt, 0, -1, Agent::Bacteria, Bacteria);
          mpCompartment->getAgents(pt, 0, -1, Agent::HPylori, HPylori);
        }
    }
  else if (mpCompartment->getType() == Compartment::lamina_propria)
    {
      mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
      mpCompartment->getAgents(pt, Agent::HPylori, HPylori);
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

  double liveHPyloriConcentration = HPyloriConcentration[HPyloriState::NAIVE];
  double eDendriticsConcentration = DendriticsConcentration[DendriticState::EFFECTOR];
  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
  double itregConcentration = TcellConcentration[TcellState::iTREG];
  double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];
  double tolegenicBacteriaConcentration = BacteriaConcentration[BacteriaState::TOLEROGENIC];

//  if (mpCompartment->getType() == Compartment::lamina_propria &&
//      mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
//    {
//	  LocalFile::debug() << "liveHPyloriConcentration=          " << liveHPyloriConcentration << std::endl;
//	  LocalFile::debug() << "eDendriticsConcentration=          " << eDendriticsConcentration << std::endl;
//	  LocalFile::debug() << "damagedEpithelialCellConcentration=" << damagedEpithelialCellConcentration << std::endl;
//	  LocalFile::debug() << "itregConcentration=                " << itregConcentration << std::endl;
//	  LocalFile::debug() << "infectiousBacteriaConcentration=   " << infectiousBacteriaConcentration << std::endl;
//	  LocalFile::debug() << "tolegenicBacteriaConcentration=    " << tolegenicBacteriaConcentration << std::endl <<  std::endl;
//    }

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      DendriticState::State state = (DendriticState::State) pAgent->getState();

      if (state == DendriticState::DEAD) continue;

      DendriticState::State newState = state;

      /* with new compartments bacteria state only needs live and dead, as infectious are all in LP and
       * tolegenic are all in lumen     */

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/

	  if (state == DendriticState::IMMATURE)
	  {
		  if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW)) < p_iDCEpitheliumDistance
		      && mpCompartment->getType() == Compartment::lamina_propria
		      && (p_rule51a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
		  {
		    std::vector< double > Location;
			mpCompartment->getLocation(pAgent->getId(), Location);
			//LocalFile::debug() << "Location_orig=" << std::setprecision (16) << Location[Borders::Y] << std::endl;

			Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
			//LocalFile::debug() << "Location_new=" << std::setprecision (16) << Location[Borders::Y] << std::endl;

			mpCompartment->moveTo(pAgent->getId(), Location);
			continue;
		  }

		  if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)) < p_iDCLPDistance //TODO - CRITICAL Determine this value
			  && mpCompartment->getType() == Compartment::epithilium
			  && (p_rule51b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
		  {
		    std::vector< double > Location;
			mpCompartment->getLocation(pAgent->getId(), Location);
			Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
			mpCompartment->moveTo(pAgent->getId(), Location);
			continue;
		  }

          /* if no bacteria is around DC, then stays immature */
         if (infectiousBacteriaConcentration + liveHPyloriConcentration == 0)
         {
            newState = DendriticState::IMMATURE;
         }

      /*if more HPylori surrounds DC than bacteria and DC is in epithelium then becomes effector --
       *  0.5 is arbitrary *Rule 2*/

       if (//mpCompartment->getType() == Compartment::epithilium
          //&&
		  liveHPyloriConcentration != 0)
    	   //&& tolegenicBacteriaConcentration * p_rule48a > liveHPyloriConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
    	  newState = DendriticState::EFFECTOR;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
          pAgent->setState(newState);
          continue;
        }

      /* if less HPylori surrounds DC than bacteria and DC is in epithelium then becomes tolerogenic --
       * 0.5 is arbitrary */
      if (mpCompartment->getType() == Compartment::epithilium
          && (liveHPyloriConcentration * p_rule48b > tolegenicBacteriaConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
    	  newState = DendriticState::TOLEROGENIC;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
          mpCompartment->moveTo(pAgent->getId(), Location);
          pAgent->setState(newState);
          continue;
        }

      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary, Rule 48 */
      if (mpCompartment->getType() == Compartment::lamina_propria
          && (tolegenicBacteriaConcentration * p_rule17a > liveHPyloriConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
    	  newState = DendriticState::EFFECTOR;
    	  pAgent->setState(newState);
          continue;
        }

      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary * Rule 17 and Rule 48*/
      if (mpCompartment->getType() == Compartment::lamina_propria
          &&(liveHPyloriConcentration * p_rule17b > tolegenicBacteriaConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
      {
    	  newState = DendriticState::TOLEROGENIC;
    	  pAgent->setState(newState);
          continue;
      }

      if ((damagedEpithelialCellConcentration > ENISI::Threshold || eDendriticsConcentration > ENISI::Threshold)
          && (p_rule15 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
    	  mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Dentritics, pAgent->getState()), Location);
        }
	 }

	  else
	  { // case of (!DendriticState::IMMATURE)
		  if ((mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)) < p_mDCGLNDistance //TODO - CRITICAL Determine this value
             && mpCompartment->getType() == Compartment::lamina_propria
             && (p_rule52 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
          {
  	         std::vector< double > Location;
             mpCompartment->getLocation(pAgent->getId(), Location);
             Location[Borders::Y] += 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
             mpCompartment->moveTo(pAgent->getId(), Location);
             continue;
          }

	      if ((p_DCDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
	      {
		      mpCompartment->removeAgent(pAgent);
	          continue;
	      }
	  }

      // TODO We should use the production from the ODE model.
      int yOffset = mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH);
      if (newState == DendriticState::EFFECTOR)
      {
    	  mpCompartment->cytokineValue("eIL6", pt, 0, yOffset) += 70; /*Rule 56*/
          mpCompartment->cytokineValue("eIL12", pt, 0, yOffset) += 70;

    	  if (itregConcentration && (p_rule34 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
          {
      	      mpCompartment->removeAgent(pAgent);
              continue;
          }
      }
      else if (newState == DendriticState::TOLEROGENIC) /*Rule 57*/
      {
    	  mpCompartment->cytokineValue("eTGFb", pt, 0, yOffset) += 70;
      }

       pAgent->setState(newState);
    }
}

// virtual
void DendriticsGroup::move()
{
  // TODO CRITICAL Determine the maximum speed
  double MaxSpeed = 1.0;

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
