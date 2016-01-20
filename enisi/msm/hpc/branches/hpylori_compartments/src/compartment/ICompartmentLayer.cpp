#include "ICompartmentLayer.h"
#include "diffuser/DiffuserPackage.h"
#include "agent/AgentGroupPackage.h"

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::requestAgents() 
{ 
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int rank = repast::RepastProcess::instance()->rank();


  repast::AgentRequest req(rank);

  /* For each process */
  for(int i = 0; i < worldSize; i++)
  {                     
    if(i != rank)// ... except this one
    {                                      
      std::vector<A*> agents;        
      /* Choose all agents */
      _context.selectAgents(agents);

      for(size_t j = 0; j < agents.size(); j++)
      {
	/* Transform each local agent's id into a matching non-local one */
	repast::AgentId local = agents[j]->getId();
	repast::AgentId other(local.id(), i, 0);
	other.currentRank(i);

	/* Add it to the agent request */
	req.addRequest(other);
      }
    }
  }

  repast::RepastProcess::instance()->requestAgents
    <A, P, PP, PR>(_context, req, _provider, _receiver, _receiver);
}

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::synchronizeAgentStates() 
{ 
  repast::RepastProcess::instance()->synchronizeAgentStates
    <P, PP, PR>(_provider, _receiver);
}

template class ICompartmentLayer<
  ENISIAgent, 
  AgentGroupPackage, 
  AgentGroupPackageProvider, 
  AgentGroupPackageReceiver>;

template class ICompartmentLayer<
    Diffuser, 
    DiffuserPackage, 
    DiffuserPackageProvider, 
    DiffuserPackageReceiver>;
