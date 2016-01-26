#include "CellGroup.h"
#include "compartment/Compartment.h"

CellGroup::CellGroup(CellLayer * p_layer)
 : _dimensions(p_layer->dimensions()), _p_northBorder(NULL), 
   _p_southBorder(NULL), _p_eastBorder(NULL), _p_westBorder(NULL)
{ }

void CellGroup::setBorder(
    const std::string & direction, const CellGroup * border)
{
  if (direction == "N") { _p_northBorder = border; } 
  if (direction == "S") { _p_southBorder = border; } 
  if (direction == "E") { _p_eastBorder = border; } 
  if (direction == "W") { _p_westBorder = border; } 
  else { throw std::invalid_argument("Unknown border direction: " + direction); }
}

void CellGroup::transferStateTo(
    int state, const repast::Point<int> & loc, unsigned int count)
{
  for (unsigned int i = 0; i < count; ++i)
  {
    std::pair<int, int> pair(loc.getX(), loc.getY());
    markedForTransfer[state].push_back(pair);
  }
}

bool CellGroup::isPointInBounds(const repast::Point<int> & pt)
{
  bool ret = false;

  repast::GridDimensions dims = getDimensions();
  double totalWidth = dims.extents().getX();
  int worldSize = repast::RepastProcess::instance()->worldSize();
  double inBoundWidth = totalWidth / worldSize; 

  double oriX = dims.origin().getX();
  int rank = repast::RepastProcess::instance()->rank();
  double xBoundEnd = oriX + (inBoundWidth * (rank + 1)); 
  double xBoundStart = xBoundEnd - inBoundWidth; 

  double ptX = pt.getX();
  if ( (ptX >= xBoundStart) && (ptX <= xBoundEnd) ) ret = true;

  return ret;
}

const repast::GridDimensions & CellGroup::getDimensions() const
{ 
  return _dimensions;
}

std::vector<double> CellGroup::randomMove(
    const double & speed, const repast::Point<int> & fromPt) 
{
  double fullCircle = 2 * 3.14; // in radians
  double angle = 
    repast::Random::instance()->createUniDoubleGenerator(0, fullCircle).next();
  double radius = 
    repast::Random::instance()->createUniDoubleGenerator(0, speed).next();

  std::vector<double> moveTo;
  moveTo.push_back( fromPt.getX() + radius * cos(angle) );
  moveTo.push_back( fromPt.getY() + radius * sin(angle) );

  return moveTo;
}

