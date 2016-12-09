#ifndef ENISI_MacrophageGroup
#define ENISI_MacrophageGroup

#include <string>
#include <vector>

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"
#include "agent/GroupInterface.h"

namespace ENISI
{

class MacrophageGroup: public GroupInterface
{
public:
  MacrophageGroup(Compartment * pCompartment,
                  const double & concentrations,
                  const double & regulatoryConcentration);

  virtual ~MacrophageGroup();

  virtual std::string classname() const {return "MacrophageGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double p_rule42;
  double p_MinfDiff;
  double p_MregDiff;
  double p_rule13;
  double p_rule28a;
  double p_rule28b;
};

} // namespace ENISI

#endif // ENISI_MacrophageGroup
