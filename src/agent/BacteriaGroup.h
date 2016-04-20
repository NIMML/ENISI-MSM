#ifndef ENISI_MSM_BACTERIA_COMPONENT_H
#define ENISI_MSM_BACTERIA_COMPONENT_H

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;
class Agent;

class BacteriaGroup
{
public:
  BacteriaGroup(Compartment * pCompartment, const size_t & count);

  virtual void act();

  virtual std::string classname() {return "BacteriaGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;

  double p_BacteriaKill;
  double p_BacteriaDeath;
  double p_BacteriaLPProl;
  double p_BacteriaLumProl;
  double p_rule1;

};

} // namespace ENISI

#endif
