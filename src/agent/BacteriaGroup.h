#ifndef ENISI_MSM_BACTERIA_COMPONENT_H
#define ENISI_MSM_BACTERIA_COMPONENT_H

#include "agent/AgentStates.h"
#include "agent/GroupInterface.h"

namespace ENISI
{

class BacteriaGroup: public GroupInterface
{
public:
  BacteriaGroup(Compartment * pCompartment, const double & concentrations);

  virtual std::string classname() const {return "BacteriaGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double p_BacteriaKill;
  double p_BacteriaDeath;
  double p_BacteriaLPProl;
  double p_BacteriaLumProl;
  double p_rule1;
  double p_rule1_damagedEpithelialCellConcentration;

};

} // namespace ENISI

#endif
