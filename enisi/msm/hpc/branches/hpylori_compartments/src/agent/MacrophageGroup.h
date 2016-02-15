#ifndef ENISI_MSM_AGENT_MACROPHAGEGROUP_H
#define ENISI_MSM_AGENT_MACROPHAGEGROUP_H

#include "CoordMap.h"

namespace MacrophageState {
  enum State { BASE, REGULATORY, DEAD, KEEP_AT_END};
};

class MacrophageGroup : public CoordinateMap<MacrophageState::KEEP_AT_END>
{
  virtual void act();
  virtual Color getColor() { return black; }
  virtual std::string classname() { return "MacrophageGroup"; }
};

#endif
