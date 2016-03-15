#ifndef ENISI_MSM_AGENTFACTORY_H
#define ENISI_MSM_AGENTFACTORY_H

#include "Tcell.h"
#include "Bacteria.h"
#include "Dendritics.h"

#include "BacteriaGroup.h"
#include "TcellGroup.h"
#include "DendriticsGroup.h"

#include "compartment/Compartment.h"

namespace ENISI {

class AgentFactory
{
public:
  AgentFactory() { }

  Agent * create(const std::string &, Compartment *);

private:
};

class AgentGroupFactory
{
public:
  static CellGroup * create(
    const std::string, Compartment *, const boost::uintmax_t = 0);
};

} // namespace ENISI
#endif
