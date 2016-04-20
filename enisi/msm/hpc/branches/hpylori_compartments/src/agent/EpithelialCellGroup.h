#ifndef ENISI_EpithelialCellGroup
#define ENISI_EpithelialCellGroup

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;
class Agent;

class EpithelialCellGroup
{
public:
  EpithelialCellGroup(Compartment * pCompartment, const size_t & count);
  virtual void act();
  virtual std::string classname() {return "EpithelialCellGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;

  double p_EpiCellDeath;//Rule 11
  double p_EpiProliferation;//Rule 8
  double p_rule10a;
  double p_rule10b;
  double p_rule12;//Rule 12
};

} // namespace ENISI

#endif // ENISI_EpithelialCellGroup
