#include "BacteriaGroup.h"

BacteriaGroup::BacteriaGroup(
    const boost::uintmax_t bacteriaCount, CellLayer * p_layer)
  : CellGroup(p_layer)
{
  init(bacteriaCount);
}

void BacteriaGroup::init(const boost::uintmax_t bacteriaCount)
{
  for (boost::uintmax_t i = 0; i < bacteriaCount; i++) 
  {
    BacteriaGroup::State state = INFECTIOUS;
    if (i >= bacteriaCount/2) { state = TOLEGENIC; } 

    const repast::GridDimensions & dimensions = getDimensions();
    repast::Point<double> extents = dimensions.extents();
    repast::Point<double> origin = dimensions.origin();

    double xStart = origin.getX();
    double yStart = origin.getY();

    double xEnd = origin.getX() + extents.getX();
    double yEnd = origin.getY() + extents.getY();

    double xCoord = repast::Random::instance()
      ->createUniDoubleGenerator(xStart, xEnd).next();

    double yCoord = repast::Random::instance()
      ->createUniDoubleGenerator(yStart, yEnd).next();

    repast::Point<int> initialLoc(xCoord, yCoord);

    std::vector<double> moveTo = randomMove(1, initialLoc);
    repast::Point<int> newLoc(moveTo[0], moveTo[1]);

    addCellAt(state, newLoc);
  }

  BacteriaGroup::instances().push_back(this);
}

void BacteriaGroup::act()
{
  typedef CoordMap::const_iterator it_type;
  it_type end = coordMapEnd();

  for(it_type it = coordMapBegin(); it != end; it++) 
  {
    repast::Point<int> loc = it->first;
    StateCount stateCount  = it->second;

    for (unsigned int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      State state = static_cast<State>(i);
      for (unsigned int j = 0; j < stateCount.state[i]; ++j)
      {
	act(state, loc);
      }
    }
  }
}

void BacteriaGroup::act(State state, const repast::Point<int> & loc)
{
  if (state == DEAD) return;

  const std::vector< const TcellGroup::StateCount *> 
    neighborList = getTcellNeighbors(loc);

  std::vector< const TcellGroup::StateCount *>::const_iterator iter 
    = neighborList.begin();

  while ( iter != neighborList.end() )
  {
    const TcellGroup::StateCount * p_tcellCount = *iter;

    unsigned int th1Count = p_tcellCount->state[TcellState::TH1];
    unsigned int th17Count = p_tcellCount->state[TcellState::TH17];

    if ( (th1Count || th17Count) && (state == INFECTIOUS) )
    {
      delCellAt(state, loc);
      addCellAt(DEAD, loc);
      return;
    }
    ++iter;
  }
  
  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(state, newLoc);
}

const std::vector< const TcellGroup::StateCount *>
BacteriaGroup::getTcellNeighbors(const repast::Point<int> & loc)
{
  std::vector<TcellGroup *> & instances = TcellGroup::instances();

  std::vector< const TcellGroup::StateCount *> allNeighbors;

  for (size_t i = 0; i < instances.size(); ++i)
  {
    const TcellGroup::StateCount * p_neighbors = instances[i]->getCellsAt(loc);
    allNeighbors.push_back(p_neighbors);
  }

  return allNeighbors;
}
