#include "AgentFactory.h"

ENISIAgent * AgentFactory::create(std::string agentType, int agentCount) 
{ 
  ENISIAgent* pAgent;

  if      ( agentType == "Tcell" ) { pAgent = new Tcell(_ctx); }
  else if ( agentType == "Bacteria" ) { pAgent = new Bacteria(_ctx); }
  else if ( agentType == "Dendritics" ) { pAgent = new Dendritics(_ctx); }

  else if ( agentType == "BacteriaGroup" ) 
  { 
    pAgent = new BacteriaGroup(agentCount, _ctx); 
  }
  else if ( agentType == "TcellGroup" ) 
  { 
    pAgent = new TcellGroup(agentCount, _ctx); 
  }
  else if ( agentType == "DendriticsGroup" ) 
  { 
      pAgent = new DendriticsGroup(agentCount, _ctx); 
  }

  else { throw std::invalid_argument("Unknown agent type: " + agentType); }

  return pAgent;
}
