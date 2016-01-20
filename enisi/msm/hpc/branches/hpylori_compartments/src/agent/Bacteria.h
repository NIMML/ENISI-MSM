#ifndef ENISI_MSM_AGENT_BACTERIA_H
#define ENISI_MSM_AGENT_BACTERIA_H

#include <stdexcept>
#include <vector>
#include <math.h>
#include "ENISIAgent.h"
#include "Tcell.h"
#include "SharedContinuousSpace.h"
#include "GridComponents.h" // repast::StickyBorders repast::SimpleAdder
#include "Random.h" // repast::Random

class Bacteria: public ENISIAgent
{
public:
  Bacteria(CellLayer * p_layer) : _p_layer(p_layer)
  {
    setState(AgentState::INFECTIOUS); 
  }

  Bacteria(CellLayer * p_layer, AgentState::State st) : _p_layer(p_layer)
  {
    setState(st);
  }

  virtual Color getColor();
  virtual std::string classname() { return "Bacteria"; }
  virtual void act();

  void move(double x, double y);
  double randomMove(double = 1);
  std::vector<double> getLocation();
  std::vector<ENISIAgent *> getNeighbors(const std::string);

private:
  CellLayer * _p_layer;
};

#endif
