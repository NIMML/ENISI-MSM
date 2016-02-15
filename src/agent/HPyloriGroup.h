#ifndef ENISI_MSM_AGENT_HPYLORIGROUP_H
#define ENISI_MSM_AGENT_HPYLORIGROUP_H

#include "CoordMap.h"

namespace HPyloriState {
  enum State { ALIVE, DEAD, KEEP_AT_END};
};

class HPyloriGroup : public CoordinateMap<HPyloriState::KEEP_AT_END>
{
  virtual void act();
  virtual Color getColor() { return black; }
  virtual std::string classname() { return "HPyloriGroup"; }
};

#endif
