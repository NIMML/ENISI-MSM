#ifndef ENISI_MSM_AGENT_AGENTGROUPPACKAGE_H
#define ENISI_MSM_AGENT_AGENTGROUPPACKAGE_H

#include "agent/CellGroup.h"
#include "SharedContext.h"

namespace ENISI {

/* Serializable Agent Package */
struct AgentGroupPackage {
	
public:
    int    id;
    int    rank;
    int    type;
    int    currentRank;
    std::string classname;

    std::map<int, std::vector<std::pair<int, int> > > transfers;
	
    /* Constructors */
    AgentGroupPackage(); // For serialization
    AgentGroupPackage(int _id,
                      int _rank,
                      int _type,
                      int _currentRank,
                      std::string _classname,
                      std::map<int, std::vector<std::pair<int, int> > > _transfers);
	
    /* For archive packaging */
    template<class Archive>
    void serialize(Archive &ar, const unsigned int version __attribute__((unused)))
    {
        ar & id;
        ar & rank;
        ar & type;
        ar & currentRank;
        ar & classname;
        ar & transfers;
    }
	
};

/* Agent Package Provider */
class AgentGroupPackageProvider {
	
private:
  repast::SharedContext<Agent> * agents;
	
public:
	
    AgentGroupPackageProvider(repast::SharedContext<Agent> * agentPtr);
	
    void providePackage(Agent * agent, std::vector<AgentGroupPackage>& out);
	
    void provideContent(repast::AgentRequest req, std::vector<AgentGroupPackage>& out);
	
};

/* Agent Package Receiver */
class AgentGroupPackageReceiver {
	
private:
    repast::SharedContext<Agent>* agents;
	
public:
	
    AgentGroupPackageReceiver(repast::SharedContext<Agent>* agentPtr);
	
    Agent * createAgent(AgentGroupPackage package);
	
    void updateAgent(AgentGroupPackage package);
	
};

} // namespace ENISI

#endif
