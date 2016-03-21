#ifndef ENISI_MSM_AGENT_MACROPHAGEGROUP_H
#define ENISI_MSM_AGENT_MACROPHAGEGROUP_H

#include "AgentStates.h"
#include "CoordMap.h"

namespace ENISI
{

class MacrophageGroup : public CoordinateMap<MacrophageState::KEEP_AT_END>
{
public:
  MacrophageGroup(const boost::uintmax_t, Compartment * pCompartment);
  virtual void act();
  virtual Color getColor() {return black;}
  virtual std::string classname() {return "MacrophageGroup";}

  std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >
  getHPyloriNeighbors(const repast::Point<int> &);
private:
  void act(MacrophageState::State, const repast::Point<int> &);
};
} // namespace ENISI
#endif
