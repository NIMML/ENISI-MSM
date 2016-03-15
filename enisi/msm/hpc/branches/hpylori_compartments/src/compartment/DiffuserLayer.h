#ifndef ENISI_MSM_COMPARTMENT_DIFFUSIONLAYER_H
#define ENISI_MSM_COMPARTMENT_DIFFUSIONLAYER_H

#include "diffuser/DiffuserPackage.h"
#include "ICompartmentLayer.h"

namespace ENISI {

class ParallelDiffuser;

class DiffuserLayer : public ICompartmentLayer<Diffuser, DiffuserPackage, DiffuserPackageProvider, DiffuserPackageReceiver>
{
public:
  DiffuserLayer(const repast::GridDimensions &);
  virtual ~DiffuserLayer() { }

  void diffuse();
  void updateReferenceDiffuserGrid();
  void setReferenceDiffuser(ParallelDiffuser *);

private:
  ParallelDiffuser * _p_referenceDiffuser;
}; 

} // namespace ENISI


#endif
