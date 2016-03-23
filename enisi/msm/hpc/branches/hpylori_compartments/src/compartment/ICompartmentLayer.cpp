#include "ICompartmentLayer.h"
#include "diffuser/DiffuserPackage.h"
#include "agent/AgentGroupPackage.h"

using namespace ENISI;

template class ICompartmentLayer<
  Agent,
  AgentGroupPackage, 
  AgentGroupPackageProvider, 
  AgentGroupPackageReceiver>;

template class ICompartmentLayer<
    Diffuser, 
    DiffuserPackage, 
    DiffuserPackageProvider, 
    DiffuserPackageReceiver>;
