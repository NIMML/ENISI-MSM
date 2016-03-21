#ifndef ENISI_EpithelialCellGroup
#define ENISI_EpithelialCellGroup

#include "AgentStates.h"
#include "CoordMap.h"

namespace ENISI
{

class EpithelialCellGroup: public CoordinateMap<EpithelialCellState::KEEP_AT_END>
{
public:

  EpithelialCellGroup(const boost::uintmax_t, Compartment * pCompartment);

  virtual void act();

  virtual Color getColor() {return black;}
  virtual std::string classname() {return "EpithelialCellGroup";}

private:
  void act(EpithelialCellState::State, const repast::Point<int> &);

  const std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * >
  getNeighbors(const repast::Point<int> &);

  //Added the declaration of getTcellNeighbors function here
  std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >
  getTcellNeighbors(const repast::Point<int> &);
};
} // namespace ENISI
#endif // ENISI_EpithelialCellGroup
