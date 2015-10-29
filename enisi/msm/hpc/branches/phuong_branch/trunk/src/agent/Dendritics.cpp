#include "Dendritics.h"

void Dendritics::act() 
{
  if (_state == AgentState::DEAD) return;

  std::vector<Bacteria*> neighborList = getNeighbors<Bacteria>();
  std::vector<Bacteria*>::const_iterator iter = neighborList.begin();

  while ( iter != neighborList.end() )
  {
    Bacteria* b = *iter;
    if (b->getState() == AgentState::INFECTIOUS && _state == AgentState::IMMATURE) 
    {
      _state = AgentState::EFFECTOR;
    } 
    else if ( b->getState() == AgentState::TOLEGENIC && _state == AgentState::IMMATURE ) 
    {
      _state = AgentState::TOLEROGENIC;
    }
    ++iter;
  }

  repast::Point<int> pt = getGridLocation();

  if (_state == AgentState::EFFECTOR) 
  {
    cytoMap["IL6"]->set(70, pt);
    cytoMap["IL12"]->set(70, pt);
  }
  else if (_state == AgentState::TOLEROGENIC) 
  {
    cytoMap["TGFb"]->set(70, pt);
  }
  randomMove();
}

Dendritics::Color Dendritics::getColor() 
{
  Color color;

  switch(_state){
    case AgentState::IMMATURE:
      color = pink;
      break;
    case AgentState::EFFECTOR:
      color = red;
      break;
    case AgentState::TOLEROGENIC:
      color = green;
      break;
    case AgentState::DEAD:
      color = black;
      break;
    default:
      throw std::invalid_argument("invalid _state when getting Dendritics color");
  }

  return color;
}
