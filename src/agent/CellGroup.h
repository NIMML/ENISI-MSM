#ifndef ENISI_MSM_AGENT_CELLGROUP_H
#define ENISI_MSM_AGENT_CELLGROUP_H

#include "ENISIAgent.h"
#include "compartment/CellLayer.h"

class CellGroupImpl;

class CellGroup : public ENISIAgent
{
public:
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  ~CellGroup();
  CellGroup(CellLayer *);

  const Transfers & getTransfers();
  void clearTransfers();
  void setTransfers(const Transfers &);

  bool isPointInBounds(const repast::Point<int> &);

  const repast::GridDimensions & getDimensions() const;
protected:
  bool moveCellAcrossBorder(int, const repast::Point<int> &);

  std::vector<double> randomMove(const double &, const repast::Point<int> &);
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);

private:
  CellGroupImpl * _p_impl;
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
