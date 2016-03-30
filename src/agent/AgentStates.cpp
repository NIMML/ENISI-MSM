#include "AgentStates.h"

using namespace ENISI;

// static
Agent::Type BacteriaState::Type = Agent::Bacteria;

// static
Agent::Type DendriticState::Type = Agent::Dentritics;

// static
Agent::Type EpithelialCellState::Type = Agent::EpithelialCell;

// static
Agent::Type HPyloriState::Type = Agent::HPylori;

// static
Agent::Type MacrophageState::Type = Agent::Macrophage;


// static
Agent::Type TcellState::Type = Agent::Tcell;

size_t StateSize(const Agent::Type & type)
{
  switch (type)
  {
    case Agent::Bacteria:
      return BacteriaState::KEEP_AT_END;
      break;

    case Agent::Dentritics:
      return DendriticState::KEEP_AT_END;
      break;

    case Agent::EpithelialCell:
      return EpithelialCellState::KEEP_AT_END;
      break;

    case Agent::HPylori:
      return HPyloriState::KEEP_AT_END;
      break;

    case Agent::ImmuneCell:
      return 0;
      break;

    case Agent::Macrophage:
      return MacrophageState::KEEP_AT_END;
      break;

    case Agent::Tcell:
      return TcellState::KEEP_AT_END;
      break;

    case Agent::DiffuserValues:
      return 0;
      break;
  }

  return 0;
}

void ENISI::CountStates(const Agent::Type & type,
                        std::vector< Agent * > agents,
                        StateCount & stateCount)
{
  stateCount = StateCount(StateSize(type), 0);

  std::vector< Agent * >::const_iterator it = agents.begin();
  std::vector< Agent * >::const_iterator end = agents.end();

  for (; it != end; ++it)
    {
      if ((*it)->getType() == type)
        {
          stateCount[(*it)->getState()]++;
        }
    }
}

void ENISI::CountStates(const int & types,
                        std::vector< Agent * > agents,
                        StateCounts & stateCounts)
{
  stateCounts.clear();

  int Types = types;
  int CurrentType = 1;

  while (Types)
    {
      if (Types & 0x1)
        {
          stateCounts.insert(std::make_pair((Agent::Type) CurrentType, StateCount(StateSize((Agent::Type) CurrentType), 0)));
        }

      Types /= 2;
      CurrentType *= 2;
    }


  std::vector< Agent * >::const_iterator it = agents.begin();
  std::vector< Agent * >::const_iterator end = agents.end();

  for (; it != end; ++it)
    {
      Agent::Type Type = (*it)->getType();

      if (Type & types)
        {
          stateCounts[Type][(*it)->getState()]++;
        }
    }
}


