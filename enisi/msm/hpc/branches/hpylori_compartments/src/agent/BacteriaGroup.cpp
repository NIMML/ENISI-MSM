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

  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);
  std::vector< Agent * >::iterator it = Bacteria.begin();
  std::vector< Agent * >::iterator end = Bacteria.end();

  if (it == end) return;

  std::vector< Agent * > Tcells;
  std::vector< Agent * > EpithelialCells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

  // We only request information if we are at the border
  if (mpCompartment->getType() == Compartment::lumen
		  &&mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, 1, Agent::EpithelialCell, EpithelialCells);
      mpCompartment->getAgents(pt, 0, 1, Agent::Tcell, Tcells);
    }
  else if (mpCompartment->getType() == Compartment::lamina_propria
		  &&mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 1.5)
    {
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
      mpCompartment->getAgents(pt, 0, -1, Agent::Tcell, Tcells);// Get information about the th1/th17 cells present locally in that are; i.e near the border inside the LP
    }
  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  Concentration EpithelialCellConcentration;
  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
  //double damagedEpithelialCellConcentration = 1000;
  double th1Concentration = TcellConcentration[TcellState::TH1];
  double th17Concentration = TcellConcentration[TcellState::TH17];

  for (; it != end; ++it)
    {
      Agent * pAgent = *it;
      BacteriaState::State state = (BacteriaState::State) pAgent->getState();

      if (state == BacteriaState::DEAD) continue;

      BacteriaState::State newState = state;

      /*identify states of Epithelial Cells counted */
      double Random = repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next();
      /* move Bacteria across epithelial border if in contact with damaged Epithelial cell */

      if (damagedEpithelialCellConcentration > p_rule1_damagedEpithelialCellConcentration * ENISI::Threshold
          && mpCompartment->getType() == Compartment::lumen
          && p_rule1 > Random){
    	  LocalFile::debug() << "Epi is damaged and bacteria can enter" << std::endl ;
          std::vector< double > Location;
          mpCompartment->getLocation(pAgent->getId(), Location);
          // LocalFile::debug() << "Move Bacteria: (" << Location[0] << ", " << Location[1] << ") -> (";
          Location[Borders::Y] +=
            Compartment::instance(Compartment::epithilium)->spaceDimensions().extents(Borders::Y) +
            mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::HIGH);
          // LocalFile::debug() << Location[0] << ", " << Location[1] << ")" <<  std::endl;
          mpCompartment->moveTo(pAgent->getId(), Location);
          continue;
        }
      /* Bacteria dies is nearby damaged epithelial cell, th1 or th17 and is infectious*/
      if ((newState == BacteriaState::INFECTIOUS)
          && (damagedEpithelialCellConcentration > ENISI::Threshold
              || th1Concentration > ENISI::Threshold
              || th17Concentration > ENISI::Threshold)
          && (p_BacteriaKill > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
          mpCompartment->removeAgent(pAgent);
          continue;
        }
      /* Bacteria become infectious when moved into Lamina Propria */
      if (mpCompartment->getType() == Compartment::lamina_propria){
          newState = BacteriaState::INFECTIOUS;
          pAgent->setState(newState);
        }

      if ((p_BacteriaDeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
          mpCompartment->removeAgent(pAgent);
          continue;
        }

      if (mpCompartment->getType() == Compartment::lamina_propria
          && (p_BacteriaLPProl > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Bacteria, pAgent->getState()), Location);
        }

      if (mpCompartment->getType() == Compartment::lumen &&
          (p_BacteriaLumProl > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
          mpCompartment->getLocation(pAgent->getId(), Location);
          mpCompartment->addAgent(new Agent(Agent::Bacteria, pAgent->getState()), Location);
        }
      /* TODO: Bacteria are removed when macrophage uptake/differentiate */
      pAgent->setState(newState);
    }
}
// virtual
void BacteriaGroup::move(){
  // TODO CRITICAL Determine the maximum speed
  double MaxSpeed = 1.0;

  // Find all local agents and move them
  Compartment::LocalIterator itLocal = mpCompartment->localBegin();
  Compartment::LocalIterator endLocal = mpCompartment->localEnd();

  for (; itLocal != endLocal; ++itLocal){
      mpCompartment->moveRandom((*itLocal)->getId(), MaxSpeed);
	}
}

// virtual
void BacteriaGroup::write(const repast::Point<int> &){
}
