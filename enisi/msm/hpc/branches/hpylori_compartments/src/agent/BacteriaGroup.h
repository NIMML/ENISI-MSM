#ifndef ENISI_MSM_BACTERIA_COMPONENT_H
#define ENISI_MSM_BACTERIA_COMPONENT_H

#include "AgentStates.h"
#include "CoordMap.h"

namespace ENISI
{

class BacteriaGroup: public CoordinateMap<BacteriaState::KEEP_AT_END>
{
public:
  BacteriaGroup(const boost::uintmax_t, Compartment * pCompartment);

  virtual void act();

  const std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >
  getTcellNeighbors(const repast::Point<int> &);

  virtual Color getColor() {return black;}
  virtual std::string classname() {return "BacteriaGroup";}

private:
  void act(BacteriaState::State, const repast::Point<int> &);
  void init(const boost::uintmax_t);
};
} // namespace ENISI
#endif
