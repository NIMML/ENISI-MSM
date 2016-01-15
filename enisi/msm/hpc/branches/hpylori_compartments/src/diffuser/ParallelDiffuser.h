#ifndef ENISI_MSM_PARALLELDIFFUSER_H_
#define ENISI_MSM_PARALLELDIFFUSER_H_

#include "diffuser/Diffuser.h"
#include "compartment/Compartment.h"

class ParallelDiffuser : public Diffuser
{
public:
  ParallelDiffuser(ENISI::Compartment &, 
	   double e = 1.0,
	   double d = 1.0,
	   bool t = true);
  virtual ~ParallelDiffuser();

private:
  Diffuser * _p_parallelDiffuser;
};

#endif
