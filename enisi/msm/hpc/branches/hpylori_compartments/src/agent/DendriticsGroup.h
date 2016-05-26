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
  double p_rule17a;
  double p_rule17b;
  double p_rule48a;
  double p_rule48b;
  double p_DCDeath;
  double p_rule15;
  double p_rule34;
  double p_rule51a;
  double p_rule51b;
  double p_rule52;
  double p_iDCEpitheliumDistance;
  double p_iDCLPDistance;
  double p_mDCGLNDistance;

};

} // namespace ENISI
#endif
