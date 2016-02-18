#include "compartment/CellLayer.h"
#include "CellGroupImpl.h"
#include "CellGroup.h"

CellGroup::~CellGroup() { delete _p_impl; }

CellGroup::CellGroup(CellLayer * p_layer)
  : _p_impl(new CellGroupImpl(p_layer)) { }

const CellGroup::Transfers & CellGroup::getTransfers() { return _p_impl->getTransfers(); }

void CellGroup::clearTransfers() { _p_impl->clearTransfers(); }

void CellGroup::setTransfers(const CellGroup::Transfers & newTransfers) 
{ 
  _p_impl->setTransfers(newTransfers);
}

std::vector<double> CellGroup::randomMove(
    const double & speed, const repast::Point<int> & fromPt) 
{ return _p_impl->randomMove(speed, fromPt); }

void CellGroup::transferStateTo(
    int state, const repast::Point<int> & loc, unsigned int count)
{ _p_impl->transferStateTo(state, loc, count); }

/* CellGroupImpl */
CellGroupImpl::CellGroupImpl(CellLayer * p_layer __attribute__((unused))) { }

const CellGroup::Transfers & CellGroupImpl::getTransfers() 
{ return _markedForTransfer; }

void CellGroupImpl::clearTransfers() 
{ _markedForTransfer = CellGroup::Transfers(); }

void CellGroupImpl::setTransfers(const CellGroup::Transfers & newTransfers) 
{ 
  _markedForTransfer = newTransfers; 
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
