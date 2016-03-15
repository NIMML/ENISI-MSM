#ifndef ENISI_MSM_ICOMPARTMENT_LAYER_H
#define ENISI_MSM_ICOMPARTMENT_LAYER_H

#include "SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "Moore2DGridQuery.h"
#include "agent/ENISIAgent.h"

namespace ENISI {

template <class A, class P, class PP, class PR>
class ICompartmentLayer
{ 
public:
  typedef repast::StickyBorders Borders;
  typedef repast::SimpleAdder<A> Adder;
  typedef repast::SharedContinuousSpace<A, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<A, Borders, Adder> Grid;
  typedef repast::SharedContext<A> Context;
  typedef A AgentType;

  ICompartmentLayer(const repast::GridDimensions &);
  virtual ~ICompartmentLayer();

  void addAgentToRandomLocation(A *);
  void moveAgentTo(const A *, const repast::Point<double> &);
  void removeAgent(A * p_agent);

  void getLocation(const repast::AgentId &, std::vector<double> &) const;

  std::vector<A *> 
    getNeighborsAt(const std::string, const repast::Point<int> &) const;

  const repast::GridDimensions dimensions() const;

  void requestAgents();
  void synchronizeAgentStates();

  std::vector<A *> selectAllAgents();
  std::vector<A *> selectLocalAgents();
  std::vector<A *> selectRemoteAgents();

  void addValueLayer(repast::DiscreteValueLayer<double, Borders> *);

protected:
  static const int x[2];
  boost::mpi::communicator * _p_comm;
  repast::SharedContext<A> _context;
  std::vector<int> _processDims;
  const int _buffer;
  Space * _p_space;
  Grid  * _p_grid;

  PP _provider;
  PR _receiver;
};

template <class A, class P, class PP, class PR>
const int ICompartmentLayer<A, P, PP, PR>::x[2] = {1, 1};

template <class A, class P, class PP, class PR>
ICompartmentLayer<A, P, PP, PR>::~ICompartmentLayer()
{
  /* repast::Context deletes these pointers. Don't do it yourself unless you
   * want a segfault */
  //delete _p_grid;
  //delete _p_space;
}

template <class A, class P, class PP, class PR>
ICompartmentLayer<A, P, PP, PR>::ICompartmentLayer(const repast::GridDimensions & dimensions) :
  _p_comm(repast::RepastProcess::instance()->getCommunicator()),
  _context(_p_comm), 
  _processDims(x, x + sizeof x / sizeof x[0]),
  _buffer(1),
  _p_space(new Space("space", dimensions, _processDims, _buffer, _p_comm)),
  _p_grid(new Grid("grid", dimensions, _processDims, _buffer, _p_comm)),
  _provider(&_context),
  _receiver(&_context)
{
  _context.addProjection(_p_space);
  _context.addProjection(_p_grid);
}

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::addAgentToRandomLocation(A * agent) 
{
  _context.addAgent(agent);

  repast::Point<double> extents = _p_space->dimensions().extents();
  repast::Point<double> origin = _p_space->dimensions().origin();

  double xStart = origin.getX();
  double yStart = origin.getY();

  double xEnd = origin.getX() + extents.getX();
  double yEnd = origin.getY() + extents.getY();

  double xRand = repast::Random::instance()->createUniDoubleGenerator(xStart, xEnd).next();
  double yRand = repast::Random::instance()->createUniDoubleGenerator(yStart, yEnd).next();

  moveAgentTo(agent, repast::Point<double>(xRand, yRand));
}

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::moveAgentTo(const A * agent, const repast::Point<double> & pt)
{
  _p_space->moveTo(agent, pt);
  _p_grid->moveTo(agent, repast::Point<int>(pt.getX(), pt.getY()));
}

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::removeAgent(A * p_agent) 
{
  _p_space->removeAgent(p_agent);
  _p_grid->removeAgent(p_agent);
}

template <class A, class P, class PP, class PR>
const repast::GridDimensions ICompartmentLayer<A, P, PP, PR>::dimensions() const
{ 
  return _p_space->dimensions();  
}

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::getLocation(const repast::AgentId & id,
                                                  std::vector<double> & loc) const
{ 
  _p_space->getLocation(id, loc);
}

template <class A, class P, class PP, class PR>
std::vector<A*> ICompartmentLayer<A, P, PP, PR>::getNeighborsAt(const std::string neighborName,
                                                                const repast::Point<int> & pt) const
{ 
  std::vector<A*> agentsToPlay;

  repast::Moore2DGridQuery<A> moore2DQuery(_p_grid);
  int range = 0;
  bool includeCenter = true;
  moore2DQuery.query(pt, range, includeCenter, agentsToPlay);

  std::vector<A *> matchingNeighbors;

  /* Pulling agents across processes can result in duplicates. Check to make
  sure we aren't returning any */
  std::map<repast::AgentId, bool> seen;

  typename std::vector<A*>::iterator agentToPlay = agentsToPlay.begin();
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

template <class A, class P, class PP, class PR>
std::vector<A *> ICompartmentLayer<A, P, PP, PR>::selectAllAgents() 
{ 
  std::vector<A *> agents; 
  _context.selectAgents(agents); 
  return agents;
}

template <class A, class P, class PP, class PR>
std::vector<A *> ICompartmentLayer<A, P, PP, PR>::selectLocalAgents() 
{ 
  std::vector<A *> agents; 
  _context.selectAgents(Context::LOCAL, agents); 
  return agents;
}

template <class A, class P, class PP, class PR>
std::vector<A *> ICompartmentLayer<A, P, PP, PR>::selectRemoteAgents() 
{ 
  std::vector<A *> agents; 
  _context.selectAgents(Context::NON_LOCAL, agents); 
  return agents;
}

template <class A, class P, class PP, class PR>
void ICompartmentLayer<A, P, PP, PR>::addValueLayer(
    repast::DiscreteValueLayer<double, Borders> * p_vl)
{
  _context.addValueLayer(p_vl);
}

} // namespace ENISI

#endif
