#include "compartment/CellLayer.h"

/* CellLayer class */
CellLayer::CellLayer(const repast::GridDimensions & dims)
  : ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver>(dims) { }
