#ifndef ENISI_MSM_DIFFUSER_DIFFUSERPACKAGE_H
#define ENISI_MSM_DIFFUSER_DIFFUSERPACKAGE_H

#include "diffuser/ParallelDiffuser.h" 


/* Serializable Agent Package */
struct DiffuserPackage {
	
public:
    int    id;
    int    rank;
    int    type;
    int    currentRank;
    int    xOrigin;
    int    yOrigin;
    int    xExtent;
    int    yExtent;
    std::vector<double> assignedGridValues;

    /* Constructors */
    DiffuserPackage(); // For serialization
    DiffuserPackage(
    	int _id, int _rank, int _type, int _currentRank, 
    	int _xOrigin, int _yOrigin, int _xExtent, int _yExtent,
	std::vector<double> _assignedGridValues
    );
	
    /* For archive packaging */
    template<class Archive>
    void serialize(Archive &ar, const unsigned int version __attribute__((unused)))
    {
        ar & id; ar & rank; ar & type; ar & currentRank;
        ar & xOrigin; ar & yOrigin; ar & xExtent; ar & yExtent;

	ar & assignedGridValues;
    }
	
};

/* Agent Package Provider */
class DiffuserPackageProvider {
	
private:
  repast::SharedContext<Diffuser> * _p_context;
	
public:
	
    DiffuserPackageProvider(repast::SharedContext<Diffuser> * agentPtr);
	
    void providePackage(Diffuser * agent, std::vector<DiffuserPackage>& out);
	
    void provideContent(repast::AgentRequest req, std::vector<DiffuserPackage>& out);
	
};

/* Agent Package Receiver */
class DiffuserPackageReceiver {
	
private:
    repast::SharedContext<Diffuser> * _p_context;
	
public:
	
    DiffuserPackageReceiver(repast::SharedContext<Diffuser>* agentPtr);
	
    Diffuser * createAgent(DiffuserPackage package);
	
    void updateAgent(DiffuserPackage package);
	
};

#endif
