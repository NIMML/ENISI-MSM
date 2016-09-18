#include "AgentPackage.h"
#include "ENISIAgent.h"

#include "repast_hpc/RepastProcess.h"

/* Serializable Agent Package Data */
using namespace ENISI;

AgentPackage::AgentPackage() :
  id(),
  rank(),
  type(),
  currentRank(),
  state(),
  origin(repast::Point< int >(0, 0)),
  bufferValues()
{}

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
  bufferValues()
{
  state = pAgent->getState();

  if ((Agent::Type) type == Agent::DiffuserValues)
    {
      static_cast< SharedValueLayer * >(pAgent)->getBufferValues(origin, bufferValues);
    }
}

AgentPackageExchange::AgentPackageExchange(repast::SharedContext< Agent > * pContext) :
  mpContext(pContext)
{}

void AgentPackageExchange::providePackage(Agent * pAgent, std::vector< AgentPackage > & out)
{
  repast::AgentId id = pAgent->getId();

  AgentPackage package(id.id(), id.startingRank(), id.agentType(), id.currentRank(), pAgent);

  out.push_back(package);
}

void AgentPackageExchange::provideContent(repast::AgentRequest req,
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

Agent * AgentPackageExchange::createAgent(AgentPackage package)
{
  Agent * pAgent = NULL;

  // LocalFile::debug() << repast::RepastProcess::instance()->rank() << ": " << package.id << ", " << package.rank << ", " << package.type << ", " << package.currentRank << ", " << package.state << std::endl;

  if ((Agent::Type) package.type != Agent::DiffuserValues)
    {
      pAgent = new Agent(package.id, package.rank, package.type, package.currentRank, package.state);
    }
  else
    {
      pAgent = new SharedValueLayer(package.id, package.rank, package.type, package.currentRank, package.state, package.origin, package.bufferValues);
    }

  return pAgent;
}

void AgentPackageExchange::updateAgent(AgentPackage package)
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
