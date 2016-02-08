#ifndef ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H
#define ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H

#include "BacteriaGroup.h"
#include "CoordMap.h"

namespace DendriticState {
  enum State { IMMATURE, EFFECTOR, TOLEROGENIC, DEAD, KEEP_AT_END};
}

class DendriticsGroup: public CoordinateMap<DendriticState::KEEP_AT_END>
{
public:

  DendriticsGroup(const boost::uintmax_t, CellLayer *);

  virtual void act();

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "DendriticsGroup"; }

private:
  void act(DendriticState::State, const repast::Point<int> &);

  const std::vector<const BacteriaGroup::StateCount *> 
    getBacteriaNeighbors(const repast::Point<int> &);
};

#endif
