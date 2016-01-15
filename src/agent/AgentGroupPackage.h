#ifndef ENISI_MSM_AGENT_AGENTGROUPPACKAGE_H
#define ENISI_MSM_AGENT_AGENTGROUPPACKAGE_H

#include "AgentFactory.h" // repast::SharedContext

/* Serializable Agent Package */
struct AgentGroupPackage {
	
public:
    int    id;
    int    rank;
    int    type;
    int    currentRank;
    std::string classname;
    AgentState::State state;

    std::map<int, std::vector<std::pair<int, int> > > transfers;
	
    /* Constructors */
    AgentGroupPackage(); // For serialization
    AgentGroupPackage(
    	int _id, int _rank, int _type, int _currentRank, 
    	std::string _classname, AgentState::State _state,
    	AgentGroup::Transfers _transfers
    );
	
    /* For archive packaging */
    template<class Archive>
    void serialize(Archive &ar, const unsigned int version __attribute__((unused)))
    {
        ar & id;
        ar & rank;
        ar & type;
        ar & currentRank;
        ar & classname;
        ar & state;
        ar & transfers;
    }
	
};

/* Agent Package Provider */
class AgentGroupPackageProvider {
	
private:
  AgentGroup::Context * agents;
	
public:
	
    AgentGroupPackageProvider(AgentGroup::Context * agentPtr);
	
    void providePackage(ENISIAgent * agent, std::vector<AgentGroupPackage>& out);
	
    void provideContent(repast::AgentRequest req, std::vector<AgentGroupPackage>& out);
	
};

/* Agent Package Receiver */
class AgentGroupPackageReceiver {
	
private:
    AgentGroup::Context* agents;
	
public:
	
    AgentGroupPackageReceiver(AgentGroup::Context* agentPtr);
	
    ENISIAgent * createAgent(AgentGroupPackage package);
	
    void updateAgent(AgentGroupPackage package);
	
};

#endif
