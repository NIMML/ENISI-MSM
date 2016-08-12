#ifndef ENISI_EpithelialCellGroup
#define ENISI_EpithelialCellGroup

#include "agent/AgentStates.h"
#include "repast_hpc/Point.h"
#include "agent/GroupInterface.h"

namespace ENISI
{

class EpithelialCellGroup: public GroupInterface
{
public:
  EpithelialCellGroup(Compartment * pCompartment, const double & concentrations);
  virtual std::string classname() const {return "EpithelialCellGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double p_EpiCellDeath;//Rule 11
  double p_EpiProliferation;//Rule 8
  double p_rule10a;
  double p_rule10b;
  double p_rule12;//Rule 12
  double p_rule10a_infectiousBacteriaConcentration;
  double p_rule10b_cytokineConcentration;
};

} // namespace ENISI

#endif // ENISI_EpithelialCellGroup
