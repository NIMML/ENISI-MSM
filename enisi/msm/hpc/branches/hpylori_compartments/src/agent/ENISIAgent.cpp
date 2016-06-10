#include "ENISIAgent.h"
#include "repast_hpc/RepastProcess.h"

using namespace ENISI;

// static
int Agent::agentCount = 0;
// static
const char * Agent::Names[] = {"Bacteria", "Dentritics", "EpithelialCell", "HPylori", "ImmuneCell", "Macrophage", "Tcell", "DiffuserValues"};

Agent::Agent():
  id(),
  _state(0)
{}

Agent::Agent(const int & id, const int & startProc, const int & agentType, const int & currentProc, const int & state):
  id(id, startProc, agentType, currentProc),
  _state(state)
{}

Agent::Agent(const Agent::Type & type, const int & state) :
  id(),
  _state(state)
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
void Agent::write(std::ostream & o, const std::string & separator, Compartment * /* pCompartment */)
{
  o << getId().startingRank() << ":" << getId().id() << separator << classname() << separator << _state;
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

      case DiffuserValues:
        return Names[7];
        break;
    }

  return "";
}
