#include "CellGroup.h"
#include "compartment/Compartment.h"

using namespace ENISI;

CellGroup::~CellGroup()
{}

CellGroup::CellGroup(Compartment * pCompartment) :
  mpCompartment(pCompartment),
  mMarkedForTransfer()
{}

const CellGroup::Transfers & CellGroup::getTransfers()
{
  return mMarkedForTransfer;
}

void CellGroup::clearTransfers()
{
  mMarkedForTransfer.clear();
}

void CellGroup::setTransfers(const CellGroup::Transfers & newTransfers)
{
  mMarkedForTransfer = newTransfers;
}

std::vector<double> CellGroup::randomMove(const double & speed,
                                          const repast::Point<int> & fromPt)
{
  double fullCircle = 2 * 3.14; // in radians
  double angle =
    repast::Random::instance()->createUniDoubleGenerator(0, fullCircle).next();
  double radius =
    repast::Random::instance()->createUniDoubleGenerator(0, speed).next();

  std::vector<double> moveTo;
  moveTo.push_back(fromPt.getX() + radius * cos(angle));
  moveTo.push_back(fromPt.getY() + radius * sin(angle));

  return moveTo;
}

void CellGroup::transferStateTo(int state,
                                const repast::Point<int> & loc,
                                unsigned int count)
{
  std::pair<int, int> Location(loc.getX(), loc.getY());

  for (unsigned int i = 0; i < count; ++i)
    {
      mMarkedForTransfer[state].push_back(Location);
    }
}

TransferGroup::TransferGroup(Compartment * pCompartment) :
  CellGroup(pCompartment)
{}

// virtual
void TransferGroup::act() {}

// virtual
std::string TransferGroup::classname()
{
  return "TransferGroup";
}
