#include "ParallelDiffuser.h"
#include "compartment/DiffuserLayer.h"

using namespace ENISI;

ParallelDiffuser::~ParallelDiffuser()
{
  /* repast::Context deletes this pointer. Don't do it manually */
  //delete _p_parallelDiffuser;
}

ParallelDiffuser::ParallelDiffuser(
    ENISI::Compartment & compartment, double e, double d, bool t)
: Diffuser(compartment.newDiffuserLayer(), e, d, t)
{
  DiffuserLayer * p_layer = static_cast<DiffuserLayer *>(this->layer());

  _p_parallelDiffuser = new Diffuser(p_layer, e, d, t);

  p_layer->addAgentToRandomLocation(_p_parallelDiffuser);

  std::vector<repast::Point<int> > 
    coords = _p_parallelDiffuser->getGridCoordsAssignedToRank();
  _p_parallelDiffuser->setGridPointsToCalculate(coords);

  p_layer->setReferenceDiffuser(this);
}
