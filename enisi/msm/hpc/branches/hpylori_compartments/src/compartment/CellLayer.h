#ifndef ENISI_MSM_COMPARTMENT_CELLLAYER_H
#define ENISI_MSM_COMPARTMENT_CELLLAYER_H

#include "ICompartmentLayer.h"

struct AgentGroupPackage; class AgentGroupPackageProvider; class AgentGroupPackageReceiver;
class CellLayerImpl;

class CellLayer : public ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver>
{
public:
  typedef repast::StickyBorders Borders;
  typedef repast::SimpleAdder<ENISIAgent> Adder;
  typedef repast::SharedContinuousSpace<ENISIAgent, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<ENISIAgent, Borders, Adder> Grid;
  typedef repast::SharedContext<ENISIAgent> Context;

  CellLayer(const repast::GridDimensions &);
  virtual ~CellLayer() { }

private:
}; 
#endif
