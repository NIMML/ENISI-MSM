#include "CellGroup.h"
#include "CellGroupImpl.h"

CellGroup::~CellGroup() { delete _p_impl; }

CellGroup::CellGroup(CellLayer * p_layer)
  : _p_impl(new CellGroupImpl(p_layer)) { }

const CellGroup::Transfers & CellGroup::getTransfers() { return _p_impl->getTransfers(); }

void CellGroup::clearTransfers() { _p_impl->clearTransfers(); }

void CellGroup::setTransfers(const CellGroup::Transfers & newTransfers) 
{ 
  _p_impl->setTransfers(newTransfers);
}

bool CellGroup::isPointInBounds(const repast::Point<int> & pt) 
{ return _p_impl->isPointInBounds(pt); }

void CellGroup::setBorder(
    const std::string & direction, const CellGroup * p_border) 
{ _p_impl->setBorder(direction, p_border); }

std::vector<double> CellGroup::randomMove(
    const double & speed, const repast::Point<int> & fromPt) 
{ return _p_impl->randomMove(speed, fromPt); }

void CellGroup::transferStateTo(
    int state, const repast::Point<int> & loc, unsigned int count)
{ _p_impl->transferStateTo(state, loc, count); }

const repast::GridDimensions & CellGroup::getDimensions() const 
{ return _p_impl->getDimensions(); }

/* CellGroupImpl */
CellGroupImpl::CellGroupImpl(CellLayer * p_layer)
 : _dimensions(p_layer->dimensions()), _p_northBorder(NULL), 
   _p_southBorder(NULL), _p_eastBorder(NULL), _p_westBorder(NULL) { }

const CellGroup::Transfers & CellGroupImpl::getTransfers() 
{ return _markedForTransfer; }

void CellGroupImpl::clearTransfers() 
{ _markedForTransfer = CellGroup::Transfers(); }

void CellGroupImpl::setTransfers(const CellGroup::Transfers & newTransfers) 
{ 
  _markedForTransfer = newTransfers; 
}

void CellGroupImpl::setBorder(
    const std::string & direction, const CellGroup * p_border)
{
  if (direction == "N") 
  { 
    _p_northBorder = p_border; 
  } 
  else if (direction == "S") 
  { 
    _p_southBorder = p_border; 
  } 
  else if (direction == "E") 
  { 
    _p_eastBorder = p_border; 
  } 
  else if (direction == "W") 
  { 
    _p_westBorder = p_border; 
  } 

  else { throw std::invalid_argument("Unknown border direction: " + direction); }
}

void CellGroupImpl::transferStateTo(
    int state, const repast::Point<int> & loc, unsigned int count)
{
  for (unsigned int i = 0; i < count; ++i)
  {
    std::pair<int, int> pair(loc.getX(), loc.getY());
    _markedForTransfer[state].push_back(pair);
  }
}

bool CellGroupImpl::isPointInBounds(const repast::Point<int> & pt)
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

const repast::GridDimensions & CellGroupImpl::getDimensions() const
{ 
  return _dimensions;
}

std::vector<double> CellGroupImpl::randomMove(
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
