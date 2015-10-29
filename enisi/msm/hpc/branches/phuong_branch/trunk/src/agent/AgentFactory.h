#ifndef ENISI_MSM_AGENTFACTORY_H
#define ENISI_MSM_AGENTFACTORY_H

#include "Tcell.h"
#include "Bacteria.h"
#include "Dendritics.h"

#include "BacteriaGroup.h"
#include "TcellGroup.h"
#include "DendriticsGroup.h"

class AgentFactory
{
public:
  AgentFactory(repast::SharedContext<ENISIAgent> * ctx) : _ctx(ctx) { }

  ENISIAgent * create(std::string agentType, int agentCount = 0); 

private:
  repast::SharedContext<ENISIAgent>* _ctx;
};

#endif
