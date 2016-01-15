#include "compartment/DiffuserLayer.h"
#include "diffuser/DiffuserPackage.h"

/* DiffuserLayer class */
DiffuserLayer::DiffuserLayer(const repast::GridDimensions & dims)
  : ICompartmentLayer(dims)
  { }

void DiffuserLayer::diffuse() 
{ 
  std::vector<AgentType*> localDiffusers;
  _context.selectAgents(
    Context::LOCAL, 
    localDiffusers
  );

  std::vector<AgentType*> remoteDiffusers;
  _context.selectAgents(
    Context::NON_LOCAL, 
    remoteDiffusers
  );

  std::vector<AgentType*>::const_iterator local_it = localDiffusers.begin();

  while(local_it != localDiffusers.end())
  {
    (*local_it)->setGrid(_p_referenceDiffuser->getGrid());
    (*local_it)->diffuse();
    local_it++;
  }
  synchronizeAgentStates();
}

void DiffuserLayer::updateReferenceDiffuserGrid() 
{ 
  std::vector<Diffuser*> remoteDiffusers;

  _context.selectAgents(
    Context::NON_LOCAL, remoteDiffusers
  );

  std::vector<Diffuser*>::const_iterator remote_it = remoteDiffusers.begin();

  while(remote_it != remoteDiffusers.end())
  {
    std::vector<repast::Point<int> > 
      coords = (*remote_it)->getGridCoordsAssignedToRank();

    std::vector<double> remoteValues = 
      (*remote_it)->getAssignedGridValues();

    _p_referenceDiffuser->setValuesAtCoords(remoteValues, coords);

    remote_it++;
  }

  std::vector<Diffuser*> localDiffusers;
  _context.selectAgents(
    Context::LOCAL, 
    localDiffusers
  );

  std::vector<Diffuser*>::const_iterator local_it = localDiffusers.begin();

  while(local_it != localDiffusers.end())
  {
    std::vector<repast::Point<int> > 
      coords = (*local_it)->getGridCoordsAssignedToRank();

    std::vector<double> localValues = 
      (*local_it)->getAssignedGridValues();

    _p_referenceDiffuser->setValuesAtCoords(localValues, coords);

    local_it++;
  }
}

void DiffuserLayer::setReferenceDiffuser(ParallelDiffuser * p_diffuser) 
 { _p_referenceDiffuser = p_diffuser; }
