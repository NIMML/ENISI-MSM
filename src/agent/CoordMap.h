#ifndef ENISI_MSM_AGENT_COORDMAP_H
#define ENISI_MSM_AGENT_COORDMAP_H

#include "CellGroup.h"

template <size_t N>
class CoordinateMap : public CellGroup
{
public:
  CoordinateMap(CellLayer * p_layer) 
    : CellGroup(p_layer), 
      _dimensions(p_layer->dimensions()), _borders(_dimensions), 
      _oriX(_dimensions.origin().getX()), _oriY(_dimensions.origin().getY()),
      _extentX(_dimensions.extents().getX()), 
      _extentY(_dimensions.extents().getY()),
      _endX(_oriX + _extentX), _endY(_oriY + _extentY),
      _p_northBorder(NULL), _p_southBorder(NULL), _p_eastBorder(NULL), 
      _p_westBorder(NULL) 
  { }

  struct StateCount 
  { 
    unsigned int state[N]; 
    StateCount() : state() { }
  };

  typedef std::map<repast::Point<int>, StateCount > CoordMap;

  bool addCellAt(int cell, const repast::Point<int> & pt) 
  { 
    std::vector<int> vectorPt(2);
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

  void setBorder(const std::string &, const CoordinateMap *);

  const repast::GridDimensions & getDimensions() const
  { 
    return _dimensions;
  }
protected:
  bool moveCellAcrossBorder(int, const repast::Point<int> &);

private:
  const repast::GridDimensions _dimensions;
  repast::StickyBorders _borders;
  const int _oriX, _oriY, _extentX, _extentY, _endX, _endY;
  CoordMap _coordMap;

  const CoordinateMap * _p_northBorder;
  const CoordinateMap * _p_southBorder;
  const CoordinateMap * _p_eastBorder;
  const CoordinateMap * _p_westBorder;
};

template <size_t N>
void CoordinateMap<N>::setBorder(
    const std::string & direction, const CoordinateMap * p_border)
{
  if (direction == "N") 
  { 
    _p_northBorder = p_border; 
  } 
  else if (direction == "S") 
  { 
    _p_southBorder = p_border; 
  } 
  else if (direction == "E") 
  { 
    _p_eastBorder = p_border; 
  } 
  else if (direction == "W") 
  { 
    _p_westBorder = p_border; 
  } 

  else { throw std::invalid_argument("Unknown border direction: " + direction); }
}

template <size_t N>
bool CoordinateMap<N>::moveCellAcrossBorder(
    int cellState __attribute__((unused)), 
    const repast::Point<int> & pt __attribute__((unused))
  )
{ 
  int ptX = pt[0]; int ptY = pt[1];

  bool xEastOfBounds = (ptX >= _endX);
  bool xWestOfBounds = (ptX <= _oriX);
  bool xInBounds = (ptX > _oriX && ptX < _endX);

  bool yNorthOfBounds = (ptY <= _oriY);
  bool ySouthOfBounds = (ptY >= _endY);
  bool yInBounds = (ptY > _oriY && ptY < _endY);

  if (xInBounds && yNorthOfBounds /*&& _p_northBorder != NULL*/) 
  { 
/*    const repast::GridDimensions & borderDims  = _p_northBorder->getDimensions();*/
    //int borderOriginX = borderDims.origin().getX();
    //int borderOriginY = borderDims.origin().getY();
    //int borderExtentX = borderDims.extents().getX();
    //int borderExtentY = borderDims.extents().getY();
    //int newX = (pt.getX() % borderExtentX) + borderOriginX;
    //int newY = (pt.getY() % borderExtentY) + borderOriginY;
    //repast::Point<int> newPt(newX, newY);
    /*return _p_northBorder->addCellAt(cellState, newPt); */
    return "N";
  }
  else if (xInBounds && ySouthOfBounds) { return "S"; }
  else if (xEastOfBounds && yInBounds)  { return "E"; }
  else if (xWestOfBounds && yInBounds)  { return "W"; }

  else if (xWestOfBounds && yNorthOfBounds)  { return "NW"; }
  else if (xEastOfBounds && yNorthOfBounds)  { return "NE"; }
  else if (xWestOfBounds && ySouthOfBounds)  { return "SW"; }
  else if (xEastOfBounds && ySouthOfBounds)  { return "SE"; }

  else { throw std::invalid_argument("Point not out of bounds"); }

  return true; 
}

#endif
