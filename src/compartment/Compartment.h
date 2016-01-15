#ifndef ENISI_MSM_COMPARTMENT_H
#define ENISI_MSM_COMPARTMENT_H

#include "SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "Moore2DGridQuery.h"
#include "compartment/CellLayer.h"
#include "compartment/DiffuserLayer.h"

namespace ENISI {

class Compartment
{
public:
  Compartment(const repast::GridDimensions &);
  ~Compartment();

  CellLayer * cellLayer();

  DiffuserLayer * newDiffuserLayer();

  void requestAgents();
  void diffuse();
  void updateReferenceDiffuserGrid();
private:
  const repast::GridDimensions & _dimensions;
  CellLayer * _p_cellLayer;

  std::vector<DiffuserLayer *> _diffuserLayers;
}; /* end Compartment */

}
#endif
