#ifndef ENISI_AgentPackage
#define ENISI_AgentPackage

#include "repast_hpc/SharedContext.h"
#include "SharedValueLayer.h"

namespace ENISI
{

class Agent;

/* Serializable Agent Package */
struct AgentPackage
{
private:
  AgentPackage(); // For serialization

public:
  int    id;
  int    rank;
  int    type;
  int    currentRank;
  int    state;
  repast::Point< int > origin;
  SparseMatrix< std::vector< double > > bufferValues;

  /* Constructors */

  AgentPackage(int _id,
               int _rank,
               int _type,
               int _currentRank,
               Agent * pAgent);

  /* For archive packaging */
  template<class Archive>
  void serialize(Archive &ar, const unsigned int version __attribute__((unused)))
  {
    ar & id;
    ar & rank;
    ar & type;
    ar & currentRank;
    ar & state;

    if ((Agent::Type) type == Agent::DiffuserValues)
      {
        ar & origin;
        ar & bufferValues;
      }
  }
};

/* Agent Package Provider */
class AgentPackageProvider
{

private:
  repast::SharedContext< Agent > * mpContext;

public:

  AgentPackageProvider(repast::SharedContext< Agent > * pContext);

  void providePackage(Agent * agent, std::vector< AgentPackage > & out);

  void provideContent(repast::AgentRequest req, std::vector< AgentPackage > & out);
};

/* Agent Package Receiver */
class AgentPackageReceiver
{

private:
  repast::SharedContext< Agent > * mpContext;

public:

  AgentPackageReceiver(repast::SharedContext< Agent > * pContext);

  Agent * createAgent(AgentPackage package);

  void updateAgent(AgentPackage package);
};

} // namespace ENISI

#endif // ENISI_AgentPackage
