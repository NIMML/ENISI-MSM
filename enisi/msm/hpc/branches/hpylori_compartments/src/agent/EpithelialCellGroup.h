#ifndef ENISI_EpithelialCellGroup
#define ENISI_EpithelialCellGroup

#include "BacteriaGroup.h"
#include "CoordMap.h"

namespace ENISI {

class EpithelialCellState
{
public:
  enum State { IMMATURE, EFFECTOR, TOLEROGENIC, DEAD, KEEP_AT_END};
};

class EpithelialCellGroup: public CoordinateMap<EpithelialCellState::KEEP_AT_END>
{
public:

  EpithelialCellGroup(const boost::uintmax_t, Compartment * pCompartment);

  virtual void act();

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "EpithelialCellGroup"; }

private:
  void act(EpithelialCellState::State, const repast::Point<int> &);

  const std::vector<const BacteriaGroup::StateCount *> 
    getNeighbors(const repast::Point<int> &);
};

} // namespace ENISI
#endif // ENISI_EpithelialCellGroup
