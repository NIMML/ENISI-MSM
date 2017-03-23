#include "BacteriaGroup.h"

#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "DataWriter/LocalFile.h"

using namespace ENISI;

BacteriaGroup::BacteriaGroup(Compartment * pCompartment, const double & concentrations) :
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Bacteria, BacteriaState::TOLEROGENIC));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_BacteriaKill", p_BacteriaKill);
  pModel->getValue("p_BacteriaDeath", p_BacteriaDeath);
  pModel->getValue("p_BacteriaLPProl", p_BacteriaLPProl);
  pModel->getValue("p_BacteriaLumProl", p_BacteriaLumProl);
  pModel->getValue("p_rule1", p_rule1);
  pModel->getValue("p_rule1_damagedEpithelialCellConcentration", p_rule1_damagedEpithelialCellConcentration);
}

void BacteriaGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0);

  std::vector< Agent * > Tcells;
  std::vector< Agent * > Bacteria;
  std::vector< Agent * > EpithelialCells;
  std::vector< Agent * > Macrophages;

  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);

  // We only request information if we are at the border
  if (mpCompartment->getType() == Compartment::lumen &&
      mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::EpithelialCell, EpithelialCells);
    }

  else if (mpCompartment->getType() == Compartment::lamina_propria)
    {
	  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
	  mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);
      if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
        {
          mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
        }
    }

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);
  double th1Concentration = TcellConcentration[TcellState::TH1];
  double th17Concentration = TcellConcentration[TcellState::TH17];
	
  Concentration MacrophageConcentration;
  concentrations(Agent::Macrophage, Macrophages, MacrophageConcentration);
  double MinfConcentration = MacrophageConcentration[MacrophageState::INFLAMMATORY];

  Concentration EpithelialCellConcentration;
  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);
  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];

  Concentration BacteriaConcentration;
  concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);
  double tolerogenicBacteriaConcentraion = BacteriaConcentration[BacteriaState::TOLEROGENIC];
  double infectiousBacteriaConcentraion = BacteriaConcentration[BacteriaState::INFECTIOUS];
  double totalbact = tolerogenicBacteriaConcentraion +  infectiousBacteriaConcentraion;

  std::vector< Agent * >::iterator it = Bacteria.begin();
  std::vector< Agent * >::iterator end = Bacteria.end();

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      BacteriaState::State state = (BacteriaState::State) pAgent->getState();
      if (state == BacteriaState::DEAD)
    	{
    	  	//LocalFile::debug() << "# Bacteria state is DEAD" << std::endl;
    		continue;
    	}
      BacteriaState::State newState = state;

      /*identify states of Epithelial Cells counted */
      double Random = repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next();
      /* move Bacteria across epithelial border if in contact with damaged Epithelial cell */
      if (mpCompartment->getType() == Compartment::lumen)
       {
        if (damagedEpithelialCellConcentration > p_rule1_damagedEpithelialCellConcentration * ENISI::Threshold         
          && p_rule1 > Random)
        {    	 
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);        
          Location[Borders::Y] +=
            Compartment::instance(Compartment::epithilium)->spaceDimensions().extents(Borders::Y) +
            mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);         
          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
        }
	if(p_BacteriaLumProl / (1 + tolerogenicBacteriaConcentraion)  > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	{    	 
    	  mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Bacteria, pAgent->getState()), Location);
	  continue;
        }    
	if ((p_BacteriaDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
	{
    	  mpCompartment->removeAgent(pAgent);
          continue;
        } 
      } //End of lumen
      if (mpCompartment->getType() == Compartment::lamina_propria)
      {
	  newState = BacteriaState::INFECTIOUS;
          pAgent->setState(newState);
      /* Bacteria dies is nearby damaged epithelial cell, th1 or th17 and is infectious*/
      if ((newState == BacteriaState::INFECTIOUS)
          && (damagedEpithelialCellConcentration
              || th1Concentration
              || th17Concentration
	      || MinfConcentration > ENISI::Threshold)
          && (p_BacteriaKill > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {   	  
          mpCompartment->removeAgent(pAgent);
          continue;
        }
      /* Bacteria become infectious when moved into Lamina Propria */
      if (p_BacteriaDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        {
    	  //LocalFile::debug() << "# Bacteria dies naturally" << std::endl;
          mpCompartment->removeAgent(pAgent);
          continue;
        }
      if ((p_BacteriaLPProl / (1 + totalbact)) > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        {
    	  //LocalFile::debug() << "# Bacteria proliferates in LP" << std::endl;
    	  mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Bacteria, pAgent->getState()), Location);
	  continue;
        }     
    }//End of lamina propria
}//End of for
// virtual
void BacteriaGroup::move()
{
  // TODO CRITICAL Determine the maximum speed
  double MaxSpeed = 2.0;
  // Find all local agents and move them
  Compartment::LocalIterator itLocal = mpCompartment->localBegin();
  Compartment::LocalIterator endLocal = mpCompartment->localEnd();

  for (; itLocal != endLocal; ++itLocal)
        {
      mpCompartment->moveRandom((*itLocal)->getId(), MaxSpeed);
	}
}

// virtual
void BacteriaGroup::write(const repast::Point<int> &)
{
}
