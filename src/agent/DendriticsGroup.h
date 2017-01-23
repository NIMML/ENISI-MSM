#ifndef ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H
#define ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"
#include "agent/GroupInterface.h"

namespace ENISI
{

class DendriticsGroup: public GroupInterface
{
public:

  DendriticsGroup(Compartment * pCompartment, const double & concentrations);

  virtual std::string classname() const {return "DendriticsGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double p_iDCtoeDCLP;
  double p_iDCtotDCLP;
  double p_iDCtoeDCE;
  double p_iDCtotDCE;
  double p_DCDeath;
  double p_iDCrep;
  double p_eDCcyto;
  double p_tDCcyto;
  double p_iDCmoveLPtoEpi;
  double p_iDCmoveEpitoLP;
  double p_DCEpitoLP;
  double p_DCbasal;
  double p_DCLPtoGLN;
  
};

} // namespace ENISI
#endif
