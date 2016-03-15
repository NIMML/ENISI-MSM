#ifndef DIFFUSERIMPL_H_
#define DIFFUSERIMPL_H_

#include "Point.h"
#include "GridComponents.h" /* repast::StickyBorders  */
#include <stdexcept>
#include <vector>

namespace ENISI {


class DiffuserImpl 
{
public:
  typedef repast::Point<int> Coords;
  typedef std::vector<double> vec1d;
  typedef std::vector<vec1d> vec2d;
  typedef std::vector<vec2d> vec3d;

  static const double 
    DEFAULT_MAX, DEFAULT_MIN, 
    DEFAULT_EVAP_CONST, DEFAULT_DIFF_CONST;

  /**
   * Constructs this with the specified evaporation constant, diffusion
   * constant, and toroidal'ness.
   * 
   * @param valueLayer
   *          the layer this will be diffusing values on
   * @param evaporationConst
   *          the constant used for evaporating values off the layer
   * @param diffusionConst
   *          the constant used for diffusing values on the layer
   * @param toroidal
   *          if this should act as though the edges of the layer are connected
   */
  DiffuserImpl(const repast::GridDimensions, 
	   double e = DEFAULT_EVAP_CONST, 
	   double d = DEFAULT_DIFF_CONST, 
	   bool t = true); 
  ~DiffuserImpl();

  void diffuse();

  double getDiffusionConst() { return diffusionConst; }
  void   setDiffusionConst(double d) { diffusionConst = d; }

  double getEvaporationConst() { return evaporationConst; }
  void   setEvaporationConst(double e) { evaporationConst = e; }

  void setDimensions(const repast::GridDimensions &);
  const repast::GridDimensions & getDimensions() const;

  std::vector<repast::Point<int> > getGridCoordsAssignedToRank(int);

  void setGridPointsToCalculate(const std::vector<repast::Point<int> > &);

  void setValueAtCoord(double, const Coords &);
  double getCoordValue(const Coords &);

  void setValuesAtCoords(std::vector<double> &, std::vector<repast::Point<int> >);

  std::vector<double> getAssignedGridValues();

  double ** getGrid() { return _p_computed2dVals; }
  void setGrid(double ** newGrid) { _p_computed2dVals = newGrid; }
protected:

  bool inBounds(Coords);

  double constrainByMinMax(double);

  Coords vectorToPointCoordinates(const std::vector<int>&);

  void computeVals();

  double ** compute2dValues();
  void computeSpecific2dGridCoords();
  void computeAll2dGridCoords();
  double compute2dValueAtCoord(int, int);

private:

  vec3d _computed3dVals;

  double * _p_computed1dVals;

  double ** _p_temp2dVals;
  double ** _p_computed2dVals;

  double maxValue, _minValue, evaporationConst, diffusionConst;

  bool toroidal;

  repast::GridDimensions _dimensions;

  int _width; int _height;

  static const long serialVersionUID;

  repast::StickyBorders _borders;

  double compute3dVal(int, int, int);

  std::vector<repast::Point<int> > _gridPointsToDiffuse;
};

} // namespace ENISI

#endif
