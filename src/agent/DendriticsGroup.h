#ifndef ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H
#define ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H

#include "AgentStates.h"
#include "CoordMap.h"

namespace ENISI
{

class DendriticsGroup: public CoordinateMap<DendriticState::KEEP_AT_END>
{
public:

  DendriticsGroup(const boost::uintmax_t, Compartment * pCompartment);

  virtual void act();

  virtual Color getColor() {return black;}
  virtual std::string classname() {return "DendriticsGroup";}

private:
  void act(DendriticState::State, const repast::Point<int> &);

  const std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * >
  getBacteriaNeighbors(const repast::Point<int> &);

  const std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >
  getHPyloriNeighbors(const repast::Point<int> &);
};
} // namespace ENISI
#endif
