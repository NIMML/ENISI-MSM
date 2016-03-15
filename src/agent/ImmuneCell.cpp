#include "ImmuneCell.h"

ImmuneCell::ImmuneCell(ENISI::CellLayer * p_layer) : _p_layer(p_layer) { }

void ImmuneCell::addCytoLayer(std::string name, GridValueLayer* gvl)
{
  cytoMap[name] = gvl;
}

std::vector<double> ImmuneCell::getLocation()
{
  std::vector<double> loc;
  _p_layer->getLocation(getId(), loc);
  return loc;
}

void ImmuneCell::move(double x, double y)
{
  _p_layer->moveAgentTo(this, repast::Point<double>(x, y));
}

double ImmuneCell::randomMove(double speed) 
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

std::vector<ENISI::Agent *> ImmuneCell::getNeighbors(const std::string name)
{
  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);
  return _p_layer->getNeighborsAt(name, pt);
}

