#ifndef ENISI_MSM_AGENT_COORDMAP_H
#define ENISI_MSM_AGENT_COORDMAP_H

#include "CellGroup.h"

template <size_t N>
class CoordinateMap : public CellGroup
{
public:
  CoordinateMap(CellLayer * p_layer) 
    : CellGroup(p_layer), _borders(p_layer->dimensions()) { }

  struct StateCount 
  { 
    unsigned int state[N]; 
    StateCount() : state() { }
  };

  typedef std::map<repast::Point<int>, StateCount > CoordMap;

  bool addCellAt(int cell, const repast::Point<int> & pt) 
  { 
    std::vector<int> vectorPt(2);;
    vectorPt[0] = pt.getX(); vectorPt[1] = pt.getY();

    try { _borders.transform(vectorPt, vectorPt); } 
    catch(const std::exception&) { return false; }

    _coordMap[pt].state[cell]++; 
    return true;
  }

  void delCellAt(int cell, const repast::Point<int> & pt)
  { _coordMap[pt].state[cell]--; }

  const StateCount * getCellsAt(const repast::Point<int> pt) 
  { return &_coordMap[pt]; }

  typename CoordMap::const_iterator coordMapBegin() { return _coordMap.begin(); }
  typename CoordMap::const_iterator coordMapEnd() { return _coordMap.end(); }

private:
  repast::StickyBorders _borders;
  CoordMap _coordMap;
};
#endif
