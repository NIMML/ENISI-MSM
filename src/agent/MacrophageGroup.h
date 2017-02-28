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
                  const double & residentConcentration);

  virtual ~MacrophageGroup();

  virtual std::string classname() const {return "MacrophageGroup";}

protected:
  virtual void act(const repast::Point<int> &);
  virtual void move();
  virtual void write(const repast::Point<int> & pt);

private:
  double p_MinfDiff;
  double p_MregDiff;
  double p_monorep;
  double p_Monocap;
  double p_Monocytedeath;
  double p_resmacrep;
  double p_resmacCap;
  double p_resmaccyto;
  double p_resmacdeath;
  double p_Mregcyto;
  double p_Minfcyto;
  double p_HPregenv; 
  double p_trmackill;
};

} // namespace ENISI

#endif // ENISI_MacrophageGroup
