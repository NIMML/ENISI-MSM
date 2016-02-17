#ifndef ENISI_MSM_BACTERIA_COMPONENT_H
#define ENISI_MSM_BACTERIA_COMPONENT_H

#include "Bacteria.h"
#include "TcellGroup.h"
#include "Properties.h"
#include "CoordMap.h"

namespace BacteriaState {
  enum State { DEAD, INFECTIOUS, TOLEGENIC, KEEP_LAST};
}

class BacteriaGroup: public CoordinateMap<BacteriaState::KEEP_LAST> 
{
public:
  BacteriaGroup(const boost::uintmax_t, CellLayer * p_layer);

  virtual void act();

  const std::vector< const TcellGroup::StateCount *> 
    getTcellNeighbors(const repast::Point<int> &);

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "BacteriaGroup"; }

private:
  void act(BacteriaState::State, const repast::Point<int> &);
  void init(const boost::uintmax_t);
};

#endif
