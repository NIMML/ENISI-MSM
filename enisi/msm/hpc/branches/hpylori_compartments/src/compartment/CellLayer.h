#ifndef ENISI_MSM_COMPARTMENT_CELLLAYER_H
#define ENISI_MSM_COMPARTMENT_CELLLAYER_H

#include "agent/AgentGroupPackage.h"
#include "ICompartmentLayer.h"

namespace ENISI
{

class CellLayer : public ICompartmentLayer<Agent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver>
{
public:
  CellLayer(const repast::GridDimensions &);
  virtual ~CellLayer() { }

private:
}; 

} // namespace ENISI

#endif
