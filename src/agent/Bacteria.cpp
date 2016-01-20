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

std::vector<ENISIAgent *> Bacteria::getNeighbors(const std::string name)
{
  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);
  return _p_layer->getNeighborsAt(name, pt);
}

