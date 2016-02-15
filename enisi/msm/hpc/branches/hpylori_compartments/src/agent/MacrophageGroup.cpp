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

    addCellAt(MacrophageState::BASE, newLoc);
  }
}

void MacrophageGroup::act() { }
