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
};

} // namespace ENISI
#endif
