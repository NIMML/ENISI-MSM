#ifndef ENISI_MSM_BACTERIA_H
#define ENISI_MSM_BACTERIA_H

#include <stdexcept>
#include <vector>
#include <math.h>
#include "ENISIAgent.h"
#include "Tcell.h"
#include "SharedContinuousSpace.h"
#include "GridComponents.h" // repast::StickyBorders repast::SimpleAdder
#include "Random.h" // repast::Random

class Bacteria: public ENISIAgent {
public:

  Bacteria(repast::SharedContext<ENISIAgent>* ctx) : ENISIAgent(ctx)
  { 
    setState(AgentState::INFECTIOUS); 
  }
  Bacteria(repast::SharedContext<ENISIAgent>* ctx, AgentState::State st) 
    : ENISIAgent(ctx) { setState(st); }

  virtual Color getColor();
  virtual std::string classname() { return "Bacteria"; }
  virtual void act();

};

#endif
