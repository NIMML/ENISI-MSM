#include "MacrophageGroup.h"

MacrophageGroup::MacrophageGroup(
    const boost::uintmax_t macrophageCount, CellLayer * p_layer)
  : CoordinateMap(p_layer)
{
  for (boost::uintmax_t i = 0; i < macrophageCount; i++) 
  {
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

    addCellAt(MacrophageState::MONOCYTE, newLoc);
  }
}

void MacrophageGroup::act() 
{ 
  coordMapConstIter end = coordMapEnd();

  for(coordMapConstIter it = coordMapBegin(); it != end; it++) 
  {
    repast::Point<int> loc = it->first;
    const StateCount count = it->second;

    for (unsigned int i = 0; i < MacrophageState::KEEP_AT_END; ++i)
    {
      for (unsigned int j = 0; j < count.state[i]; ++j)
      {
	MacrophageState::State state = static_cast<MacrophageState::State>(i);
	act(state, loc);
      }
    }
  }
}

void MacrophageGroup::act(
    MacrophageState::State state, const repast::Point<int> & loc __attribute__((unused)))
{
  if (state == MacrophageState::DEAD) return;

  MacrophageState::State newState = state;
  /* //If monocytes + hp //then new state -> m_reg 
  if (state == MacrophageState::MONOCYTE)
  {
    if (hPyloriCount || tolBCount) { newState = MacrophageState::REGULATORY; }
  }
  */
  //If monocytes + TolB 
    //then new state -> m_reg-

  
  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(newState, newLoc);
}

