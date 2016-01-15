#ifndef ENISI_MSM_COMPARTMENT_DIFFUSIONLAYER_H
#define ENISI_MSM_COMPARTMENT_DIFFUSIONLAYER_H

#include "diffuser/Diffuser.h"
#include "ICompartmentLayer.h"

class ParallelDiffuser;
class Diffuser; 
struct DiffuserPackage; class DiffuserPackageProvider; class DiffuserPackageReceiver;
class DiffuserLayerImpl;

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
#endif
