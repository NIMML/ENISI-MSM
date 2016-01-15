#include "Bacteria.h"

Bacteria::Color Bacteria::getColor(){
  Color color;

  switch(getState())
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
  if (getState() == AgentState::DEAD) return;

  std::vector<ENISIAgent*> neighborList = getNeighbors("Tcell");

  std::vector<ENISIAgent*>::const_iterator iter = neighborList.begin();

  while ( iter != neighborList.end() ){
    ENISIAgent * tc = *iter;
    if (tc->getState() == AgentState::TH1 || tc->getState() == AgentState::TH17) {
      if (getState() == AgentState::INFECTIOUS) {
	setState(AgentState::DEAD);
	return;
      }
    }
    ++iter;
  }
  
  randomMove();
}
