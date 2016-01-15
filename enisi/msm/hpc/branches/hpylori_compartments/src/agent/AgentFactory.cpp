#include "AgentFactory.h"

ENISIAgent * AgentFactory::create(
    const std::string & agentType, ENISI::Compartment * p_cmp)
{ 
  ENISIAgent * p_agent;

  if ( agentType == "Tcell" ) 
  { 
    p_agent = new Tcell(p_cmp->cellLayer()); 
  }
  else if ( agentType == "Bacteria" ) 
  { 
    p_agent = new Bacteria(p_cmp->cellLayer()); 
  }
  else if ( agentType == "Dendritics" ) 
  { 
    p_agent = new Dendritics(p_cmp->cellLayer());
  }

  else { throw std::invalid_argument("Unknown agent type: " + agentType); }

  p_cmp->cellLayer()->addAgentToRandomLocation(p_agent);

  return p_agent;
}

AgentGroup * AgentGroupFactory::create(
    const std::string agentType, 
    ENISI::Compartment * p_compartment, 
    const boost::uintmax_t agentCount)
{ 
  /* Context deals with this pointer automatically in its destructor */
  /* Don't delete them unless you want a segmentation fault */
  AgentGroup * p_agent;

  if ( agentType == "BacteriaGroup" ) 
  { 
    p_agent = new BacteriaGroup(agentCount, p_compartment->cellLayer());
  }
  else if ( agentType == "TcellGroup" ) 
  { 
    p_agent = new TcellGroup(agentCount, p_compartment->cellLayer());
  }
  else if ( agentType == "DendriticsGroup" ) 
  { 
    p_agent = new DendriticsGroup(agentCount, p_compartment->cellLayer());
  }

  else { throw std::invalid_argument("Unknown agent type: " + agentType); }

  p_compartment->cellLayer()->addAgentToRandomLocation(p_agent);

  return p_agent;
}
