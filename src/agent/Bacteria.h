#ifndef ENISI_MSM_AGENT_BACTERIA_H
#define ENISI_MSM_AGENT_BACTERIA_H

#include <stdexcept>
#include <vector>
#include <math.h>
#include "MobileAgent.h"
#include "Tcell.h"
#include "SharedContinuousSpace.h"
#include "GridComponents.h" // repast::StickyBorders repast::SimpleAdder
#include "Random.h" // repast::Random

class Bacteria: public MobileAgent<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver> 
{
public:
  Bacteria(ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver> * p_layer) : MobileAgent(p_layer)
  {
    setState(AgentState::INFECTIOUS); 
  }

  Bacteria(ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver> * p_layer, AgentState::State st)
    : MobileAgent(p_layer)
  {
    setState(st);
  }

  virtual Color getColor();
  virtual std::string classname() { return "Bacteria"; }
  virtual void act();

};

#endif
