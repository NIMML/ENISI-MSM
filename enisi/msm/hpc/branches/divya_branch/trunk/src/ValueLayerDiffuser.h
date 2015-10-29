#ifndef VALUELAYERDIFFUSER_H_
#define VALUELAYERDIFFUSER_H_

#include <boost/shared_ptr.hpp>
#include "ValueLayer.h"     /* DiscreteValueLayer */
#include "Point.h"
#include "GridComponents.h" /* WrapAroundBorders  */
#include <stdexcept>
#include <vector>
#include <memory> /* std::unique_ptr */



namespace repast {


class ValueLayerDiffuser {

  typedef DiscreteValueLayer<double, WrapAroundBorders>* GridValueLayer;
  typedef Point<int> Coords;
  typedef std::vector<double> vec1d;
  typedef std::vector<vec1d> vec2d;
  typedef std::vector<vec2d> vec3d;

public:
  static const double 
    DEFAULT_MAX, DEFAULT_MIN, 
    DEFAULT_EVAP_CONST, DEFAULT_DIFF_CONST;

  /**
   * Constructs this with the default evaporation and diffusion constants.
   * Before this diffuser can be used, a value layer must be set through the
   * {@link #setValueLayer(GridValueLayer)} method.
   * <p/>
   * 
   * This is the same as
   * <code>new ValueLayer(null, DEFAULT_EVAP_CONST, DEFAULT_DIFF_CONST)</code>
   * 
   * @see #setValueLayer(GridValueLayer)
   */
  ValueLayerDiffuser() {
    ValueLayerDiffuser(NULL, DEFAULT_EVAP_CONST, DEFAULT_DIFF_CONST);
  }

  /* boost:shared_ptr gets cranky if there's no defined copy constructor */
  ValueLayerDiffuser(const ValueLayerDiffuser&) { }

  /**
   * Constructs this with the specified evaporation and diffusion constants.
   * This also has the diffusion acting in a toroidal manner, so values from the
   * edges will be diffused to the other side of the space.
   * <p/>
   * 
   * This is the same as
   * <code>new ValueLayer(valueLayer, evaporationConst, diffusionConstant, true)</code>
   * 
   * @param valueLayer
   *          the layer this will be diffusing values on
   * @param evaporationConst
   *          the constant used for evaporating values off the layer
   * @param diffusionConst
   *          the constant used for diffusing values on the layer
   */
  ValueLayerDiffuser(GridValueLayer valueLayer,
      double evaporationConst, double diffusionConst
  ) {
    ValueLayerDiffuser(valueLayer, evaporationConst, diffusionConst, true);
  }

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

  ValueLayerDiffuser(GridValueLayer valueLayer, double e, double d, bool t) 
  : maxValue(DEFAULT_MAX), minValue(DEFAULT_MIN) {

    evaporationConst = e;
    diffusionConst = d;
    toroidal = t;

    setValueLayer(valueLayer);
  }
  ~ValueLayerDiffuser() { }

  void diffuse();

  double getDiffusionConst() { return diffusionConst; }
  void   setDiffusionConst(double d) { diffusionConst = d; }

  double getEvaporationConst() { return evaporationConst; }
  void   setEvaporationConst(double e) { evaporationConst = e; }

  double getMaxValue() { return maxValue; }
  void   setMaxValue(double m) { maxValue = m; }

  double getMinValue() { return minValue; }
  void   setMinValue(double m) { minValue = m; }

  bool isToroidal() { return toroidal; }
  void setToroidal(bool t) { toroidal = t; }

  GridValueLayer getValueLayer() { return valueLayer; }

  void setValueLayer(GridValueLayer);
protected:
  GridValueLayer valueLayer; 

  double maxValue, minValue, evaporationConst, diffusionConst;

  bool toroidal;

  vec1d computed1dVals;
  vec2d computed2dVals;
  vec3d computed3dVals;

  bool inBounds(Coords);

  double getValue(const Coords&);
  double constrainByMinMax(double);

  std::vector<int> pointToVectorCoordinates(const Coords&);
  Coords vectorToPointCoordinates(const std::vector<int>&);

  void computeVals();
private:
  static const long serialVersionUID;

  boost::shared_ptr<WrapAroundBorders> borders;

  double compute3dVal(int, int, int);
};

}

#endif
