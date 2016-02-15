#ifndef ENISI_MSM_AGENT_MACROPHAGEGROUP_H
#define ENISI_MSM_AGENT_MACROPHAGEGROUP_H

#include "CoordMap.h"

namespace MacrophageState {
  enum State { BASE /*Monocyte*/, REGULATORY, DEAD, KEEP_AT_END};
};

class MacrophageGroup : public CoordinateMap<MacrophageState::KEEP_AT_END>
{
public:
  MacrophageGroup(const boost::uintmax_t, CellLayer * p_layer);
  virtual void act();
  virtual Color getColor() { return black; }
  virtual std::string classname() { return "MacrophageGroup"; }
private:
  void act(MacrophageState::State, const repast::Point<int> &);
};

#endif
