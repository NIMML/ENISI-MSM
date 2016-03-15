#ifndef ENISI_MSM_REPASTDEMOAGENTPACKAGE_H
#define ENISI_MSM_REPASTDEMOAGENTPACKAGE_H

#include "AgentFactory.h" // repast::SharedContext

typedef ENISI::Agent RepastHPCDemoAgent;

/* Serializable Agent Package */
struct RepastHPCDemoAgentPackage {
	
public:
    int    id;
    int    rank;
    int    type;
    int    currentRank;
    std::string classname;
    ENISI::AgentState::State state;
	
    /* Constructors */
    RepastHPCDemoAgentPackage(); // For serialization
    RepastHPCDemoAgentPackage(
    	int _id, int _rank, int _type, int _currentRank, 
    	std::string _classname, ENISI::AgentState::State _state
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
    }
	
};

/* Agent Package Provider */
class RepastHPCDemoAgentPackageProvider {
	
private:
    repast::SharedContext<RepastHPCDemoAgent>* agents;
	
public:
	
    RepastHPCDemoAgentPackageProvider(repast::SharedContext<RepastHPCDemoAgent>* agentPtr);
	
    void providePackage(RepastHPCDemoAgent * agent, std::vector<RepastHPCDemoAgentPackage>& out);
	
    void provideContent(repast::AgentRequest req, std::vector<RepastHPCDemoAgentPackage>& out);
	
};

/* Agent Package Receiver */
class RepastHPCDemoAgentPackageReceiver {
	
private:
    repast::SharedContext<RepastHPCDemoAgent>* agents;
	
public:
	
    RepastHPCDemoAgentPackageReceiver(repast::SharedContext<RepastHPCDemoAgent>* agentPtr);
	
    RepastHPCDemoAgent * createAgent(RepastHPCDemoAgentPackage package);
	
    void updateAgent(RepastHPCDemoAgentPackage package);
	
};

#endif
