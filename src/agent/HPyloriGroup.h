#ifndef ENISI_MSM_AGENT_HPYLORIGROUP_H
#define ENISI_MSM_AGENT_HPYLORIGROUP_H

#include "AgentStates.h"
#include "CoordMap.h"

namespace ENISI
{

class HPyloriGroup : public CoordinateMap<HPyloriState::KEEP_AT_END>
{
public:
  HPyloriGroup(const boost::uintmax_t, Compartment * pCompartment);
  virtual void act();
  virtual Color getColor() {return black;}
  virtual std::string classname() {return "HPyloriGroup";}
private:
  void act(HPyloriState::State, const repast::Point<int> &);
};
}

#endif
