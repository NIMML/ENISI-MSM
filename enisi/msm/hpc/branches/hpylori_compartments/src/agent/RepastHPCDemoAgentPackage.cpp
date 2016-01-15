#include "RepastHPCDemoAgentPackage.h"

/* Serializable Agent Package Data */

RepastHPCDemoAgentPackage::RepastHPCDemoAgentPackage(){ }

RepastHPCDemoAgentPackage::RepastHPCDemoAgentPackage(
    int _id, int _rank, int _type, int _currentRank, 
    std::string _classname, AgentState::State _state
    ):
id(_id), rank(_rank), type(_type), currentRank(_currentRank), 
  classname(_classname), state(_state)
  { }
RepastHPCDemoAgentPackageProvider::RepastHPCDemoAgentPackageProvider(repast::SharedContext<RepastHPCDemoAgent>* agentPtr): agents(agentPtr){ }

void RepastHPCDemoAgentPackageProvider::providePackage(RepastHPCDemoAgent * agent, std::vector<RepastHPCDemoAgentPackage>& out){
    repast::AgentId id = agent->getId();
  RepastHPCDemoAgentPackage package(
    id.id(), 
    id.startingRank(), 
    id.agentType(), 
    id.currentRank(), 
    agent->classname(),
    agent->getState()
  );
  out.push_back(package);
}

void RepastHPCDemoAgentPackageProvider::provideContent(repast::AgentRequest req, std::vector<RepastHPCDemoAgentPackage>& out){
    std::vector<repast::AgentId> ids = req.requestedAgents();
    for(size_t i = 0; i < ids.size(); i++){
        providePackage(agents->getAgent(ids[i]), out);
    }
}


RepastHPCDemoAgentPackageReceiver::RepastHPCDemoAgentPackageReceiver(repast::SharedContext<RepastHPCDemoAgent>* agentPtr): agents(agentPtr){}

ENISIAgent * RepastHPCDemoAgentPackageReceiver::createAgent(
      RepastHPCDemoAgentPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type, package.currentRank);

  AgentFactory factory;

  const repast::Point<double> origin(0, 0);
  const repast::Point<double> extents(0, 0);

  const repast::GridDimensions dimensions(origin, extents);

  ENISI::Compartment compartment(dimensions);

  ENISIAgent * agent = factory.create(package.classname, &compartment);
  agent->setId(id);
  agent->setState(package.state);

  return agent;
}

void RepastHPCDemoAgentPackageReceiver::updateAgent(RepastHPCDemoAgentPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type);
  RepastHPCDemoAgent * agent = agents->getAgent(id);
  agent->setId(id);
  agent->setState(package.state);
  //agent->set(package.currentRank, package.c, package.total);
}

