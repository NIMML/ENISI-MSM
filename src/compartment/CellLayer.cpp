#include "compartment/CellLayer.h"

using namespace ENISI;

/* CellLayer class */
CellLayer::CellLayer(const repast::GridDimensions & dims)
  : ICompartmentLayer<Agent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver>(dims) { }
