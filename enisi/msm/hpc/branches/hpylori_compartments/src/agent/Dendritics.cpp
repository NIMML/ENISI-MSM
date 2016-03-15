#include "Dendritics.h"

void Dendritics::act()
{
  if (getState() == ENISI::AgentState::DEAD) return;

  std::vector<ENISI::Agent*> neighborList = getNeighbors("Bacteria");
  std::vector<ENISI::Agent*>::const_iterator iter = neighborList.begin();

  while ( iter != neighborList.end() )
  {
      ENISI::Agent * b = *iter;
    if (b->getState() == ENISI::AgentState::INFECTIOUS && getState() == ENISI::AgentState::IMMATURE)
    {
      setState(ENISI::AgentState::EFFECTOR);
    } 
    else if ( b->getState() == ENISI::AgentState::TOLEGENIC && getState() == ENISI::AgentState::IMMATURE )
    {
      setState(ENISI::AgentState::TOLEROGENIC);
    }
    ++iter;
  }

  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);

  if (getState() == ENISI::AgentState::EFFECTOR)
  {
    cytoMap["IL6"]->set(70, pt);
    cytoMap["IL12"]->set(70, pt);
  }
  else if (getState() == ENISI::AgentState::TOLEROGENIC)
  {
    cytoMap["TGFb"]->set(70, pt);
  }
  randomMove();
}

Dendritics::Color Dendritics::getColor() 
{
  Color color;

  switch(getState()){
    case ENISI::AgentState::IMMATURE:
      color = pink;
      break;
    case ENISI::AgentState::EFFECTOR:
      color = red;
      break;
    case ENISI::AgentState::TOLEROGENIC:
      color = green;
      break;
    case ENISI::AgentState::DEAD:
      color = black;
      break;
    default:
      throw std::invalid_argument("invalid getState() when getting Dendritics color");
  }

  return color;
}
