#include "agent/MacrophageGroup.h"
#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "agent/MacrophageODE1.h"
#include "DataWriter/LocalFile.h"

using namespace ENISI;

MacrophageGroup::MacrophageGroup(Compartment * pCompartment, const double & concentrations):
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(concentrations);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_rule42", p_rule42);
  pModel->getValue("p_MinfDiff", p_MinfDiff);
  pModel->getValue("p_rule13", p_rule13);
  pModel->getValue("p_rule28a", p_rule28a);
  pModel->getValue("p_rule28b", p_rule28b);
}

MacrophageGroup::~MacrophageGroup()
{}

void MacrophageGroup::act(const repast::Point<int> & pt)
{
  std::vector< double > Location(2, 0);

  std::vector< Agent * > Macrophages;
  mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);

  std::vector< Agent * > Bacteria;
  mpCompartment->getAgents(pt, Agent::Bacteria, Bacteria);

  std::vector< Agent * > Dentritics;
  mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);

  std::vector< Agent * > HPylori;
  mpCompartment->getAgents(pt, Agent::HPylori, HPylori);

  std::vector< Agent * > EpithelialCells;

  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
    {   //LocalFile::debug() << "I am in LP near the border()" << std::endl;
      mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
    }

  Concentration HPyloriConcentration;
  concentrations(Agent::HPylori, HPylori, HPyloriConcentration);

  Concentration EpithelialCellConcentration;
  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

  Concentration MacrophageConcentration;
  concentrations(Agent::Macrophage, Macrophages, MacrophageConcentration);

  Concentration BacteriaConcentration;
  concentrations(Agent::Bacteria, Bacteria, BacteriaConcentration);

  Concentration DentriticsConcentration;
  concentrations(Agent::Dentritics, Dentritics, DentriticsConcentration);

  double liveHPyloriConcentration = HPyloriConcentration[HPyloriState::NAIVE];
  double eDendriticsConcentration = DentriticsConcentration[DendriticState::EFFECTOR];
    //double damagedEpithelialCellConcentration = 1000;
  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
  double macrophageregConcentration = MacrophageConcentration[MacrophageState::REGULATORY];
  double macrophageinfConcentration = MacrophageConcentration[MacrophageState::INFLAMMATORY];
  double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];

  //LocalFile::debug() << "*** liveHPyloriConcentration	= " <<  liveHPyloriConcentration << std::endl;
  //LocalFile::debug() << "*** eDendriticsConcentration	= " << eDendriticsConcentration << std::endl;
  //LocalFile::debug() << "*** damagedEpithelialCellConcentration	= " << damagedEpithelialCellConcentration << std::endl;
  //LocalFile::debug() << "*** macrophageregConcentration	= " << macrophageregConcentration << std::endl;
  //LocalFile::debug() << "*** infectiousBacteriaConcentration	= " << infectiousBacteriaConcentration << std::endl;

  double IFNg = mpCompartment->cytokineValue("eIFNg", pt);
  double IL10 = mpCompartment->cytokineValue("eIL10", pt);

  MacrophageODE1 & odeModel = MacrophageODE1::getInstance();
  odeModel.setInitialConcentration("IFNg", IFNg);
  odeModel.setInitialConcentration("IL10", IL10);

  /* run time course */
  odeModel.runTimeCourse();

  double Mreg = odeModel.getConcentration("Mreg");
  /*identify states of HPylori counted -- naive name should be changed to LIVE*/
  std::vector< Agent * >::iterator it = Macrophages.begin();
  std::vector< Agent * >::iterator end = Macrophages.end();

  for (; it != end; ++it){
      Agent * pAgent = *it;
      MacrophageState::State state = (MacrophageState::State) pAgent->getState();

      MacrophageState::State newState = state;

      // double tolegenicBacteriaConcentration = BacteriaConcentration[BacteriaState::TOLEROGENIC];
//      LocalFile::debug() << "Microphage::infectiousBacteriaConcentration=" << infectiousBacteriaConcentration << std::endl;

      /*get concentration of IFNg and IL10 for COPASI input*/

//	  LocalFile::debug() << count++ << ". HPylori.size() = " << HPylori.size() << std::endl;

      /* if no bacteria is around macrophage, then stays immature */
      if (state == MacrophageState::MONOCYTE){
          if ((damagedEpithelialCellConcentration > 0 || eDendriticsConcentration > 0)
    		  && (p_rule13 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
        	  LocalFile::debug() << "*** Macrophage proliferates" << std::endl;
        	  mpCompartment->getLocation(pAgent->getId(), Location);
    		  mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
    	  }
          else if ((liveHPyloriConcentration > ENISI::Threshold || infectiousBacteriaConcentration > ENISI::Threshold)
                   && (p_rule42 > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next())){
			  			  /* set initial concentrations */
			  /* NOTE: IFNg and IL10 provide good Mreg variation between values 0 and 10 */
			  // double IFNg = odeModel.getConcentration("IFNg");
			  // double IL10 = odeModel.getConcentration("IL10");

			  /* regulatory macrophages differentiate if ODE predicts regulatory differentiation */
			  /* NOTE: Mreg value from ODE model will vary from 0 to 1 */
			  if (HPylori.size() > 0){
				  if (Mreg > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()){
					  LocalFile::debug() << "*** Macrophage transit to REGULATORY" << std::endl;
					  newState = MacrophageState::REGULATORY;
					  pAgent->setState(newState);
					  mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
					  HPylori.pop_back();
				  }
				  /* inflammatory macrophages differentiate if ODE predicts inflammatory differentiation */
				  else if (p_MinfDiff > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()){
					  LocalFile::debug() << "*** Macrophage transit to INFLAMMATORY" << std::endl;
					  newState = MacrophageState::INFLAMMATORY;
					  pAgent->setState(newState);
					  // TODO CRITICAL Does this always consume an HPylori
					  mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
					  HPylori.pop_back();
				  }
			  }
		  }
      }
		  // TODO We should use the production of the ODE model
		  /* regulatory macrophages produce IL10 */
      if (newState == MacrophageState::REGULATORY) {
    	  mpCompartment->cytokineValue("eIL10", pt) += 7;
    	  if ((macrophageinfConcentration > 0)
    			  && (p_rule28a > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
    		  LocalFile::debug() << "*** Macrophage_Regulatory dies naturally" << std::endl;
    		  mpCompartment->removeAgent(pAgent);
    		  continue;
    	  }
      }
	  if (newState == MacrophageState::INFLAMMATORY){
		  mpCompartment->cytokineValue("eIFNg", pt) += 7;
		  if ((macrophageregConcentration > 0)
		       && (p_rule28b > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())){
			  LocalFile::debug() << "*** Macrophage_Inflamatory dies naturally" << std::endl;
			  mpCompartment->removeAgent(pAgent);
			  continue;
		  }
	  }
    }//END of for
}//END of act()
// virtual
void MacrophageGroup::move(){
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
void MacrophageGroup::write(const repast::Point<int> &)
{

}
