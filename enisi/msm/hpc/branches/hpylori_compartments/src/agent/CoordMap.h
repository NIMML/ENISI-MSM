#ifndef ENISI_MSM_AGENT_COORDMAP_H
#define ENISI_MSM_AGENT_COORDMAP_H

template <size_t N>
class CoordinateMap
{
public:
  struct StateCount 
  { 
    unsigned int state[N]; 
    StateCount() : state() { }
  };

  typedef std::map<repast::Point<int>, StateCount > CoordMap;

  void addCellAt(int cell, const repast::Point<int> & pt)
  { _coordMap[pt].state[cell]++; }

  void delCellAt(int cell, const repast::Point<int> & pt)
  { _coordMap[pt].state[cell]--; }

  const StateCount * getCellsAt(const repast::Point<int> pt) 
  { return &_coordMap[pt]; }

  typename CoordMap::const_iterator coordMapBegin() { return _coordMap.begin(); }
  typename CoordMap::const_iterator coordMapEnd() { return _coordMap.end(); }

private:
  CoordMap _coordMap;
};
#endif
