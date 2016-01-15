#ifndef ENISI_MSM_COMPARTMENT_CELLLAYERIMPL_H
#define ENISI_MSM_COMPARTMENT_CELLLAYERIMPL_H

#include "compartment/ICompartmentLayer.h" // repast::SharedContinuousSpace
#include "agent/AgentGroupPackage.h"

class CellLayerImpl 
{
public:
  typedef repast::StickyBorders Borders;
  typedef repast::SimpleAdder<ENISIAgent> Adder;
  typedef repast::SharedContinuousSpace<ENISIAgent, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<ENISIAgent, Borders, Adder> Grid;
  typedef repast::SharedContext<ENISIAgent> Context;
  typedef ENISIAgent AgentType;

  virtual ~CellLayerImpl();
  CellLayerImpl(const repast::GridDimensions &);

  void addAgentToRandomLocation(ENISIAgent *);
  void moveAgentTo(const ENISIAgent *, const repast::Point<double> &);
  void removeAgent(ENISIAgent * p_agent);

  virtual const repast::GridDimensions dimensions() const;

  void getLocation(const repast::AgentId & id, std::vector<double> & loc) const;

  Space * space();
  Grid * grid();
  Context * context();

  std::vector<ENISIAgent*> 
    getNeighborsAt(const std::string, const repast::Point<int> &) const;

  void requestAgents();
  void synchronizeAgentStates();
  void act();
private:
  const static int x[2];
  boost::mpi::communicator * _p_comm;
  repast::SharedContext<ENISIAgent> _context;
  std::vector<int> _processDims;
  const int _buffer;
  Space  _space;
  Grid   _grid;

  AgentGroupPackageProvider * _p_provider;
  AgentGroupPackageReceiver * _p_receiver;
}; 

/* CellLayerImpl class */
const repast::GridDimensions CellLayerImpl::dimensions() const 
{ return _space.dimensions(); }

void CellLayerImpl::getLocation(
    const repast::AgentId & id, std::vector<double> & loc) const
{
  _space.getLocation(id, loc);
}

CellLayerImpl::Space * CellLayerImpl::space() { return &_space; } 
CellLayerImpl::Grid * CellLayerImpl::grid() { return &_grid; } 
CellLayerImpl::Context * CellLayerImpl::context() { return &_context; } 

CellLayerImpl::~CellLayerImpl()
{
  delete _p_receiver;
  delete _p_provider;
  _context.removeProjection(&_space);
  _context.removeProjection(&_grid);
}

const int CellLayerImpl::x[2] = {1, 1};

CellLayerImpl::CellLayerImpl(const repast::GridDimensions & dimensions) 
:   _p_comm(repast::RepastProcess::instance()->getCommunicator()), 
    _context(_p_comm), 
    _processDims(x, x + sizeof x / sizeof x[0]), _buffer(1),
    _space("space", dimensions, _processDims, _buffer, _p_comm),
    _grid("grid", dimensions, _processDims, _buffer, _p_comm),
    _p_provider(new AgentGroupPackageProvider(&_context)),
    _p_receiver(new AgentGroupPackageReceiver(&_context))

{
  _context.addProjection(&_space);
  _context.addProjection(&_grid);
}

void CellLayerImpl::removeAgent(ENISIAgent * p_agent)
{
  _space.removeAgent(p_agent);
  _grid.removeAgent(p_agent);
}

void CellLayerImpl::addAgentToRandomLocation(ENISIAgent * agent) 
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

void CellLayerImpl::moveAgentTo(
    const ENISIAgent * agent, const repast::Point<double> & pt
) {
  _space.moveTo(agent, pt);
  _grid.moveTo(agent, repast::Point<int>(pt.getX(), pt.getY()));
}

std::vector<ENISIAgent *> CellLayerImpl::getNeighborsAt(
    const std::string neighborName,
    const repast::Point<int> & loc) const
{
  std::vector<ENISIAgent*> agentsToPlay;

  repast::Moore2DGridQuery<ENISIAgent> moore2DQuery(&_grid);
  int range = 0;
  bool includeCenter = true;
  moore2DQuery.query(loc, range, includeCenter, agentsToPlay);

  std::vector<ENISIAgent *> matchingNeighbors;

  /* Pulling agents across processes can result in duplicates. Check to make
  sure we aren't returning any */
  std::map<repast::AgentId, bool> seen;

  std::vector<ENISIAgent*>::iterator agentToPlay = agentsToPlay.begin();
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

void CellLayerImpl::requestAgents() 
{
  int rank = repast::RepastProcess::instance()->rank();

  int worldSize = repast::RepastProcess::instance()->worldSize();

  repast::AgentRequest req(rank);

  /* For each process */
  for(int i = 0; i < worldSize; i++)
  {                     
    if(i != rank)// ... except this one
    {                                      
      std::vector<ENISIAgent*> agents;        
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
      ENISIAgent, 
      AgentGroupPackage, 
      AgentGroupPackageProvider, 
      AgentGroupPackageReceiver
    >(_context, req, *_p_provider, *_p_receiver, *_p_receiver);

}

void CellLayerImpl::synchronizeAgentStates() 
{ 
  repast::RepastProcess::instance()->synchronizeAgentStates
  <
    AgentGroupPackage, 
    AgentGroupPackageProvider, 
    AgentGroupPackageReceiver
  >(*_p_provider, *_p_receiver);
}

void CellLayerImpl::act() { }
#endif
