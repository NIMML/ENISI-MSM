#ifndef ENISI_MSM_AGENT_COORDMAP_H
#define ENISI_MSM_AGENT_COORDMAP_H

#include "compartment/Compartment.h"
#include "CellGroup.h"
#include "repast_hpc/GridComponents.h" /* repast::StickyBorders */
#include "grid/Borders.h"

namespace ENISI
{

template <size_t N>
class CoordinateMap : public CellGroup
{
public:
  struct Concentration
  {
    unsigned int state[N];

    Concentration() :
      state()
    {}
  };

  typedef std::map<repast::Point<int>, Concentration > CoordMap;

  CoordinateMap(Compartment * pCompartment) :
    CellGroup(pCompartment),
    _dimensions(pCompartment->localSpaceDimensions()),
    _borders(pCompartment->spaceBorders()),
    _coordMap()
  {}

  bool addCellAt(int cellState, const repast::Point<int> & pt)
  {
    std::vector<int> vectorPt = pt.coords();

    _borders->transform(vectorPt, vectorPt);

    std::vector< Borders::BoundState > State(_dimensions.dimensionCount());

    if (_borders->boundsCheck(pt.coords(), &State))
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

  const Concentration * getCellsAt(const repast::Point<int> pt)
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
    size_t i = Borders::X;
    std::vector<int> Out(_dimensions.dimensionCount());

#ifdef XXXX
    std::vector<Borders::BoundState>::const_iterator itState = State.begin();
    std::vector<Borders::BoundState>::const_iterator endState = State.end();
    std::vector<int>::const_iterator itIn = pt.begin();
    std::vector<int>::iterator itOut = Out.begin();

    CoordinateMap * pTarget = NULL;

    for (; itState != endState; ++itState, ++itIn, ++itOut, ++i)
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
                  throw std::runtime_error("No adjacent Compartment");
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
                  throw std::runtime_error("No adjacent Compartment");
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

#endif // XXXX

    return addCellAt(cellState, Out);
  }

private:
  const repast::GridDimensions _dimensions;
  const Borders  * _borders;
  CoordMap _coordMap;
};
} // namespace ENISI
#endif
