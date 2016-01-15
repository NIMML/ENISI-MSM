#include "Dendritics.h"

void Dendritics::act()
{
  if (getState() == AgentState::DEAD) return;

  std::vector<ENISIAgent*> neighborList = getNeighbors("Bacteria");
  std::vector<ENISIAgent*>::const_iterator iter = neighborList.begin();

  while ( iter != neighborList.end() )
  {
    ENISIAgent * b = *iter;
    if (b->getState() == AgentState::INFECTIOUS && getState() == AgentState::IMMATURE) 
    {
      setState(AgentState::EFFECTOR);
    } 
    else if ( b->getState() == AgentState::TOLEGENIC && getState() == AgentState::IMMATURE ) 
    {
      setState(AgentState::TOLEROGENIC);
    }
    ++iter;
  }

  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);

  if (getState() == AgentState::EFFECTOR) 
  {
    cytoMap["IL6"]->set(70, pt);
    cytoMap["IL12"]->set(70, pt);
  }
  else if (getState() == AgentState::TOLEROGENIC) 
  {
    cytoMap["TGFb"]->set(70, pt);
  }
  randomMove();
}

Dendritics::Color Dendritics::getColor() 
{
  Color color;

  switch(getState()){
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
      throw std::invalid_argument("invalid getState() when getting Dendritics color");
  }

  return color;
}
