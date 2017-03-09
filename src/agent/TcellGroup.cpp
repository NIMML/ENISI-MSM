#include "TcellGroup.h"
#include "agent/ENISIAgent.h"
#include "compartment/Compartment.h"
#include "grid/Properties.h"
#include "DataWriter/LocalFile.h"
#include "agent/TcellODE.h"
#include "grid/Borders.h"

using namespace ENISI;

TcellGroup::TcellGroup(Compartment * pCompartment, const double & NaiveTConcentrations):
		                 
  GroupInterface(pCompartment)
{	   
   // size_t LocalCount = mpCompartment->localCount(monocyteConcentration);
	  
  size_t LocalCount = mpCompartment->localCount(NaiveTConcentrations);
  for (size_t i = 0; i < LocalCount; i++)
    {
      mpCompartment->addAgentToRandomLocation(new Agent(Agent::Tcell, TcellState::NAIVE));
    }
	  
  const Properties * pModel = Properties::instance(Properties::model);
	  
  pModel->getValue("p_Th17death", p_Th17death);
  pModel->getValue("p_naiveTcelldeath",p_naiveTcelldeath);
  pModel->getValue("p_iTregdeath", p_iTregdeath);
  pModel->getValue("p_Th1death", p_Th1death);
  pModel->getValue("p_Trdeath", p_Trdeath);	  
  pModel->getValue("p_nTtoTr", p_nTtoTr);
  pModel->getValue("p_nTtoTh1 ", p_nTtoTh1);
  pModel->getValue("p_nTtoiTreg", p_nTtoiTreg);
  pModel->getValue("p_nTtoTh17",p_nTtoTh17);
  pModel->getValue("p_nTtoTh1", p_nTtoTh1);
  pModel->getValue("p_rule31a",p_rule31a); 
  pModel->getValue("p_Th17toiTreg", p_Th17toiTreg); 
  pModel->getValue("p_iTregtoTh17", p_iTregtoTh17);
  pModel->getValue("p_Th17move", p_Th17move);
  pModel->getValue("p_iTregmove", p_iTregmove);
  pModel->getValue("p_Th1move", p_Th1move);
  pModel->getValue("p_allTrep", p_allTrep); 
  pModel->getValue("p_TotalTcap",p_TotalTcap);
  pModel->getValue("p_nTrep",p_nTrep);	   
  pModel->getValue("p_TH1cap",p_TH1cap);
  pModel->getValue("p_TH17cap",p_TH17cap);
  pModel->getValue("p_iTREGcap",p_iTREGcap);
  pModel->getValue("p_Th1rep",p_Th1rep);
  pModel->getValue("p_iTregrep",p_iTregrep);
  pModel->getValue("p_Th17rep",p_Th17rep);	  
  pModel->getValue("p_Trrep",p_Trrep);
  pModel->getValue("p_Th1cyto",p_Th1cyto);	
  pModel->getValue("p_Th17cyto",p_Th17cyto);
  pModel->getValue("p_TroriTregcyto",p_TroriTregcyto);	
  pModel->getValue("p_IL17", p_IL17);
  pModel->getValue("p_IFNg", p_IFNg);
  pModel->getValue("p_IL10", p_IL10);
  pModel->getValue("p_IL21", p_IL21);
}

void TcellGroup::act(const repast::Point<int> & pt)
{
	//LocalFile::debug() << "I am in Tcells act()" << std::endl;
	std::vector< double > Location(2, 0.0);

	std::vector< Agent * > Tcells;
	mpCompartment->getAgents(pt, Agent::Tcell, Tcells);

	std::vector< Agent * > Macrophages;
	mpCompartment->getAgents(pt, Agent::Macrophage, Macrophages);

	std::vector< Agent * > Dentritics;
	mpCompartment->getAgents(pt, Agent::Dentritics, Dentritics);

	std::vector< Agent * > EpithelialCells; // We only request information if we are at the border

	if (mpCompartment->getType() == Compartment::lamina_propria)
	  {
	    if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
	      {
	        mpCompartment->getAgents(pt, 0, -1, Agent::EpithelialCell, EpithelialCells);
	      }
	  }
	if (mpCompartment->getType() == Compartment::gastric_lymph_node)
	 {
		if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5)
		  {
			mpCompartment->getAgents(pt, 0, -1, Agent::Dentritics, Dentritics);
		  }
	 }

  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);
  Concentration MacrophageConcentration;
  concentrations(Agent::Macrophage, Macrophages, MacrophageConcentration);
  Concentration DentriticsConcentration;
  concentrations(Agent::Dentritics, Dentritics, DentriticsConcentration);
  Concentration EpithelialCellConcentration;
  concentrations(Agent::EpithelialCell, EpithelialCells, EpithelialCellConcentration);

	double IL6_pool  = mpCompartment->cytokineValue("eIL6", pt);
	double TGFb_pool = mpCompartment->cytokineValue("eTGFb", pt);
	double IL12_pool = mpCompartment->cytokineValue("eIL12", pt);

	TcellODE & odeModel = TcellODE::getInstance();

	odeModel.setInitialConcentration("IL6_pool", IL6_pool);
	odeModel.setInitialConcentration("TGFb_pool", TGFb_pool);
	odeModel.setInitialConcentration("IL12_pool", IL12_pool);

	/* run time course */
	if (!odeModel.runTimeCourse())
	  {
	    LocalFile::debug() << pt << std::endl;
	  }
	double dIFNg = odeModel.getConcentration("dIFNg");
	double dIL17 = odeModel.getConcentration("dIL17");
	double dIL10 = odeModel.getConcentration("dIL10");

  LocalFile::debug() << "dIFNg = " << dIFNg << std::endl;
  LocalFile::debug() << "dIL17 = " << dIL17 << std::endl;
  LocalFile::debug() << "dIL10 = " << dIL10 << std::endl;

	double macrophageregConcentration = MacrophageConcentration[MacrophageState::REGULATORY];
	double naiveTConcentration = TcellConcentration[TcellState::NAIVE];
	double th17Concentration = TcellConcentration[TcellState::TH17]; //Rules 22, 23, 36-39 when Th17 is in contact
	double itregConcentration = TcellConcentration[TcellState::iTREG]; //Rules 19-21when iTreg is in contact
	double th1Concentration = TcellConcentration[TcellState::TH1];
	double trConcentration = TcellConcentration[TcellState::Tr];
	double eDCConcentration = DentriticsConcentration[DendriticState::EFFECTOR]; //Rule 39 eDC count that is in contact with nT
	double tDCConcentration = DentriticsConcentration[DendriticState::TOLEROGENIC]; //Rule 23 tDC count
	double damagedEpithelialCellConcentration = EpithelialCellConcentration[EpithelialCellState::DAMAGED];
	
	double IFNg = mpCompartment->cytokineValue("eIFNg", pt);
	double IL10 = mpCompartment->cytokineValue("eIL10", pt);
	double TGFb = mpCompartment->cytokineValue("eTGFb", pt);
	double IL17 = mpCompartment->cytokineValue("eIL17", pt);
	double IL6  = mpCompartment->cytokineValue("eIL6", pt);
	double IL12 = mpCompartment->cytokineValue("eIL12", pt);
	double IL21 = mpCompartment->cytokineValue("eIL21", pt);
	// Rule 18 damagedEpithelialCellConcentration
	/*LocalFile::debug() << "eDCConcentration			      		="<< eDCConcentration 					<< std::endl;
	LocalFile::debug() << "tDCConcentration				 		="<< tDCConcentration 					<< std::endl;
	LocalFile::debug() << "damagedEpithelialCellConcentration	="<< damagedEpithelialCellConcentration << std::endl;
	LocalFile::debug() << "macrophageregConcentration		  	="<< macrophageregConcentration 		<< std::endl;
	LocalFile::debug() << "th17Concentration			  	  	="<< th17Concentration 					<< std::endl;*/
	//LocalFile::debug() << "th1Concentration			      =" << th1Concentration << std::endl;
	//LocalFile::debug() << "immatureDentritics		      =" << immatureDentritics << std::endl;
	std::vector< Agent * >::iterator it = Tcells.begin();
	std::vector< Agent * >::iterator end = Tcells.end();

for (; it != end; ++it)
  {
    Agent * pAgent = *it;
    TcellState::State state = (TcellState::State) pAgent->getState();
    if (state == TcellState::DEAD) continue;
    TcellState::State newState = state;

    /*if (state != TcellState::Tr) //Rule 58
		{
		//LocalFile::debug() << "I am here 00" << std::endl;
		if (dIL17 > p_IL17) {
			newState = TcellState::TH17;
			mpCompartment->cytokineValue("eIL17", pt) += 70;
			LocalFile::debug() << "I am here 01" << std::endl;
		}
		else if (dIFNg > p_IFNg) {
			newState = TcellState::TH1;
			mpCompartment->cytokineValue("eIFNg", pt) += 70;
			LocalFile::debug() << "I am here 02" << std::endl;
		}
		else if (dIL10 > p_IL10) {
			newState = TcellState::iTREG;
			mpCompartment->cytokineValue("eIL10", pt) += 70;
			LocalFile::debug() << "I am here 03" << std::endl;
		}
	}*/
    if (mpCompartment->getType() == Compartment::gastric_lymph_node)
      {
        if ((p_allTrep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	   && (p_TotalTcap > (naiveTConcentration + th17Concentration + th1Concentration + itregConcentration)))
          {
            mpCompartment->getLocation(pAgent->getId(), Location);
            mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
            continue;
          } // Proliferation of all the T cells inside GLN
        if(state == TcellState::NAIVE)
          {
            if (eDCConcentration  > ENISI::Threshold)
              {
		LocalFile::debug() << "TH1 cap" << p_TH1cap << std::endl;   
		LocalFile::debug() << "Th1 concentration" << th1Concentration << std::endl;   
				 
                if (((dIFNg > p_IFNg) || (IL12 > p_IL12) ||
		    (p_nTtoTh1 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
		   && (p_TH1cap > th1Concentration))
                  {
                    newState = TcellState::TH1; /*Rule 39*/
                    pAgent->setState(newState);
                    LocalFile::debug() <<"nT changes to TH1" << std::endl;
                  }
                else if ((p_nTtoTh17 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
			 && (p_TH17cap > th17Concentration)
                    || (dIL17 > p_IL17) || (IL6 > p_IL6) || (TGFb > p_TGFb))
                  {
		    LocalFile::debug() << "nT changes to Th17" << std::endl;
                    newState = TcellState::TH17;
                    pAgent->setState(newState);
                   // mpCompartment->cytokineValue("eIL17", pt) += dIL17;
                  }
               /* else if (p_nTtoTh1 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()
                    && dIFNg > p_IFNg)
                  {
                    newState = TcellState::TH1;
                    //pAgent->setState(newState);
                    mpCompartment->cytokineValue("eIFNg", pt) += dIFNg;
                    LocalFile::debug() << ">>> eDC changed nT to Th1" << std::endl;
                  } */
              }// End of naive eDC loop 
            else if ((tDCConcentration > ENISI::Threshold)
                || (TGFb > p_TGFb) || (p_nTtoiTreg > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		    && (p_iTREGcap > itregConcentration))
              {
                newState = TcellState::iTREG; /*Rule 53*/
                pAgent->setState(newState);
                //LocalFile::debug() << "I am here 12" << std::endl;
              }// End of naive tDC loop 
            if (p_naiveTcelldeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
            	mpCompartment->removeAgent(pAgent); /*Rule naiveTcelldeath*- Naive T cell can die in LP*/
            	continue;
            }
          }//End of naive T cell loop
        if (state == TcellState::TH17)
          {
        	if  ((tDCConcentration > ENISI::Threshold)
        			&& p_Th17toiTreg > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        	{
        		newState = TcellState::iTREG; /*Rule 36*/
        		pAgent->setState(newState);
        		//LocalFile::debug() << "I am here 7" << std::endl;
        	}
        	if ((IL21 > p_IL21) || p_Th17cyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		{
			mpCompartment->cytokineValue("eIL17", pt) += 7;
		}
		if (p_Th17death > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        	{
        		mpCompartment->removeAgent(pAgent); /*Rule 24*- TH17 can die in GLN*/
        		continue;
        	}
        	if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5           
                           && (p_Th17move > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))/*Rule 32*/
                {
                        std::vector<double> Location;
            		mpCompartment->getLocation(pAgent->getId(), Location);
            		Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
            		mpCompartment->moveTo(pAgent->getId(), Location);
            		continue;
          	}
          }//End of Th17
        if (state == TcellState::iTREG)
          {
            	if (eDCConcentration > tDCConcentration
                	&& p_iTregtoTh17 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
              	{
                	newState = TcellState::TH17; /*Rule 37*/
                	pAgent->setState(newState);
                //LocalFile::debug() << "I am here 9" << std::endl;
              	}
		if (p_TroriTregcyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		{
			mpCompartment->cytokineValue("eIL10", pt) += 5;
		}
            	if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5           
                 	&& (p_iTregmove > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))//Rule 32
          	{
            		std::vector<double> Location;
            		mpCompartment->getLocation(pAgent->getId(), Location);
            		Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
            		mpCompartment->moveTo(pAgent->getId(), Location);
            		continue;
          	}
		if (p_iTregdeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	      	{
			mpCompartment->removeAgent(pAgent); /*Rule 26*- iTREG can die in GLN*/
	        	continue;		
	       	}
	}     
        if (state == TcellState::TH1)
        {
		if (mpCompartment->gridBorders()->distanceFromBorder(pt.coords(), Borders::Y, Borders::LOW) < 0.5            
            		&& (p_Th1move > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))/*Rule 32*/
          	{
            		std::vector<double> Location;
            		mpCompartment->getLocation(pAgent->getId(), Location);
            		Location[Borders::Y] -= 1.01 * mpCompartment->spaceBorders()->distanceFromBorder(Location, Borders::Y, Borders::LOW);
            		mpCompartment->moveTo(pAgent->getId(), Location);
            		continue;
          	}
		if ((IL21 > p_IL21) || p_Th1cyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		{
			mpCompartment->cytokineValue("eIFNg", pt) += 5;
		}
		if (p_Th1death > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
        	{
        		mpCompartment->removeAgent(pAgent); /*Rule 27*- Th1 can die in LP*/
        		continue;
        	}
        }	
      }// end of the Compartment Type = Compartment::GLN
    if (mpCompartment->getType() == Compartment::lamina_propria)
      {      
        if (state == TcellState::NAIVE)
          {
           if ((p_TotalTcap > (naiveTConcentration + th17Concentration + th1Concentration + itregConcentration + trConcentration))
	      	&& (p_nTrep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
            	mpCompartment->getLocation(pAgent->getId(), Location);
		mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
		continue;
            }
	   if ((IL10 > p_rule31a * IFNg)
              	&& (macrophageregConcentration > ENISI::Threshold)
               	&& (p_nTtoTr > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
            {
                newState = TcellState::Tr; 
		pAgent->setState(newState);
		//Rule 31: if nT is in contact with regulatory macrophages, and if IL10> a* IFNg, then nT -> Tr
                //LocalFile::debug() << "I am here 0" << std::endl;
             }	
            if (p_naiveTcelldeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
            {
            	mpCompartment->removeAgent(pAgent); /*Rule naiveTcelldeath*- Naive T cell can die in LP*/
            	continue;
            }	    
          }
        if (state == TcellState::iTREG)
          {
            if ((th1Concentration > ENISI::Threshold) || (eDCConcentration > tDCConcentration) || (th17Concentration > ENISI::Threshold)
                || ((IL17 + IL6) > (TGFb + IL10)) || (damagedEpithelialCellConcentration > ENISI::Threshold)  
		&& (p_iTregtoTh17 > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
              {
                newState = TcellState::TH17;
                pAgent->setState(newState);
                //LocalFile::debug() << "I am here 3" << std::endl;
              }	               
	    if (p_TroriTregcyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	     {
		mpCompartment->cytokineValue("eIL10", pt) += 5;
	     }
	    if ((p_iTregrep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		&& (p_TotalTcap > (naiveTConcentration + th17Concentration + th1Concentration + itregConcentration + trConcentration)))
              {
            	mpCompartment->getLocation(pAgent->getId(), Location);
		mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
		continue;
              }
	    if (p_iTregdeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
              {
                mpCompartment->removeAgent(pAgent); 
                continue;
              }		
	}
        if (state == TcellState::TH17)
          {               
          if ((tDCConcentration  > eDCConcentration) ||((IL17 + IL6) < (TGFb + IL10))
	      	     || (itregConcentration > ENISI::Threshold)
                     && (p_Th17toiTreg > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()))
              {
                newState = TcellState::iTREG; 
                pAgent->setState(newState);            
              }	        	  
	  if ((eDCConcentration > ENISI::Threshold) ||(damagedEpithelialCellConcentration > ENISI::Threshold)	
		    || (p_Th17rep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		    && (p_TotalTcap > (naiveTConcentration + th17Concentration + th1Concentration + itregConcentration + trConcentration)))
	      {
            	mpCompartment->getLocation(pAgent->getId(), Location);
		mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
		continue;
              }	
	  if (p_Th17death > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()) 
	      {
                mpCompartment->removeAgent(pAgent); 
                continue;
              }
	  if (p_Th17cyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	      {
		mpCompartment->cytokineValue("eIL17", pt) += 5;
	      }
          }
        if (state == TcellState::TH1)
          {
            if ((eDCConcentration > ENISI::Threshold) || (damagedEpithelialCellConcentration > ENISI::Threshold)
		&& (p_Th1rep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		&& (p_TotalTcap > (naiveTConcentration + th17Concentration + th1Concentration + itregConcentration + trConcentration)))
              {
            	mpCompartment->getLocation(pAgent->getId(), Location);
		mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
		continue;
              }
	    if (p_Th17cyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
	      {
		 mpCompartment->cytokineValue("eIFNg", pt) += 5;
	      }
	    if (p_Th1death > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
              {
                mpCompartment->removeAgent(pAgent); 
                continue;
              }	    
          }
        if (state == TcellState::Tr)
        {
            if ((p_Trrep > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
		&& (p_TotalTcap > (naiveTConcentration + th17Concentration + th1Concentration + itregConcentration + trConcentration)))
              {
            	mpCompartment->getLocation(pAgent->getId(), Location);
		mpCompartment->addAgent(new Agent(Agent::Tcell, pAgent->getState()), Location);
		continue;
              }
            if (p_TroriTregcyto > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next()) 
     	      {    
        	mpCompartment->cytokineValue("eIL10", pt) += 5; // production based on ODE for IL10		
      	      }	
	    if (p_Trdeath > repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0).next())
              {
        	mpCompartment->removeAgent(pAgent); 
        	continue;
              }			
        }       
      }//END of LP  
  }
}//end of act

// virtual
void TcellGroup::move()
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
void TcellGroup::write(const repast::Point<int> & pt)
{
  std::ostream & o = LocalFile::instance(mpCompartment->getName())->stream();
  std::vector< Agent * > Tcells;
  mpCompartment->getAgents(pt, Agent::Tcell, Tcells);
  Concentration TcellConcentration;
  concentrations(Agent::Tcell, Tcells, TcellConcentration);

  Concentration::const_iterator it = TcellConcentration.begin();
  Concentration::const_iterator end = TcellConcentration.end();

  for (int i = 0; it != end; ++it, ++i)
    {
	  if (i) o << ", ";

	  o << "[" << i << "] = " << *it;
  }
}
