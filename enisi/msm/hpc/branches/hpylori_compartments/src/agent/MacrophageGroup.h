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

  virtual ~MacrophageGroup();

  virtual void act();

  virtual std::string classname() {return "MacrophageGroup";}

private:
  void act(const repast::Point<int> &);
  Compartment * mpCompartment;
};

} // namespace ENISI

#endif // ENISI_MacrophageGroup
