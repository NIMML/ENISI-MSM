#ifndef ENISI_MacrophageGroup
#define ENISI_MacrophageGroup

#include <string>
#include <vector>

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;
class Agent;

class MacrophageGroup
{
public:
  MacrophageGroup(Compartment * pCompartment, const size_t & count);

  ~MacrophageGroup();

  void act();

  std::string classname() {return "MacrophageGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;

  double p_rule42;
  double p_MinfDiff;
  double p_rule13;
  double p_rule28a;
  double p_rule28b;
};

} // namespace ENISI

#endif // ENISI_MacrophageGroup
