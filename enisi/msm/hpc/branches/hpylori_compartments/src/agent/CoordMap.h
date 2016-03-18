#ifndef ENISI_MSM_AGENT_COORDMAP_H
#define ENISI_MSM_AGENT_COORDMAP_H

#include "compartment/Compartment.h"
#include "compartment/CellLayer.h"
#include "CellGroup.h"
#include "GridComponents.h" /* repast::StickyBorders */

namespace ENISI
{

template <size_t N>
class CoordinateMap : public CellGroup
{
public:
  struct StateCount
  {
    unsigned int state[N];

    StateCount() :
      state()
    {}
  };

  typedef std::map<repast::Point<int>, StateCount > CoordMap;

  CoordinateMap(Compartment * pCompartment) :
    CellGroup(pCompartment),
    _p_layer(pCompartment->cellLayer()),
    _dimensions(_p_layer->dimensions()),
    _borders(_dimensions),
    _oriX(_dimensions.origin().getX()),
    _oriY(_dimensions.origin().getY()),
    _extentX(_dimensions.extents().getX()),
    _extentY(_dimensions.extents().getY()),
    _endX(_oriX + _extentX - 1),
    _endY(_oriY + _extentY - 1),
    _p_northBorder(NULL),
    _p_southBorder(NULL),
    _p_eastBorder(NULL),
    _p_westBorder(NULL)
  {}

  bool addCellAt(int cellState, const repast::Point<int> & pt)
  {
    std::vector<int> vectorPt = pt.coords();

    try
      {
        _borders.transform(vectorPt, vectorPt);
      }

    catch (const std::exception&)
      {
        return moveCellAcrossBorder(cellState, pt);
      }

    _coordMap[pt].state[cellState]++;

    return true;
  }

  void delCellAt(int cell, const repast::Point<int> & pt)
  {
    _coordMap[pt].state[cell]--;
  }

  const StateCount * getCellsAt(const repast::Point<int> pt)
  {
    return &_coordMap[pt];
  }

  typename CoordMap::const_iterator coordMapBegin()
  {
    return _coordMap.begin();
  }

  typename CoordMap::const_iterator coordMapEnd()
  {
    return _coordMap.end();
  }

  void setBorder(const std::string & direction, CoordinateMap * p_border)
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

    else {throw std::invalid_argument("Unknown border direction: " + direction);}
  }

  const repast::GridDimensions * getDimensions() const
  {
    return &_dimensions;
  }

protected:
  typedef typename CoordMap::const_iterator coordMapConstIter;

  bool moveCellAcrossBorder(int cellState, const repast::Point<int> & pt)
  {
    int ptX = pt[0]; int ptY = pt[1];

    bool xEastOfBounds = (ptX > _endX);
    bool xWestOfBounds = (ptX < _oriX);
    bool xInBounds = (ptX >= _oriX && ptX <= _endX);

    bool yNorthOfBounds = (ptY < _oriY);
    bool ySouthOfBounds = (ptY > _endY);
    bool yInBounds = (ptY >= _oriY && ptY <= _endY);

    bool ret = false;

    if (xInBounds && yNorthOfBounds)
      {
        if (_p_northBorder != NULL)
          {
            const repast::GridDimensions * p_borderDims  = _p_northBorder->getDimensions();
            int borderOriginX = p_borderDims->origin().getX();
            int borderOriginY = p_borderDims->origin().getY();
            int borderExtentX = p_borderDims->extents().getX();
            int borderExtentY = p_borderDims->extents().getY();

            int newX = abs(ptX % borderExtentX) + borderOriginX;
            int newY = borderOriginY + borderExtentY - 1;

            repast::Point<int> newPt(newX, newY);
            ret = _p_northBorder->addCellAt(cellState, newPt);
          }
        else
          {
            repast::Point<int> newPt(ptX, _oriY);
            ret = addCellAt(cellState, newPt);
          }
      }
    else if (xInBounds && ySouthOfBounds)
      {
        if (_p_southBorder != NULL)
          {
            const repast::GridDimensions * p_borderDims  = _p_southBorder->getDimensions();
            int borderOriginX = p_borderDims->origin().getX();
            int borderOriginY = p_borderDims->origin().getY();
            int borderExtentX = p_borderDims->extents().getX();

            int newX = abs(ptX % borderExtentX) + borderOriginX;
            int newY = borderOriginY;

            repast::Point<int> newPt(newX, newY);
            ret = _p_southBorder->addCellAt(cellState, newPt);
          }
        else
          {
            repast::Point<int> newPt(ptX, _endY);
            ret = _p_southBorder->addCellAt(cellState, newPt);
          }
      }
    else if (xEastOfBounds && yInBounds)
      {
        if (_p_eastBorder != NULL)
          {
            const repast::GridDimensions * p_borderDims  = _p_eastBorder->getDimensions();
            int borderOriginX = p_borderDims->origin().getX();
            int borderOriginY = p_borderDims->origin().getY();
            int borderExtentY = p_borderDims->extents().getY();

            int newX = borderOriginX;
            int newY = abs(ptY % borderExtentY) + borderOriginY;

            repast::Point<int> newPt(newX, newY);
            ret = _p_eastBorder->addCellAt(cellState, newPt);
          }
        else
          {
            repast::Point<int> newPt(_endX, ptY);
            ret = _p_eastBorder->addCellAt(cellState, newPt);
          }
      }
    else if (xWestOfBounds && yInBounds)
      {
        if (_p_westBorder != NULL)
          {
            const repast::GridDimensions * p_borderDims  = _p_westBorder->getDimensions();
            int borderOriginX = p_borderDims->origin().getX();
            int borderOriginY = p_borderDims->origin().getY();
            int borderExtentX = p_borderDims->extents().getX();
            int borderExtentY = p_borderDims->extents().getY();

            int newX = borderOriginX + borderExtentX - 1;
            int newY = abs(ptY % borderExtentY) + borderOriginY;

            repast::Point<int> newPt(newX, newY);
            ret = _p_westBorder->addCellAt(cellState, newPt);
          }
        else
          {
            repast::Point<int> newPt(_oriX, ptY);
            ret = _p_eastBorder->addCellAt(cellState, newPt);
          }
      }
    else if (xWestOfBounds && yNorthOfBounds)
      {
        repast::Point<int> newPt(_oriX, _oriY);
        ret = addCellAt(cellState, newPt);
      }
    else if (xEastOfBounds && yNorthOfBounds)
      {
        repast::Point<int> newPt(_endX, _oriY);
        ret = addCellAt(cellState, newPt);
      }
    else if (xWestOfBounds && ySouthOfBounds)
      {
        repast::Point<int> newPt(_oriX, _endY);
        ret = addCellAt(cellState, newPt);
      }
    else if (xEastOfBounds && ySouthOfBounds)
      {
        repast::Point<int> newPt(_endX, _endY);
        ret = addCellAt(cellState, newPt);
      }
    else {throw std::invalid_argument("Point not out of bounds");}

    return ret;
  }

  CellLayer * layer() {return _p_layer;}

private:
  CellLayer * _p_layer;
  const repast::GridDimensions _dimensions;
  repast::StickyBorders _borders;
  const int _oriX, _oriY, _extentX, _extentY, _endX, _endY;
  CoordMap _coordMap;

  CoordinateMap * _p_northBorder;
  CoordinateMap * _p_southBorder;
  CoordinateMap * _p_eastBorder;
  CoordinateMap * _p_westBorder;
};
} // namespace ENISI
#endif
