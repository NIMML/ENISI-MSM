#include "AgentStates.h"
#include "grid/Properties.h"

using namespace ENISI;

double ENISI::Threshold = 1.0;
double ENISI::Distance = 1.0;
double number2Concentration = 1.0;

void ENISI::init()
{
  double GridSize;
  Properties::instance(Properties::run)->getValue("grid.size", GridSize);

  // 2 dimensional

  Threshold = GridSize * GridSize;
  number2Concentration = 1.0 / Threshold;
}

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

void ENISI::numbers(const Agent::Type & type, std::vector< Agent * > agents, Number & number)
{
  number = Number(StateSize(type), 0);

  std::vector< Agent * >::const_iterator it = agents.begin();
  std::vector< Agent * >::const_iterator end = agents.end();

  for (; it != end; ++it)
    {
      if ((*it)->getType() == type)
        {
          number[(*it)->getState()]++;
        }
    }
}

void ENISI::concentrations(const Agent::Type & type, std::vector< Agent * > agents, Concentration & concentration)
{
  Number number;
  numbers(type, agents, number);
  concentration.resize(number.size());

  Concentration::iterator it = concentration.begin();
  Concentration::iterator end = concentration.end();
  Number::const_iterator itNumber = number.begin();

  for (; it != end; ++it, ++itNumber)
    {
      *it = *itNumber * number2Concentration;
    }
}

void ENISI::numbers(const int & types, std::vector< Agent * > agents, Numbers & numbers)
{
  numbers.clear();

  int Types = types;
  int CurrentType = 1;

  while (Types)
    {
      if (Types & 0x1)
        {
          numbers.insert(std::make_pair((Agent::Type) CurrentType, Number(StateSize((Agent::Type) CurrentType), 0)));
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
          numbers[Type][(*it)->getState()]++;
        }
    }
}

void ENISI::concentrations(const int & types, std::vector< Agent * > agents, Concentrations & concentrations)
{
  concentrations.clear();

  Numbers Numbers;
  numbers(types, agents, Numbers);

  Numbers::const_iterator itNumbers = Numbers.begin();
  Numbers::const_iterator endNumbers = Numbers.end();

  for (; itNumbers != endNumbers; ++itNumbers)
    {
      Concentration & C = concentrations.insert(std::make_pair(itNumbers->first, Concentration(itNumbers->second.size(), 0))).first->second;

      Concentration::iterator it = C.begin();
      Concentration::iterator end = C.end();
      Number::const_iterator itNumber = itNumbers->second.begin();

      for (; it != end; ++it, ++itNumber)
        {
          *it = *itNumber * number2Concentration;
        }
    }
}
