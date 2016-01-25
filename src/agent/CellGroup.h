#ifndef ENISI_MSM_AGENT_CELLGROUP_H
#define ENISI_MSM_AGENT_CELLGROUP_H

#include "MobileAgent.h"

class CellGroup : public ENISIAgent
{
public:
  typedef repast::SharedContext<ENISIAgent> Context;
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  CellGroup(CellLayer * p_layer);

  const Transfers & getTransfers() { return markedForTransfer; }
  void clearTransfers() { markedForTransfer = Transfers(); }
  void setTransfers(const Transfers & newTransfers) 
  { 
    markedForTransfer = newTransfers; 
  }

  bool isPointInBounds(const repast::Point<int> &);


protected:
  std::vector<double> randomMove(const double &, const repast::Point<int> &);
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);
  const repast::GridDimensions & getDimensions() const;

private:
  Transfers markedForTransfer;
  const repast::GridDimensions _dimensions;
};

class TransferGroup : public CellGroup
{
public:
  TransferGroup(CellLayer * p_layer) 
    : CellGroup(p_layer) { }
  virtual void act() { }
  virtual std::string classname() { return "TransferGroup"; }
private:
};

#endif
