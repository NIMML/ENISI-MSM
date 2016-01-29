#ifndef ENISI_MSM_AGENT_CELLGROUP_H
#define ENISI_MSM_AGENT_CELLGROUP_H

#include "ENISIAgent.h"
#include "compartment/CellLayer.h"

class CellGroupImpl;

class CellGroup : public ENISIAgent
{
public:
  typedef repast::SharedContext<ENISIAgent> Context;
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  ~CellGroup();
  CellGroup(CellLayer *, int = 0);

  const Transfers & getTransfers();
  void clearTransfers();
  void setTransfers(const Transfers &);

  bool isPointInBounds(const repast::Point<int> &);

  void setBorder(const std::string &, const CellGroup *);

  void addCellAt(int, const repast::Point<int> &);
  void delCellAt(int, const repast::Point<int> &);
  const std::vector<int> * getCellsAt(const repast::Point<int> &);

protected:
  std::vector<double> randomMove(const double &, const repast::Point<int> &);
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);
  const repast::GridDimensions & getDimensions() const;

  void moveCellFromTo(int, const repast::Point<int> &, 
                           const repast::Point<int> &);


  typedef std::map<repast::Point<int>, std::vector<int> > CoordMap;
  CoordMap::const_iterator coordMapBegin();
  CoordMap::const_iterator coordMapEnd();

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
