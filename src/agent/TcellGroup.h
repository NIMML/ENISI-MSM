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
  TcellGroup(Compartment * pCompartment, const double & NaiveTConcentrations);
		                         
  
  
  virtual std::string classname() const {return "TcellGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double  p_Th17death;
  double  p_naiveTcelldeath;
  double  p_iTregdeath;
  double  p_Th1death7;
  double  p_nTtoTr;
  double  p_nTtoTh1 ;
  double  p_nTtoiTreg;
  double  p_nTtoTh17;
  double  p_nTtoTh1;
  double  p_rule31a;
  double  p_Th17toiTregs;
  double  p_Th17toiTreg;
  double  p_iTregtoTh17s;
  double  p_iTregtoTh17;
  double  p_Th17move;
  double  p_iTregmove;
  double  p_iTh1move;
  double  p_allTpro;
  double  p_TotalTcap  ;
  double  p_nTcap;
  double  p_Th1cap;
  double  p_Th17cap;
  double  p_iTregcap;
  double  p_Trcap;
  double  p_Th1cyto;	
  double  p_Th17cyto;
  double  p_iTregcyto;
  double  p_Trcyto;	
  //double p_rule56;/*Rule 56 parameter*/
  double neardistane_border;/* For the rules that mention nearest distance from Border, earlier it was set as 2*/

  double p_IL17;
  double p_IFNg;
  double p_IL10;
};

} // namespace ENISI

#endif
