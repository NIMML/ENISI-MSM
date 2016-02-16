#ifndef ENISI_MSM_AGENT_HPYLORIGROUP_H
#define ENISI_MSM_AGENT_HPYLORIGROUP_H

#include "CoordMap.h"

namespace HPyloriState {
  enum State { NAIVE, DEAD, KEEP_AT_END};
};

class HPyloriGroup : public CoordinateMap<HPyloriState::KEEP_AT_END>
{
public:
  HPyloriGroup(const boost::uintmax_t, CellLayer * p_layer);
  virtual void act();
  virtual Color getColor() { return black; }
  virtual std::string classname() { return "HPyloriGroup"; }
private:
  void act(HPyloriState::State, const repast::Point<int> &);

};

#endif
