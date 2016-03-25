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
};

} // namespace ENISI

#endif // ENISI_EpithelialCellGroup
