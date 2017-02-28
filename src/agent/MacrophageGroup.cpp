#include "agent/MacrophageGroup.h"
#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "agent/MacrophageODE1.h"
#include "DataWriter/LocalFile.h"

using namespace ENISI;

MacrophageGroup::MacrophageGroup(Compartment * pCompartment,
                                 const double & monocyteConcentration,
                                 const double & residentConcentration):
  GroupInterface(pCompartment)
{
  size_t LocalCount = mpCompartment->localCount(monocyteConcentration);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE));
    }

  LocalCount = mpCompartment->localCount(residentConcentration);

  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Macrophage, MacrophageState::RESIDENT));
    }

  const Properties * pModel = Properties::instance(Properties::model);

  pModel->getValue("p_MinfDiff", p_MinfDiff);
  pModel->getValue("p_MregDiff", p_MregDiff);
  pModel->getValue("p_monorep", p_monorep);
  pModel->getValue("p_Monocap", p_Monocap);
  pModel->getValue("p_Monocytedeath", p_Monocytedeath); 
  pModel->getValue("p_resmacrep", p_resmacrep);
  pModel->getValue("p_resmacCap", p_resmacCap);
  pModel->getValue("p_resmaccyto", p_resmaccyto);
  pModel->getValue("p_resmacdeath", p_resmacdeath);	
  pModel->getValue("p_Mregcyto", p_Mregcyto);
  pModel->getValue("p_Minfcyto", p_Minfcyto); 
  pModel->getValue("p_HPregenv", p_HPregenv);
  pModel->getValue("p_trmackill", p_trmackill);
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

  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

  std::vector< Agent * > EpithelialCells;

  if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
    {  
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

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  double liveHPyloriConcentration = HPyloriConcentration[HPyloriState::LIVE];
  double eDendriticsConcentration = DentriticsConcentration[DendriticState::EFFECTOR];
  double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
  double macrophageregConcentration = MacrophageConcentration[MacrophageState::REGULATORY];
  double macrophageinfConcentration = MacrophageConcentration[MacrophageState::INFLAMMATORY];
  double resmacConcentration        = MacrophageConcentration[MacrophageState::RESIDENT];
  double infectiousBacteriaConcentration = BacteriaConcentration[BacteriaState::INFECTIOUS];
  double th1Concentration = TcellConcentration[TcellState::TH1];
  double monosConcentration = MacrophageConcentration[MacrophageState::MONOCYTE] + MacrophageConcentration[MacrophageState::INFLAMMATORY] + MacrophageConcentration[MacrophageState::REGULATORY] + MacrophageConcentration[MacrophageState::RESIDENT]; 

  //LocalFile::debug() << "*** liveHPyloriConcentration	= " <<  liveHPyloriConcentration << std::endl;

  double IFNg = mpCompartment->cytokineValue("eIFNg", pt);
  double IL10 = mpCompartment->cytokineValue("eIL10", pt);
  double TGFb = mpCompartment->cytokineValue("eTGFb", pt);

  MacrophageODE1 & odeModel = MacrophageODE1::getInstance();
  odeModel.setInitialConcentration("IFNg", IFNg);
  odeModel.setInitialConcentration("IL10", IL10);
  /* run time course */
  odeModel.runTimeCourse();
	
  double Mreg = odeModel.getConcentration("Mreg");
  std::vector< Agent * >::iterator it = Macrophages.begin();
  std::vector< Agent * >::iterator end = Macrophages.end();

  for (; it != end; ++it)
  {
	  Agent * pAgent = *it;
	  MacrophageState::State state = (MacrophageState::State) pAgent->getState();
	  MacrophageState::State newState = state;
	  /* set initial concentrations */
	  /* NOTE: IFNg and IL10 provide good Mreg variation between values 0 and 10 */
	  // double IFNg = odeModel.getConcentration("IFNg");
	  // double IL10 = odeModel.getConcentration("IL10");
	  /* regulatory macrophages differentiate if ODE predicts regulatory differentiation */
	  /* NOTE: Mreg value from ODE model will vary from 0 to 1 */
	  if (state == MacrophageState::MONOCYTE)
	  {
		  if ((damagedEpithelialCellConcentration > ENISI::Threshold  || eDendriticsConcentration > ENISI::Threshold )
				  && p_monorep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()
				  && p_Monocap > monosConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  mpCompartment->getLocation(pAgent->getId(), Location);
			  mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
		  }
		  if ((liveHPyloriConcentration > ENISI::Threshold || infectiousBacteriaConcentration > ENISI::Threshold)
				  && (p_HPregenv > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()))
		  {		  
			if (Mreg > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()
			   && p_MregDiff > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next())
			{
			            //LocalFile::debug() << "*** Macrophage transit to REGULATORY" << std::endl;
				    newState = MacrophageState::REGULATORY;
			            pAgent->setState(newState);
				    if (HPylori.size() > 0)
				      {
					  mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
					  HPylori.pop_back();				
				      }
				    if (Bacteria.size() > 0)
				      {
					  mpCompartment->removeAgent(Bacteria[Bacteria.size() - 1]);
					  Bacteria.pop_back();				
				      }
			}//End of regulatory macrophages
		        else if((IFNg > ENISI::Threshold || th1Concentration > ENISI::Threshold)
				&& p_MinfDiff > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next())
			{
				//LocalFile::debug() << "*** Macrophage transit to INFLAMMATORY" << std::endl;
				newState = MacrophageState::INFLAMMATORY;
				pAgent->setState(newState);
				if (HPylori.size() > 0)
				      {
					  mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
					  HPylori.pop_back();				
				      }
				if (Bacteria.size() > 0)
				      {
					  mpCompartment->removeAgent(Bacteria[Bacteria.size() - 1]);
					  Bacteria.pop_back();				
				      }
			}//End of inflammatory macrophages
				  /* inflammatory macrophages differentiate if ODE predicts inflammatory differentiation */
				  /*else if (p_MinfDiff > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
				  {
					  LocalFile::debug() << "*** Macrophage transit to INFLAMMATORY" << std::endl;
					  newState = MacrophageState::INFLAMMATORY;
					  pAgent->setState(newState);
					  // TODO CRITICAL Does this always consume an HPylori
					  mpCompartment->removeAgent(HPylori[HPylori.size() - 1]);
					  HPylori.pop_back();
				}*/		  
		   }
		  if (p_Monocap > monosConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()
				  && p_monorep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  mpCompartment->getLocation(pAgent->getId(), Location);
			  mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
			  continue;
		  } // Proliferation of monocytes
		  if (p_Monocytedeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {		 
			  mpCompartment->removeAgent(pAgent);
			  continue;
		  } //Death of monocytes
	  }//End of monocyte conditions
	  if (state == MacrophageState::REGULATORY)
	  {	
		  if ((damagedEpithelialCellConcentration > ENISI::Threshold) 
		      && p_monorep > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()
		      && p_Monocap > monosConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
				mpCompartment->getLocation(pAgent->getId(), Location);
				mpCompartment->addAgent(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE), Location);
	          } //Monocytes proliferate, that can then change to Regulatory or inflammatory in next TICK
		  if (p_Mregcyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  //mpCompartment->cytokineValue("eIL10", pt) += 7;
			  mpCompartment->cytokineValue("eTGFb", pt) += 5;
		  }
		  if (p_Monocytedeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  //LocalFile::debug() << "*** Macrophage_Regulatory dies naturally" << std::endl;
			  mpCompartment->removeAgent(pAgent);
			  continue;
		  }		 
	  } //End of Mreg conditions
	  if (state == MacrophageState::INFLAMMATORY)
	  {
		  if (p_Minfcyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  mpCompartment->cytokineValue("eIFNg", pt) += 7;
		  }		 
		  if ((damagedEpithelialCellConcentration > ENISI::Threshold || macrophageinfConcentration > ENISI::Threshold) 
		      && p_monorep > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next() 
		      && p_Monocap > monosConcentration * repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  mpCompartment->getLocation(pAgent->getId(), Location);
			  mpCompartment->addAgent(new Agent(Agent::Macrophage, MacrophageState::MONOCYTE), Location);
			  continue;
		  }		  		
	           if (p_Monocytedeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		  {
			  mpCompartment->removeAgent(pAgent);
			  continue;
		  }
	  }  
	  if (state == MacrophageState::RESIDENT) //resident macrophages that contribute towards HP proliferation
		{	
		       if ((liveHPyloriConcentration > ENISI::Threshold) || 
			    (infectiousBacteriaConcentration > ENISI::Threshold)
				  && (p_resmacrep > repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next())
				  && (p_resmacCap>  resmacConcentration * repast::Random::instance()-> createUniDoubleGenerator(0.0, 1.0).next()))
		        {
			  
			  LocalFile::debug() << "Resident macrophage proliferates" << std::endl;
			  mpCompartment->getLocation(pAgent->getId(), Location);
			  mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
			  continue;
		        }
		        if (p_resmaccyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
			{
				mpCompartment->cytokineValue("eIL10", pt) += 5;
				mpCompartment->cytokineValue("eTGFb", pt) += 2;
			}
			if ((resmacConcentration > ENISI::Threshold)
					&& p_resmacrep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()
			   		&& p_resmacCap > (resmacConcentration * repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
			{
				mpCompartment->getLocation(pAgent->getId(), Location);
				mpCompartment->addAgent(new Agent(Agent::Macrophage, pAgent->getState()), Location);
			}
		  
			if (p_resmacdeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
			{
				mpCompartment->removeAgent(pAgent);
				continue;
			}
		         if ((th1Concentration > ENISI::Threshold || IFNg > ENISI::Threshold)
					&& (p_trmackill > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
		  	{
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
