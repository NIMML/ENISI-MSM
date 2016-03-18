#include "AgentGroupPackage.h"
#include "compartment/CellLayer.h"

/* Serializable Agent Package Data */
using namespace ENISI;

AgentGroupPackage::AgentGroupPackage()
{}

AgentGroupPackage::AgentGroupPackage(int _id,
                                     int _rank,
                                     int _type,
                                     int _currentRank,
                                     std::string _classname,
                                     std::map<int, std::vector<std::pair<int, int> > > _transfers) :
  id(_id),
  rank(_rank),
  type(_type),
  currentRank(_currentRank),
  classname(_classname),
  transfers(_transfers)
{}

AgentGroupPackageProvider::AgentGroupPackageProvider(repast::SharedContext<Agent>* agentPtr) :
  agents(agentPtr)
{}

void AgentGroupPackageProvider::providePackage(Agent * agent, std::vector<AgentGroupPackage>& out)
{
  repast::AgentId id = agent->getId();

  AgentGroupPackage package(
    id.id(),
    id.startingRank(),
    id.agentType(),
    id.currentRank(),
    agent->classname(),
    static_cast<ENISI::CellGroup*>(agent)->getTransfers()
  );

  out.push_back(package);
}

void AgentGroupPackageProvider::provideContent(repast::AgentRequest req,
    std::vector<AgentGroupPackage>& out)
{
  std::vector<repast::AgentId> ids = req.requestedAgents();

  Agent * agent;

  for (size_t i = 0; i < ids.size(); i++)
    {
      /* RepastProcess doesn't clear the AgentRequest when executing
       * requestAgents() multiple times. This leads to agent id "bleedover" from
       * other contexts, causing getAgent() to return null agents if not checked */
      if ((agent = agents->getAgent(ids[i])) != NULL)
        {
          providePackage(agent, out);
        }
    }
}

AgentGroupPackageReceiver::AgentGroupPackageReceiver(repast::SharedContext<Agent>* agentPtr):
  agents(agentPtr)
{}

Agent * AgentGroupPackageReceiver::createAgent(AgentGroupPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type, package.currentRank);

  repast::Point<double> pt(0, 0);
  repast::GridDimensions dims(pt, pt);

  CellLayer layer(dims);

  Agent * agent = NULL;

  agent = new TransferGroup(NULL);

  agent->setId(id);

  return agent;
}

void AgentGroupPackageReceiver::updateAgent(AgentGroupPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type);
  Agent * agent = agents->getAgent(id);
  agent->setId(id);
  static_cast< ENISI::CellGroup * >(agent)->setTransfers(package.transfers);
}
