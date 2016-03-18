#ifndef ENISI_MSM_AGENT_CELLGROUPIMPL_H
#define ENISI_MSM_AGENT_CELLGROUPIMPL_H

#include "compartment/CellLayer.h"

namespace ENISI
{

class CellGroup;

class CellGroupImpl
{
public:
  typedef repast::SharedContext<Agent> Context;
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  CellGroupImpl(CellLayer * p_layer);

  const Transfers & getTransfers();
  void clearTransfers();
  void setTransfers(const Transfers & newTransfers);

  std::vector<double> randomMove(const double &, const repast::Point<int> &);
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);

private:
  Transfers _markedForTransfer;
};
} // namespace ENISI

#endif
