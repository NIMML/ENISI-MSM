#include "Bacteria.h"

Bacteria::Color Bacteria::getColor(){
  Color color;

  switch(_state)
  {
    case AgentState::INFECTIOUS:
    color = red;
    break;
    case AgentState::TOLEGENIC:
    color = green;
    break;
    case AgentState::DEAD:
    color = black;
    break;
  default:		
    throw std::invalid_argument("invalid state when getting Bacteria color");
  }

  return color;
}

void Bacteria::act()
{
  if (_state == AgentState::DEAD) return;

  std::vector<Tcell*> neighborList = getNeighbors<Tcell>();

  std::vector<Tcell*>::const_iterator iter = neighborList.begin();

  while ( iter != neighborList.end() ){
    Tcell* tc = *iter;
    if (tc->getState() == AgentState::TH1 || tc->getState() == AgentState::TH17) {
      if (_state == AgentState::INFECTIOUS) {
	_state = AgentState::DEAD;
	return;
      }
    }
    ++iter;
  }
  
  randomMove();
}
