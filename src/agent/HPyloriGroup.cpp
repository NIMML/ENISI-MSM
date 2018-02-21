#include "HPyloriGroup.h"
#include "grid/Borders.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "DataWriter/LocalFile.h"
using namespace ENISI;

HPyloriGroup::HPyloriGroup(Compartment * pCompartment, const double & concentrations):
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);
  for (size_t i = 0; i < LocalCount; i++){
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::HPylori, HPyloriState::LIVE));
    }
  const Properties * pModel = Properties::instance(Properties::model);
	pModel->getValue("p_HPepitoLP", p_HPepitoLP);
	pModel->getValue("p_HPylorirep", p_HPylorirep);
	pModel->getValue("p_HPyloricap", p_HPyloricap);
	pModel->getValue("p_HPdeathduetoTcells", p_HPdeathduetoTcells);
	pModel->getValue("p_HPyloriDeath", p_HPyloriDeath);
}

void HPyloriGroup::act(const repast::Point<int> & pt)
{

	std::vector< double > Location(2, 0);
	std::vector< Agent * > HPylori;
	mpCompartment->getAgents(pt, Agent::HPylori, HPylori);

	std::vector< Agent * > Tcells;
	std::vector< Agent * > EpithelialCells;

  if (mpCompartment->getType() == Compartment::lumen
        && mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::EpithelialCell, EpithelialCells);
    }

  if (mpCompartment->getType() == Compartment::lamina_propria 
        && mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
      mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
    }
  // We only request information if we are at the border
  Concentration EpithelialCellConcentration;
  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  double th1Concentration = TcellConcentration[TcellState::TH1];
  double th17Concentration = TcellConcentration[TcellState::TH17];

  Concentration HPyloriConcentration;
  concentrations(Agent::HPylori, HPylori, HPyloriConcentration);
  double HPyloriConcentraion = HPyloriConcentration[HPyloriState::LIVE];

  /*identify states of Epithelial Cells counted */
  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
  //LocalFile::debug() << "damagedEpithelialCellConcentration = " << damagedEpithelialCellConcentration << std::endl;

  std::vector< Agent * >::iterator it = HPylori.begin();
  std::vector< Agent * >::iterator end = HPylori.end();

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      HPyloriState::State state = (HPyloriState::State) pAgent->getState();

      if (state == HPyloriState::DEAD) continue;

      /* move HPylori across epithelial border if in contact with damaged Epithelial cell *Rule 3*/
      if (mpCompartment->getType() == Compartment::lumen)
       {
	  if (p_HPepitoLP > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()
          && damagedEpithelialCellConcentration)
	  {
	    std::vector< double > Location;
	    mpCompartment->getLocation(pAgent->getId(), Location);
	    Location[Borders::Y] += mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH) // Move accross the border
	        + Compartment::instance(Compartment::epithilium)->spaceDimensions().extents(Borders::Y); // Move all the way through the epithelium
	    mpCompartment->moveTo(pAgent->getId(), Location);
            continue;
          }
      /* HPylori dies is nearby damaged epithelial cell, th1 or th17* *Rule 5,6,7*/
          if (damagedEpithelialCellConcentration > ENISI::Threshold
               || th1Concentration > ENISI::Threshold
               || th17Concentration > ENISI::Threshold 
	       && p_HPdeathduetoTcells > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
          {        
            mpCompartment->removeAgent(pAgent);
            continue;
          }
          if (p_HPyloriDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	  {
            mpCompartment->removeAgent(pAgent);
            continue;
          }
	  if (p_HPyloricap > HPyloriConcentraion
              && p_HPylorirep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	  {
            mpCompartment->getLocation(pAgent->getId(), Location);
            mpCompartment->addAgent(new Agent(Agent::HPylori, pAgent->getState()), Location);
	    continue;
          }
       } //End of lumen
    if (mpCompartment->getType() == Compartment::lamina_propria)
       {
          if (p_HPyloricap > HPyloriConcentraion 
	     && p_HPylorirep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
          {
            mpCompartment->getLocation(pAgent->getId(), Location);
            mpCompartment->addAgent(new Agent(Agent::HPylori, pAgent->getState()), Location);
	    continue;
           }
          if ((p_HPyloriDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
	  {
            mpCompartment->removeAgent(pAgent);
            continue;
          }	  
       }// End of lamina propria 
    } //End of for
} // End of act()
// virtual
void HPyloriGroup::move()
{
  // TODO CRITICAL Determine the maximum speed
  double MaxSpeed = 2.0;
  // Find all local agents and move them
  Compartment::LocalIterator itLocal = mpCompartment->localBegin();
  Compartment::LocalIterator endLocal = mpCompartment->localEnd();

  for (; itLocal != endLocal; ++itLocal){
      mpCompartment->moveRandom((*itLocal)->getId(), MaxSpeed);
	}
}
// virtual
void HPyloriGroup::write(const repast::Point<int> &){

}
