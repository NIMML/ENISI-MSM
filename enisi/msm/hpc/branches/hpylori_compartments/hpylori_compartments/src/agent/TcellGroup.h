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
  TcellGroup(Compartment * pCompartment, const double & concentrations);
  virtual std::string classname() const {return "TcellGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double p_rule18; /*Rule 18 parameter*/
  double p_rule19; /*Rule 19 parameter*/
  double p_rule20; /*Rule 20 parameter*/
  double p_rule21; /*Rule 21 parameter*/
  double p_rule22; /*Rule 22 parameter*/
  double p_rule23; /*Rule 23 parameter*/
  double p_rule24; /*Rule 24 parameter*/
  double p_rule26; /*Rule 26 parameter*/
  double p_rule27; /*Rule 27 parameter*/
  double p_rule31; /*Rule 31 parameter*/
  double p_rule31a;/*Rule 31a parameter*/
  double p_rule32; /*Rule 32 parameter*/
  double p_rule33; /*Rule 33 parameter*/
  double p_rule35; /*Rule 35 parameter*/
  double p_rule36; /*Rule 36 parameter*/
  double p_rule37; /*Rule 37 parameter*/
  double p_rule38; /*Rule 38 parameter*/
  double p_rule39; /*Rule 39 parameter*/
  double p_rule40; /*Rule 40 parameter*/
  double p_rule41; /*Rule 41 parameter*/
  double p_rule53; /*Rule 53 parameter*/
  double p_rule55a;/*Rule 55a parameter*/
  double p_rule55b;/*Rule 55b parameter*/
  //double p_rule56;/*Rule 56 parameter*/
  double neardistane_border;/* For the rules that mention nearest distance from Border, earlier it was set as 2*/

  double p_IL17;
  double p_IFNg;
  double p_IL10;


};

} // namespace ENISI

#endif
