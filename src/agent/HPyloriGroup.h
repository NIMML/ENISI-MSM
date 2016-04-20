#ifndef ENISI_MSM_AGENT_HPYLORIGROUP_H
#define ENISI_MSM_AGENT_HPYLORIGROUP_H

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;
class Agent;

class HPyloriGroup
{
public:
  HPyloriGroup(Compartment * pCompartment, const size_t & count);
  virtual void act();
  virtual std::string classname() {return "HPyloriGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;

  double p_rule3;
  double p_rule4a;
  double p_rule4b;
  double p_rule5;
  double p_HPyloriDeath;
};

} // namespace ENISI

#endif
