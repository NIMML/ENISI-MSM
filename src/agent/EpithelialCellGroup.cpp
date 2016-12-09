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
  pModel->getValue("p_rule10a", p_rule10a);
  pModel->getValue("p_rule10b", p_rule10b);
  pModel->getValue("p_rule12", p_rule12);
  pModel->getValue("p_rule10a_infectiousBacteriaConcentration", p_rule10a_infectiousBacteriaConcentration);
  pModel->getValue("p_rule10b_cytokineConcentration", p_rule10b_cytokineConcentration);
  pModel->getValue("p_rule10b_random" ,p_rule10b_random);
}

void EpithelialCellGroup::act(const repast::Point<int> & pt)
{
  std::vector<double> Location(2, 0.0);

  std::vector< Agent * > EpithelialCells;
  mpCompartment->getAgents(pt, Agent::EpithelialCell, EpithelialCells);

  // We only request information if we are at the border
  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
  double IL10 = 0.0;
  //LocalFile::debug() << "distanceFromBorder	  =   " << mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH)  << std::endl;
  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::Bacteria, Bacteria);
      mpCompartment->getAgents(pt, 0, 1, Agent::Tcell, Tcells);
      IL10 = mpCompartment->cytokineValue("eIL10", pt, 0, 1);
    }

  // Bacteria in the lumen is comensual and deos not damage the epithelium/
  /*
  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::Bacteria, Bacteria);
    }
  */
  /*else if (mpCompartment->getType() == Compartment::epithilium){
	  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
  }*/
  Concentration BacteriaConcentration;
  concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);
  Concentration TcellsCellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellsCellConcentration);


	double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];
	//double tolegenicBacteriaConcentration = BacteriaConcentration[BacteriaState::TOLEROGENIC];
	//Rules 9 and 10
	double th17Concentration = TcellsCellConcentration[TcellState::TH17]; //Rule 10 when Th17 is in contact
	double th1Concentration = TcellsCellConcentration[TcellState::TH1]; //RUle 9 when Th1 is in contact
	//		LocalFile::debug() << "liveHPyloriConcentration=          " << liveHPyloriConcentration << std::endl;
	//		LocalFile::debug() << "eDendriticsConcentration=          " << eDendriticsConcentration << std::endl;
	//		  LocalFile::debug() << "damagedEpithelialCellConcentration=" << damagedEpithelialCellConcentration << std::endl;
	//		  LocalFile::debug() << "macrophageregConcentration=        " << macrophageregConcentration << std::endl;
	//		  LocalFile::debug() << "macrophageinfConcentration=        " << macrophageinfConcentration << std::endl;

	/*LocalFile::debug() << "@ th1Concentration	= " << th1Concentration  << std::endl;
	LocalFile::debug() << "@ th17Concentration	= " << th17Concentration << std::endl;
	LocalFile::debug() << "@ infectiousBacteriaConcentration = " << infectiousBacteriaConcentration << std::endl;*/

	std::vector< Agent * >::iterator it = EpithelialCells.begin();
	std::vector< Agent * >::iterator end = EpithelialCells.end();

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      EpithelialCellState::State state = (EpithelialCellState::State) pAgent->getState();

      //if (state == EpithelialCellState::DEAD) continue;

      EpithelialCellState::State newState = state;

      if (state == EpithelialCellState::HEALTHY)
        {
          double Random = repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next();
          //LocalFile::debug() << "Random = " << Random << std::endl;
          //LocalFile::debug() << "Epi::infectiousBacteriaConcentration = " << infectiousBacteriaConcentration << std::endl;
          //LocalFile::debug() << "Epi::th17Concentration	= " << th17Concentration << std::endl;
          //LocalFile::debug() << "Epi::th1Concentration	= " << th1Concentration  << std::endl;

          if (infectiousBacteriaConcentration > p_rule10a_infectiousBacteriaConcentration * ENISI::Threshold
              && (p_rule10a > Random))
            {
        	 // LocalFile::debug() << "@@@ E cell damaged due to infectious Bacteria" << std::endl;
              newState = EpithelialCellState::DAMAGED;
              //pAgent->setState(newState);
            }
          else if (th17Concentration + th1Concentration > p_rule10b_cytokineConcentration * ENISI::Threshold
                   && (p_rule10b > Random))
            {
        	  //LocalFile::debug() << "@@@ E cell damaged due to T cells" << std::endl;
              newState = EpithelialCellState::DAMAGED; /*Rule 10*/
              //pAgent->setState(newState);
            }
	      if (p_rule10b_random > Random)
	      {
		       newState = EpithelialCellState::DAMAGED; //Random damage of epithelial cells
	      }
        }

      if (p_EpiProliferation > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        {
    	  //LocalFile::debug() << "@ E cell proliferates naturally" << std::endl;
          mpCompartment->getLocation(pAgent->getId(), Location); /*Rule 8*/
          mpCompartment->addAgent(new Agent(Agent::EpithelialCell, EpithelialCellState::HEALTHY), Location);
        }

      if (p_EpiCellDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        {
    	  //LocalFile::debug() << "@ E cell dies naturally" << std::endl;
          mpCompartment->removeAgent(pAgent); /*Rule 11*/
          continue;
        }

      if (state == EpithelialCellState::DAMAGED
               && IL10 > ENISI::Threshold
               && (p_rule12 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
        {
    	  //LocalFile::debug() << "@ Damaged E cell transit to healthy state" << std::endl;
          newState = EpithelialCellState::HEALTHY; /* If IL10 is in contact with E at the Ep and Lm border, E-> Edamaged slowed donw by some factor*/
        }

      if (newState == EpithelialCellState::DAMAGED)
        {
    	  //LocalFile::debug() << "@ E cell is damaged and generates Cytokines eIL6 and eIL12!!" << std::endl;
          int yOffset = mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH);
          // TODO We should use the production from the ODE model.
          mpCompartment->cytokineValue("eIL6", pt, 0, yOffset) += 7;
          mpCompartment->cytokineValue("eIL12", pt, 0, yOffset) += 7;
        }
      pAgent->setState(newState);
    }// end of for
}// end of act()

// virtual
void EpithelialCellGroup::move(){
  // TODO CRITICAL Determine the maximum speed
  double MaxSpeed = 0.1;

  // Find all local agents and move them
  Compartment::LocalIterator itLocal = mpCompartment->localBegin();
  Compartment::LocalIterator endLocal = mpCompartment->localEnd();

  for (; itLocal != endLocal; ++itLocal){
      mpCompartment->moveRandom((*itLocal)->getId(), MaxSpeed);
	}
}
// virtual
void EpithelialCellGroup::write(const repast::Point<int> &)
{

}
