#ifndef ENISI_MSM_COMPARTMENT_DIFFUSIONLAYERIMPL_H
#define ENISI_MSM_COMPARTMENT_DIFFUSIONLAYERIMPL_H

#include "compartment/ICompartmentLayer.h" // repast::SharedContinuousSpace
#include "diffuser/DiffuserPackage.h"

class DiffuserLayerImpl 
{
public:
  typedef repast::StickyBorders Borders;
  typedef Diffuser AgentType;
  typedef repast::SimpleAdder<AgentType> Adder;
  typedef repast::SharedContinuousSpace<AgentType, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<AgentType, Borders, Adder> Grid;
  typedef repast::SharedContext<AgentType> Context;

  virtual ~DiffuserLayerImpl();
  DiffuserLayerImpl(const repast::GridDimensions &);

  void addAgentToRandomLocation(Diffuser *);
  void moveAgentTo(const Diffuser *, const repast::Point<double> &);
  void removeAgent(Diffuser * p_agent);

  virtual const repast::GridDimensions dimensions() const;

  void getLocation(const repast::AgentId & id, std::vector<double> & loc) const;

  std::vector<Diffuser*> 
    getNeighborsAt(const std::string, const repast::Point<int> &) const;

  void requestAgents();
  void synchronizeAgentStates();
  void diffuse();
  void updateReferenceDiffuserGrid();
  void setReferenceDiffuser(ParallelDiffuser *);
private:
  boost::mpi::communicator * _p_comm;
  repast::SharedContext<Diffuser> _context;
  const int _buffer;
  const static int _pDims[2];
  std::vector<int> _processDims;
  Space  _space;
  Grid   _grid;

  DiffuserPackageProvider * _p_provider;
  DiffuserPackageReceiver * _p_receiver;

  ParallelDiffuser * _p_referenceDiffuser;
}; 

/* DiffuserLayerImpl class */
const repast::GridDimensions DiffuserLayerImpl::dimensions() const 
{ return _space.dimensions(); }

void DiffuserLayerImpl::getLocation(
    const repast::AgentId & id, std::vector<double> & loc) const
{
  _space.getLocation(id, loc);
}

DiffuserLayerImpl::~DiffuserLayerImpl()
{
  delete _p_receiver; 
  delete _p_provider; 

  _context.removeProjection(&_grid);
  _context.removeProjection(&_space);
}

const int DiffuserLayerImpl::_pDims[2] = {1, 1};

DiffuserLayerImpl::DiffuserLayerImpl(const repast::GridDimensions & dimensions) 
  : _p_comm(repast::RepastProcess::instance()->getCommunicator()), 
    _context(_p_comm), _buffer(1),
    _processDims(_pDims, _pDims + sizeof _pDims / sizeof _pDims[0]), 
    _space("space", dimensions, _processDims, _buffer, _p_comm),
    _grid("grid", dimensions, _processDims, _buffer, _p_comm),
    _p_provider(new DiffuserPackageProvider(&_context)),
    _p_receiver(new DiffuserPackageReceiver(&_context))
{
  _context.addProjection(&_space);
  _context.addProjection(&_grid);
}

void DiffuserLayerImpl::removeAgent(Diffuser * p_agent)
{
  _space.removeAgent(p_agent);
  _grid.removeAgent(p_agent);
}

void DiffuserLayerImpl::addAgentToRandomLocation(Diffuser * agent) 
{
  _context.addAgent(agent);

  repast::Point<double> extents = _space.dimensions().extents();
  repast::Point<double> origin = _space.dimensions().origin();

  double xStart = origin.getX();
  double yStart = origin.getY();

  double xEnd = origin.getX() + extents.getX();
  double yEnd = origin.getY() + extents.getY();

  double xRand = repast::Random::instance()
    ->createUniDoubleGenerator(xStart, xEnd).next();

  double yRand = repast::Random::instance()
    ->createUniDoubleGenerator(yStart, yEnd).next();

  this->moveAgentTo(agent, repast::Point<double>(xRand, yRand));
}

void DiffuserLayerImpl::moveAgentTo(
    const Diffuser * agent, const repast::Point<double> & pt
) {
  _space.moveTo(agent, pt);
  _grid.moveTo(agent, repast::Point<int>(pt.getX(), pt.getY()));
}

std::vector<Diffuser *> DiffuserLayerImpl::getNeighborsAt(
    const std::string neighborName,
    const repast::Point<int> & loc) const
{
  std::vector<Diffuser*> agentsToPlay;

  repast::Moore2DGridQuery<Diffuser> moore2DQuery(&_grid);
  int range = 0;
  bool includeCenter = true;
  moore2DQuery.query(loc, range, includeCenter, agentsToPlay);

  std::vector<Diffuser *> matchingNeighbors;

  /* Pulling agents across processes can result in duplicates. Check to make
  sure we aren't returning any */
  std::map<repast::AgentId, bool> seen;

  std::vector<Diffuser*>::iterator agentToPlay = agentsToPlay.begin();
  while (agentToPlay != agentsToPlay.end()) 
  {
    if ( (*agentToPlay)->classname() == neighborName )
    {
      bool isUnique = ( seen.find((*agentToPlay)->getId()) == seen.end() );
      if (isUnique) matchingNeighbors.push_back(*agentToPlay);
    }
    seen[(*agentToPlay)->getId()] = true;
    ++agentToPlay;
  }

  return matchingNeighbors;
}

void DiffuserLayerImpl::requestAgents() 
{
  int worldSize = repast::RepastProcess::instance()->worldSize();
  int rank = repast::RepastProcess::instance()->rank();


  repast::AgentRequest req(rank);

  /* For each process */
  for(int i = 0; i < worldSize; i++)
  {                     
    if(i != rank)// ... except this one
    {                                      
      std::vector<AgentType*> agents;        
      /* Choose all agents */
      _context.selectAgents(agents);

      for(size_t j = 0; j < agents.size(); j++)
      {
	/* Transform each local agent's id into a matching non-local one */
	repast::AgentId local = agents[j]->getId();
	repast::AgentId other(local.id(), i, 0);
	other.currentRank(i);

	/* Add it to the agent request */
	req.addRequest(other);
      }
    }
  }

  repast::RepastProcess::instance()->requestAgents
    <
      AgentType, 
      DiffuserPackage, 
      DiffuserPackageProvider, 
      DiffuserPackageReceiver
    >(_context, req, *_p_provider, *_p_receiver, *_p_receiver);
}

void DiffuserLayerImpl::synchronizeAgentStates() 
{ 
  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    DiffuserPackage, 
    DiffuserPackageProvider, 
    DiffuserPackageReceiver
  >(* _p_provider, * _p_receiver);
}

void DiffuserLayerImpl::diffuse() 
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

void DiffuserLayerImpl::updateReferenceDiffuserGrid() 
{ 
  std::vector<AgentType*> remoteDiffusers;

  _context.selectAgents(
    Context::NON_LOCAL, remoteDiffusers
  );

  std::vector<AgentType*>::const_iterator remote_it = remoteDiffusers.begin();

  while(remote_it != remoteDiffusers.end())
  {
    std::vector<repast::Point<int> > 
      coords = (*remote_it)->getGridCoordsAssignedToRank();

    std::vector<double> remoteValues = 
      (*remote_it)->getAssignedGridValues();

    _p_referenceDiffuser->setValuesAtCoords(remoteValues, coords);

    remote_it++;
  }

  std::vector<AgentType*> localDiffusers;
  _context.selectAgents(
    Context::LOCAL, 
    localDiffusers
  );

  std::vector<AgentType*>::const_iterator local_it = localDiffusers.begin();

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

void DiffuserLayerImpl::setReferenceDiffuser(ParallelDiffuser * p_diffuser) 
 { _p_referenceDiffuser = p_diffuser; }
#endif
