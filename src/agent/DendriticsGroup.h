#ifndef ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H
#define ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;
class Agent;

class DendriticsGroup
{
public:

  DendriticsGroup(Compartment * pCompartment, const size_t & count);

  virtual void act();

  virtual std::string classname() {return "DendriticsGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;

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
