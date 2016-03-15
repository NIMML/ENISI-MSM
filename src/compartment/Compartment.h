#ifndef ENISI_MSM_COMPARTMENT_H
#define ENISI_MSM_COMPARTMENT_H

#include "SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "Moore2DGridQuery.h"

namespace ENISI {

class CellLayer; class DiffuserLayer;

class Compartment
{
public:
  Compartment(const repast::GridDimensions &,
              const std::string name = "Default");
  ~Compartment();

  CellLayer * cellLayer();

  DiffuserLayer * newDiffuserLayer();

  void requestDiffuserAgents();
  void diffuse();
  void updateReferenceDiffuserGrid();
  const std::string & getName() const;

private:
  const repast::GridDimensions & _dimensions;
  CellLayer * _p_cellLayer;
  std::vector<DiffuserLayer *> _diffuserLayers;
  const std::string mName;

}; /* end Compartment */

}
#endif
