#ifndef ENISI_MSM_AGENT_CELLGROUPIMPL_H
#define ENISI_MSM_AGENT_CELLGROUPIMPL_H

#include "compartment/CellLayer.h"

class CellGroup;

typedef std::map<repast::Point<int>, std::vector<int> > CoordMap;

class CellGroupImpl
{
public:
  typedef repast::SharedContext<ENISIAgent> Context;
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  CellGroupImpl(CellLayer * p_layer, int);

  const Transfers & getTransfers();
  void clearTransfers();
  void setTransfers(const Transfers & newTransfers);

  bool isPointInBounds(const repast::Point<int> &);

  void setBorder(const std::string &, const CellGroup *);

  std::vector<double> randomMove(const double &, const repast::Point<int> &);
  void transferStateTo(int, const repast::Point<int> &, unsigned int = 1);
  const repast::GridDimensions & getDimensions() const;

  void moveCellFromTo(int, const repast::Point<int> &, 
                           const repast::Point<int> &);

  void addCellAt(int, const repast::Point<int> &);
  void delCellAt(int, const repast::Point<int> &);
  const std::vector<int> * getCellsAt(const repast::Point<int> &);

  CoordMap::const_iterator coordMapBegin() { return _coordMap.begin(); }
  CoordMap::const_iterator coordMapEnd() { return _coordMap.end(); }

private:
  int _cellStateCount;
  CoordMap _coordMap;

  Transfers _markedForTransfer;
  const repast::GridDimensions _dimensions;

  const CellGroup * _p_northBorder;
  const CellGroup * _p_southBorder;
  const CellGroup * _p_eastBorder;
  const CellGroup * _p_westBorder;
};

#endif
