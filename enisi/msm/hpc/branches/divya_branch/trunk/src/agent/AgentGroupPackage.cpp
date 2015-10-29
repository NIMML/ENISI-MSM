#include "AgentGroupPackage.h"

/* Serializable Agent Package Data */

AgentGroupPackage::AgentGroupPackage(){ }

AgentGroupPackage::AgentGroupPackage(
    int _id, int _rank, int _type, int _currentRank, 
    std::string _classname, AgentState::State _state,
    TcellGroup::Transfers _transfers
    ):
id(_id), rank(_rank), type(_type), currentRank(_currentRank), 
  classname(_classname), state(_state), transfers(_transfers)
{ }
AgentGroupPackageProvider::AgentGroupPackageProvider(repast::SharedContext<ENISIAgent>* agentPtr): agents(agentPtr){ }

void AgentGroupPackageProvider::providePackage(ENISIAgent * agent, std::vector<AgentGroupPackage>& out){
    repast::AgentId id = agent->getId();
  AgentGroupPackage package(
    id.id(), 
    id.startingRank(), 
    id.agentType(), 
    id.currentRank(), 
    agent->classname(),
    agent->getState(),
    ((TcellGroup*)agent)->getTransfers()
  );
  out.push_back(package);
}

void AgentGroupPackageProvider::provideContent(repast::AgentRequest req, std::vector<AgentGroupPackage>& out){
    std::vector<repast::AgentId> ids = req.requestedAgents();
    for(size_t i = 0; i < ids.size(); i++){
        providePackage(agents->getAgent(ids[i]), out);
    }
}


AgentGroupPackageReceiver::AgentGroupPackageReceiver(repast::SharedContext<ENISIAgent>* agentPtr): agents(agentPtr){}

ENISIAgent * AgentGroupPackageReceiver::createAgent(
      AgentGroupPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type);

  AgentFactory factory(agents);

  ENISIAgent * agent = factory.create(package.classname);
  agent->setId(id);

  return agent;
}

void AgentGroupPackageReceiver::updateAgent(AgentGroupPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type);
  ENISIAgent * agent = agents->getAgent(id);
  agent->setId(id);
  ((TcellGroup*)agent)->setTransfers(package.transfers);
}

