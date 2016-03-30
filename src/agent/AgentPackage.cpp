#include "AgentPackage.h"

#include "ENISIAgent.h"

/* Serializable Agent Package Data */
using namespace ENISI;

// For serialization
AgentPackage::AgentPackage(int _id,
                           int _rank,
                           int _type,
                           int _currentRank,
                           Agent * pAgent) :
  id(_id),
  rank(_rank),
  type(_type),
  currentRank(_currentRank),
  state(),
  origin(repast::Point< int >(0, 0)),
  bufferValues(repast::Point< int >(0, 0))
{
  state = pAgent->getState();

  if ((Agent::Type) type == Agent::DiffuserValues)
    {
      static_cast< SharedValueLayer * >(pAgent)->getBufferValues(origin, bufferValues);
    }
}

AgentPackageProvider::AgentPackageProvider(repast::SharedContext< Agent > * pContext) :
  mpContext(pContext)
{}

void AgentPackageProvider::providePackage(Agent * pAgent, std::vector< AgentPackage > & out)
{
  repast::AgentId id = pAgent->getId();

  AgentPackage package(id.id(), id.startingRank(), id.agentType(), id.currentRank(), pAgent);

  out.push_back(package);
}

void AgentPackageProvider::provideContent(repast::AgentRequest req,
                                          std::vector< AgentPackage > & out)
{
  std::vector< repast::AgentId >::const_iterator it = req.requestedAgents().begin();
  std::vector< repast::AgentId >::const_iterator end = req.requestedAgents().end();
  Agent * pAgent;

  for (; it != end; ++it)
    {
      /* RepastProcess doesn't clear the AgentRequest when executing
       * requestAgents() multiple times. This leads to agent id "bleedover" from
       * other contexts, causing getAgent() to return null agents if not checked */
      if ((pAgent = mpContext->getAgent(*it)) != NULL)
        {
          providePackage(pAgent, out);
        }
    }
}

AgentPackageReceiver::AgentPackageReceiver(repast::SharedContext< Agent > * pContext):
  mpContext(pContext)
{}

Agent * AgentPackageReceiver::createAgent(AgentPackage package)
{
  Agent * pAgent = NULL;

  if ((Agent::Type) package.type != Agent::DiffuserValues)
    {
      pAgent = new Agent((Agent::Type) package.type, package.state);
    }
  else
    {
      size_t Size = package.bufferValues[repast::Point< int >(0, 0)].size();
      pAgent = new SharedValueLayer((Agent::Type) package.type, package.state, Size);
    }

  pAgent->setId(repast::AgentId(package.id, package.rank, package.type, package.currentRank));

  return pAgent;
}

void AgentPackageReceiver::updateAgent(AgentPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type, package.currentRank);
  Agent * pAgent = mpContext->getAgent(id);

  pAgent->setId(id);

  if ((Agent::Type) package.type != Agent::DiffuserValues)
    {
      pAgent->setState(package.state);
    }
  else
    {
      static_cast< SharedValueLayer * >(pAgent)->setBufferValues(package.origin, package.bufferValues);
    }
}
