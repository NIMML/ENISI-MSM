#include "ENISIAgent.h"

using namespace ENISI;

int Agent::agentCount = 0;

Agent::Agent()
{ 
  int rank = repast::RepastProcess::instance()->rank();
  id = repast::AgentId(agentCount++, rank, 0);
  id.currentRank(rank);
}
