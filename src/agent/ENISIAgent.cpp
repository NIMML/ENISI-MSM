#include "ENISIAgent.h"

int ENISIAgent::agentCount = 0;

ENISIAgent::ENISIAgent() 
{ 
  int rank = repast::RepastProcess::instance()->rank();
  id = repast::AgentId(agentCount++, rank, 0);
  id.currentRank(rank);
}
