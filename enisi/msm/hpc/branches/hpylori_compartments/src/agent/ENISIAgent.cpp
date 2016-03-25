#include "ENISIAgent.h"
#include "repast_hpc/RepastProcess.h"

using namespace ENISI;

// static
int Agent::agentCount = 0;
// static
const char * Agent::Names[] = {"Bacteria", "Dentritics", "EpithelialCell", "HPylori", "ImmuneCell", "Macrophage", "Tcell"};

Agent::Agent():
  _state(0),
  id()
{}

Agent::Agent(const Agent::Type & type, const int & state) :
  _state(0),
  id()
{
  int rank = repast::RepastProcess::instance()->rank();
  id = repast::AgentId(agentCount++, rank, type, rank);
}

// virtual
Agent::~Agent() {}

/* Required Getters */
// virtual
repast::AgentId & Agent::getId()
{
  return id;
}

// virtual
const repast::AgentId & Agent::getId() const
{
  return id;
}

// virtual
void Agent::setId(repast::AgentId i)
{
  id = i;
}

Agent::Type Agent::getType() const
{
  return (Type) id.agentType();
}

void Agent::setState(const int & st)
{
  _state = st;
}

int Agent::getState() const
{
  return _state;
}

// virtual
std::string Agent::classname()
{
  switch (id.agentType())
  {
    case Bacteria:
      return Names[0];
      break;

    case Dentritics:
      return Names[1];
      break;

    case EpithelialCell:
      return Names[2];
      break;

    case HPylori:
      return Names[3];
      break;

    case ImmuneCell:
      return Names[4];
      break;

    case Macrophage:
      return Names[5];
      break;

    case Tcell:
      return Names[6];
      break;
  }

  return "";
}
