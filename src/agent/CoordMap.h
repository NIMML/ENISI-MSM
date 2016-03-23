#ifndef ENISI_MSM_AGENT_COORDMAP_H
#define ENISI_MSM_AGENT_COORDMAP_H

#include "compartment/Compartment.h"
#include "compartment/CellLayer.h"
#include "CellGroup.h"
#include "repast_hpc/GridComponents.h" /* repast::StickyBorders */
#include "grid/Borders.h"

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
    _borders(_p_layer->dimensions()),
    _coordMap(),
    mLeftBorders(_p_layer->dimensions().dimensionCount()),
    mRightBorders(_p_layer->dimensions().dimensionCount())
  {}

  bool addCellAt(int cellState, const repast::Point<int> & pt)
  {
    std::vector<int> vectorPt = pt.coords();

    _borders.transform(vectorPt, vectorPt);

    std::vector< Borders::BoundState > State(_dimensions.dimensionCount());

    if (_borders.boundsCheck(pt.coords(), &State))
      {
        _coordMap[pt].state[cellState]++;
        return true;
      }

    return moveCellAcrossBorder(cellState, pt, State);
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

  void setLeftBorder(const size_t & i, const Borders::Type & type, CoordinateMap * p_border)
  {
    _borders.setLowBorderType(i, type);
    mLeftBorders[i] = p_border;
  }

  void setRightBorder(const size_t & i, const Borders::Type & type, CoordinateMap * p_border)
  {
    _borders.setHighBorderType(i, type);
    mRightBorders[i] = p_border;
  }

  const repast::GridDimensions * getDimensions() const
  {
    return &_dimensions;
  }

protected:
  typedef typename CoordMap::const_iterator coordMapConstIter;

  bool moveCellAcrossBorder(int cellState,
                            const repast::Point<int> & pt,
                            const std::vector< Borders::BoundState > & State)
  {
    size_t i = 0;
    std::vector<int> Out(_dimensions.dimensionCount());

    std::vector<Borders::BoundState>::const_iterator itState = State.begin();
    std::vector<Borders::BoundState>::const_iterator endState = State.end();
    typename std::vector< CoordinateMap * >::iterator itLeftBorder = mLeftBorders.begin();
    typename std::vector< CoordinateMap * >::iterator itRightBorder = mRightBorders.begin();
    std::vector<int>::const_iterator itIn = pt.begin();
    std::vector<int>::iterator itOut = Out.begin();

    CoordinateMap * pTarget = NULL;

    for (; itState != endState; ++itState, ++itIn, ++itOut, ++itLeftBorder, ++itRightBorder, i++)
      {
        if (pTarget != NULL)
          {
            *itOut = *itIn;
            continue;
          }

        switch (*itState)
          {
            case Borders::OUT_LOW:
              if (*itLeftBorder != NULL)
                {
                  pTarget = *itLeftBorder;
                  const repast::GridDimensions * pDimensions = pTarget->getDimensions();
                  *itOut = pDimensions->origin(i) + pDimensions->extents(i) + *itIn - _dimensions.origin(i);
                }
              else
                {
                  throw std::invalid_argument("No adjacent Compartment");
                }

              break;

            case Borders::OUT_HIGH:
              if (*itRightBorder != NULL)
                {
                  pTarget = *itRightBorder;
                  const repast::GridDimensions * pDimensions = pTarget->getDimensions();
                  *itOut = pDimensions->origin(i) + *itIn - _dimensions.origin(i) - _dimensions.extents(i);
                }
              else
                {
                  throw std::invalid_argument("No adjacent Compartment");
                }

              break;

            case Borders::INBOUND:
              *itOut = *itIn;
              break;
          }
      }

    if (pTarget != NULL)
      {
        return pTarget->addCellAt(cellState, Out);
      }

    return addCellAt(cellState, Out);
  }

  CellLayer * layer() {return _p_layer;}

private:
  CellLayer * _p_layer;
  const repast::GridDimensions _dimensions;
  Borders _borders;
  CoordMap _coordMap;

  std::vector< CoordinateMap * > mLeftBorders;
  std::vector< CoordinateMap * > mRightBorders;
};
} // namespace ENISI
#endif
