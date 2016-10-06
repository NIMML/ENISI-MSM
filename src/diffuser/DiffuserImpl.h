#ifndef DIFFUSERIMPL_H_
#define DIFFUSERIMPL_H_

#include "repast_hpc/Point.h"
#include "repast_hpc/GridComponents.h" /* repast::StickyBorders  */
#include <stdexcept>
#include <vector>

#include "grid/matrix.h"

namespace ENISI {

class Cytokine;
class Compartment;
class SharedValueLayer;

class DiffuserImpl 
{
public:
  static const double DEFAULT_MAX, DEFAULT_MIN;

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
  DiffuserImpl(Compartment * pCompartment);
  ~DiffuserImpl();

  void diffuse(const double & deltaT);

protected:
  void computeVals(const double & deltaT);
  void computeVals1D(const double & deltaT);
  void computeVals2D(const double & deltaT);
  void computeVals3D(const double & deltaT);

private:
  Compartment * mpCompartment;
  const std::vector< Cytokine * > & mCytokines;
  double mDeltaT;

  repast::Point< int > mShape;

  DenseMatrix< std::vector< double > > * mpNewValues;
  DenseMatrix< std::vector< double > > * mpCurrentValues;

  SharedValueLayer * mpDiffuserData;
};

} // namespace ENISI

#endif
