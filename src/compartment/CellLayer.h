#ifndef ENISI_MSM_COMPARTMENT_CELLLAYER_H
#define ENISI_MSM_COMPARTMENT_CELLLAYER_H

#include "agent/AgentGroupPackage.h"
#include "ICompartmentLayer.h"

class CellLayer : public ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver>
{
public:
  CellLayer(const repast::GridDimensions &);
  virtual ~CellLayer() { }

private:
}; 
#endif
