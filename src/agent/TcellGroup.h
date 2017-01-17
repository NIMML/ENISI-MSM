#ifndef ENISI_MSM_AGENT_TCELLGROUP_H
#define ENISI_MSM_AGENT_TCELLGROUP_H


#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"
#include "agent/GroupInterface.h"

namespace ENISI
{

class TcellGroup: public GroupInterface
{
public:
 // TcellGroup(Compartment * pCompartment, const double & concentrations);
  TcellGroup(Compartment * pCompartment, const double & NaiveTConcentrations, 
		                         const double & Th1Concentrations, 
		       			 const double & Th17Concentrations,
                                 	 const double & iTregConcentrations,
					 const double & TrConcentrations);
  
  
  virtual std::string classname() const {return "TcellGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  pModel->getValue("p_Th17death", p_Th17death);
  pModel->getValue("p_naiveTcelldeath",p_naiveTcelldeath);
  pModel->getValue("p_iTregdeath", p_iTregdeath);
  pModel->getValue("p_Th1death7", p_Th1death);
  pModel->getValue("p_nTtoTr", p_nTtoTr);
  pModel->getValue("p_nTtoTh1 ", p_nTtoTh1);
  pModel->getValue("p_nTtoiTreg", p_nTtoiTreg);
  pModel->getValue("p_nTtoTh17",p_nTtoTh17);
  pModel->getValue("p_nTtoTh1", p_nTtoTh1);
  pModel->getValue("p_rule31a",p_rule31a);
  pModel->getValue("p_Th17toiTregs", p_Th17toiTregs);
  pModel->getValue("p_Th17toiTreg", p_Th17toiTreg);
  pModel->getValue("p_iTregtoTh17s", p_iTregtoTh17s);
  pModel->getValue("p_iTregtoTh17", p_iTregtoTh17);
  pModel->getValue("p_Th17move", p_Th17move);
  pModel->getValue("p_iTregmove", p_iTregmove);
  pModel->getValue("p_iTh1move", p_iTh1move);
  pModel->getValue("p_allTpro", p_allTpro); 
  pModel->getValue("p_TotalTcap",p_TotalTcap);  
  pModel->getValue("p_nTcap",p_nTcap);
  pModel->getValue("p_Th1cap",p_Th1cap);
  pModel->getValue("p_Th17cap",p_Th17cap);
  pModel->getValue("p_iTregcap",p_iTregcap);
  pModel->getValue("p_Trcap",p_Trcap);	  
  pModel->getValue("p_Th1cyto",p_Th1cyto);	
  pModel->getValue("p_Th17cyto",p_Th17cyto);
  pModel->getValue("p_iTregcyto",p_iTregcyto);
  pModel->getValue("p_Trcyto",p_Trcyto);	
  //double p_rule56;/*Rule 56 parameter*/
  double neardistane_border;/* For the rules that mention nearest distance from Border, earlier it was set as 2*/

  double p_IL17;
  double p_IFNg;
  double p_IL10;
};

} // namespace ENISI

#endif
