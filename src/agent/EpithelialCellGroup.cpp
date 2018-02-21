#include "EpithelialCellGroup.h"
#include "grid/Borders.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "DataWriter/LocalFile.h"

using namespace ENISI;

EpithelialCellGroup::EpithelialCellGroup(Compartment * pCompartment, const double & concentrations):
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::EpithelialCell, EpithelialCellState::HEALTHY));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_EpiCellDeath", p_EpiCellDeath);
  pModel->getValue("p_EpiProliferation", p_EpiProliferation);
  pModel->getValue("p_epiinfbactdamage", p_epiinfbactdamage);
  pModel->getValue("p_epiIL10h", p_epiIL10h);
  pModel->getValue("p_epith17damage", p_epith17damage);
  pModel->getValue("p_epith1damage", p_epith1damage);
  pModel->getValue("p_randomdam", p_randomdam);
  pModel->getValue("p_epicyto", p_epicyto);
  pModel->getValue("p_EpiCap", p_EpiCap);	  
}

void EpithelialCellGroup::act(const repast::Point<int> & pt)
{
  std::vector<double> Location(2, 0.0);
  std::vector< Agent * > EpithelialCells;
  mpCompartment->getAgents(pt, Agent::EpithelialCell, EpithelialCells);
	
  std::vector< Agent * > Bacteria;  
  std::vector< Agent * > Tcells;
 
  double IL10 = 0.0;
  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::Bacteria, Bacteria);
      mpCompartment->getAgents(pt, 0, 1, Agent::Tcell, Tcells);
      IL10 = mpCompartment->cytokineValue("eIL10", pt, 0, 1);
    }  
  	Concentration BacteriaConcentration;
  	concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);
  	Concentration TcellsCellConcentration;
  	concentrations(Agent::Tcell, Tcells, TcellsCellConcentration);
	Concentration EpiConcentration;
  	concentrations(Agent::EpithelialCell, EpithelialCells, EpiConcentration);
	
	double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];	
	double th17Concentration = TcellsCellConcentration[TcellState::TH17]; //Rule 10 when Th17 is in contact
	double th1Concentration = TcellsCellConcentration[TcellState::TH1]; //RUle 9 when Th1 is in contact
	double EpiHealthyConcentration = EpiConcentration[EpithelialCellState::HEALTHY];
	
	std::vector< Agent * >::iterator it = EpithelialCells.begin();
	std::vector< Agent * >::iterator end = EpithelialCells.end();

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      EpithelialCellState::State state = (EpithelialCellState::State) pAgent->getState();   
      EpithelialCellState::State newState = state;

      if (state == EpithelialCellState::HEALTHY)
        {
          double Random = repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next();
          if (infectiousBacteriaConcentration > ENISI::Threshold
              && (p_epiinfbactdamage > Random))
            {
              newState = EpithelialCellState::DAMAGED;
              pAgent->setState(newState);
            }
          if (th17Concentration > ENISI::Threshold
                   && (p_epith17damage > Random))
            {
              newState = EpithelialCellState::DAMAGED; /*Rule 10*/
	      pAgent->setState(newState);
            }
	   if (th1Concentration > ENISI::Threshold
                   && (p_epith1damage > Random))
            {
              newState = EpithelialCellState::DAMAGED;
	      pAgent->setState(newState);
            }
	   if (p_EpiProliferation > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()
	      && p_EpiCap > EpiHealthyConcentration)
            {
              mpCompartment->getLocation(pAgent->getId(), Location);
              mpCompartment->addAgent(new Agent(Agent::EpithelialCell, EpithelialCellState::HEALTHY), Location);
            }
	   if (p_epicyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
              int yOffset = mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH);
              // TODO We should use the production from the ODE model.
              mpCompartment->cytokineValue("eIL6", pt, 0, yOffset) += 7;
              mpCompartment->cytokineValue("eIL12", pt, 0, yOffset) += 7;
	    }
	   if (p_randomdam > Random)
	    {
	      newState = EpithelialCellState::DAMAGED; //Random damage of epithelial cells
	      pAgent->setState(newState);
	    }	  
      	   if (p_EpiCellDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
              mpCompartment->removeAgent(pAgent); /*Rule 11*/
            }
      }
      if (state == EpithelialCellState::DAMAGED)
      {
           if (IL10 > ENISI::Threshold
               && p_epiIL10h > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
              newState = EpithelialCellState::HEALTHY; 
	      pAgent->setState(newState); /* If IL10 is in contact with E at the Ep and Lm border, E-> Edamaged slowed donw by some factor*/
            }
	   if (p_EpiCellDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
              mpCompartment->removeAgent(pAgent); 
            }  
       }
     }// end of for
}// end of act()
void EpithelialCellGroup::move(){
  // TODO CRITICAL Determine the maximum speed
double MaxSpeed = 0.1;
  // Find all local agents and move them
  Compartment::LocalIterator itLocal = mpCompartment->localBegin();
  Compartment::LocalIterator endLocal = mpCompartment->localEnd();

  for (; itLocal != endLocal; ++itLocal)
  {
      mpCompartment->moveRandom((*itLocal)->getId(), MaxSpeed);
  }
}
// virtual
void EpithelialCellGroup::write(const repast::Point<int> &)
{

}
