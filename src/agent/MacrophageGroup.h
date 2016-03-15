#ifndef ENISI_MSM_AGENT_MACROPHAGEGROUP_H
#define ENISI_MSM_AGENT_MACROPHAGEGROUP_H

#include "CoordMap.h"
#include "agent/HPyloriGroup.h"

namespace ENISI {

class MacrophageState
{
public:
  enum State { MONOCYTE/*base state*/, REGULATORY, DEAD, KEEP_AT_END};
};

class MacrophageGroup : public CoordinateMap<MacrophageState::KEEP_AT_END>
{
public:
  MacrophageGroup(const boost::uintmax_t, Compartment * pCompartment);
  virtual void act();
  virtual Color getColor() { return black; }
  virtual std::string classname() { return "MacrophageGroup"; }

  const std::vector< const HPyloriGroup::StateCount *>
    getHPyloriNeighbors(const repast::Point<int> &); 
private:
  void act(MacrophageState::State, const repast::Point<int> &);
};

} // namespace ENISI
#endif
