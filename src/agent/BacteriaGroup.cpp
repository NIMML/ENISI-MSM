#include "BacteriaGroup.h"

BacteriaGroup::BacteriaGroup(
    const boost::uintmax_t bacteriaCount, CellLayer * p_layer)
  : CoordinateMap(p_layer)
{
  init(bacteriaCount);
}

void BacteriaGroup::init(const boost::uintmax_t bacteriaCount)
{
  for (boost::uintmax_t i = 0; i < bacteriaCount; i++) 
  {
    BacteriaState::State state = BacteriaState::INFECTIOUS;
    if (i >= bacteriaCount/2) { state = BacteriaState::TOLEGENIC; } 

    const repast::GridDimensions * p_dimensions = getDimensions();
    repast::Point<double> extents = p_dimensions->extents();
    repast::Point<double> origin = p_dimensions->origin();

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
  coordMapConstIter end = coordMapEnd();

  for(coordMapConstIter it = coordMapBegin(); it != end; it++) 
  {
    repast::Point<int> loc = it->first;
    StateCount stateCount  = it->second;

    for (unsigned int i = 0; i < BacteriaState::KEEP_LAST; ++i)
    {
      BacteriaState::State state = static_cast<BacteriaState::State>(i);
      for (unsigned int j = 0; j < stateCount.state[i]; ++j)
      {
	act(state, loc);
      }
    }
  }
}

void BacteriaGroup::act(
    BacteriaState::State state, const repast::Point<int> & loc)
{
  if (state == BacteriaState::DEAD) return;

  const std::vector< const TcellGroup::StateCount *> 
    neighborList = getTcellNeighbors(loc);

  std::vector< const TcellGroup::StateCount *>::const_iterator iter 
    = neighborList.begin();

  while ( iter != neighborList.end() )
  {
    const TcellGroup::StateCount * p_tcellCount = *iter;

    unsigned int th1Count = p_tcellCount->state[TcellState::TH1];
    unsigned int th17Count = p_tcellCount->state[TcellState::TH17];

    if ( (th1Count || th17Count) && (state == BacteriaState::INFECTIOUS) )
    {
      delCellAt(state, loc);
      addCellAt(BacteriaState::DEAD, loc);
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
BacteriaGroup::getTcellNeighbors(const repast::Point<int> & loc __attribute__((unused)))
{
  std::vector<TcellGroup *> & instances __attribute__((unused)) = TcellGroup::instances();

  std::vector< const TcellGroup::StateCount *> allNeighbors;

  std::vector<ENISIAgent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
  {
    if (agents[i]->classname() == "TcellGroup") 
    {
      /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
       * agents only */
      TcellGroup * p_tcellGroup = static_cast<TcellGroup *>(agents[i]);
      allNeighbors.push_back(p_tcellGroup->getCellsAt(loc));
    }
  }

  return allNeighbors;
}
