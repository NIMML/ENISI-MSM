#ifndef ENISI_MSM_AGENT_AGENT_GROUP_H
#define ENISI_MSM_AGENT_AGENT_GROUP_H

#include "MobileAgent.h"

class AgentGroup : public ENISIAgent
{
public:
  typedef repast::SharedContext<ENISIAgent> Context;
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  AgentGroup(CellLayer * p_layer);

  const Transfers & getTransfers() { return markedForTransfer; }
  void clearTransfers() { markedForTransfer = Transfers(); }
  void setTransfers(const Transfers & newTransfers) 
  { 
    markedForTransfer = newTransfers; 
  }

  bool isPointInBounds(const repast::Point<int> &);

protected:
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);
  const repast::GridDimensions & getDimensions() const;

private:
  Transfers markedForTransfer;
  const repast::GridDimensions _dimensions;
};

class TransferGroup : public AgentGroup
{
public:
  TransferGroup(CellLayer * p_layer) 
    : AgentGroup(p_layer) { }
  virtual void act() { }
  virtual std::string classname() { return "TransferGroup"; }
private:
};

#endif
