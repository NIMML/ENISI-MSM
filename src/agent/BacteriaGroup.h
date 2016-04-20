#ifndef ENISI_MSM_BACTERIA_COMPONENT_H
#define ENISI_MSM_BACTERIA_COMPONENT_H

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"
#include "agent/GroupInterface.h"

namespace ENISI
{

class BacteriaGroup: public GroupInterface
{
public:
  BacteriaGroup(Compartment * pCompartment, const double & concentrations);

  virtual void act();

  virtual std::string classname() const {return "BacteriaGroup";}

private:
  void act(const repast::Point<int> &);

  double p_BacteriaKill;
  double p_BacteriaDeath;
  double p_BacteriaLPProl;
  double p_BacteriaLumProl;
  double p_rule1;

};

} // namespace ENISI

#endif
