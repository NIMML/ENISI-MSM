#ifndef ENISI_MSM_AGENT_TCELLGROUP_H
#define ENISI_MSM_AGENT_TCELLGROUP_H


#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;
class Agent;

class TcellGroup
{
public:
  TcellGroup(Compartment * pCompartment, const size_t & count);
  virtual void act();
  virtual std::string classname() {return "TcellGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;
};

} // namespace ENISI

#endif
