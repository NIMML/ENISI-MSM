#include "Bacteria.h"

Bacteria::Color Bacteria::getColor(){
  Color color;

  switch(getState())
  {
    case ENISI::AgentState::INFECTIOUS:
    color = red;
    break;
    case ENISI::AgentState::TOLEGENIC:
    color = green;
    break;
    case ENISI::AgentState::DEAD:
    color = black;
    break;
  default:		
    throw std::invalid_argument("invalid state when getting Bacteria color");
  }

  return color;
}

void Bacteria::act()
{
  if (getState() == ENISI::AgentState::DEAD) return;

  std::vector<ENISI::Agent*> neighborList = getNeighbors("Tcell");

  std::vector<ENISI::Agent*>::const_iterator iter = neighborList.begin();

  while ( iter != neighborList.end() ){
      ENISI::Agent * tc = *iter;
    if (tc->getState() == ENISI::AgentState::TH1 || tc->getState() == ENISI::AgentState::TH17) {
      if (getState() == ENISI::AgentState::INFECTIOUS) {
	setState(ENISI::AgentState::DEAD);
	return;
      }
    }
    ++iter;
  }
  
  randomMove();
}

std::vector<double> Bacteria::getLocation()
{
  std::vector<double> loc;
  _p_layer->getLocation(getId(), loc);
  return loc;
}

void Bacteria::move(double x, double y)
{
  _p_layer->moveAgentTo(this, repast::Point<double>(x, y));
}

double Bacteria::randomMove(double speed) 
{
  double fullCircle = 2 * 3.14; // in radians
  double angle = 
    repast::Random::instance()->createUniDoubleGenerator(0, fullCircle).next();
  double radius = 
    repast::Random::instance()->createUniDoubleGenerator(0, speed).next();

  std::vector<double> loc = getLocation();
  double x = loc[0] + radius * cos(angle);
  double y = loc[1] + radius * sin(angle);

  move(x, y);

  return radius;
}

std::vector<ENISI::Agent *> Bacteria::getNeighbors(const std::string name)
{
  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);
  return _p_layer->getNeighborsAt(name, pt);
}

