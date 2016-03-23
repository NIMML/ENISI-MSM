#ifndef ENISI_MSM_ICOMPARTMENT_LAYER_H
#define ENISI_MSM_ICOMPARTMENT_LAYER_H

#include "repast_hpc/SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "repast_hpc/SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "repast_hpc/Moore2DGridQuery.h"
#include "agent/ENISIAgent.h"
#include "agent/AgentStates.h"

#include "grid/Borders.h"

namespace ENISI {

template <class Agent, class Package, class PackageProvider, class PackageReceiver>
class ICompartmentLayer
{ 
public:
  typedef ENISI::Borders Borders;
  typedef repast::SimpleAdder< Agent > Adder;
  typedef repast::SharedContinuousSpace<Agent, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<Agent, Borders, Adder> Grid;
  typedef repast::SharedContext< Agent > Context;
  typedef Agent AgentType;

  ICompartmentLayer(const std::string & name,
                    const repast::GridDimensions & spaceDimension,
                    const repast::GridDimensions & gridDimension) :
    _p_comm(repast::RepastProcess::instance()->getCommunicator()),
    _context(_p_comm),
    _processDims(spaceDimension.dimensionCount()),
    _buffer(1),
    _p_space(NULL),
    _p_grid(NULL),
    _provider(&_context),
    _receiver(&_context),
    _conversion(spaceDimension.dimensionCount())
  {
    determineProcessDimensions(gridDimension);
    //
    _p_space = new Space(name +"-space", spaceDimension, _processDims, _buffer, _p_comm);
    _p_grid = new Grid(name +"-grid", gridDimension, _processDims, _buffer, _p_comm);

    _context.addProjection(_p_space);
    _context.addProjection(_p_grid);

    std::vector< Space2Grid >::iterator itConversion = _conversion.begin();
    std::vector< Space2Grid >::iterator endConversion = _conversion.end();

    std::vector< double >::const_iterator itGridOrigin = gridDimension.origin().begin();
    std::vector< double >::const_iterator itGridExtents = gridDimension.extents().begin();


    std::vector< double >::const_iterator itSpaceOrigin = spaceDimension.origin().begin();
    std::vector< double >::const_iterator itSpaceExtents = spaceDimension.extents().begin();

    for (; itConversion != endConversion; ++itConversion, ++itGridOrigin, ++itGridExtents, ++itSpaceOrigin, ++itSpaceExtents)
      {
        itConversion->grid = round(*itGridOrigin);
        itConversion->space = *itSpaceOrigin;
        itConversion->scale = *itGridExtents / *itSpaceExtents;
      }
  }

  virtual ~ICompartmentLayer()
  {}

  void determineProcessDimensions(const repast::GridDimensions & dimension)
  {
    int worldSize = repast::RepastProcess::instance()->worldSize();

    int nx;
    int nxMin;
    int nxMax;

    size_t coordinate = Borders::X;

    if (dimension.dimensionCount() > 2)
      {
        nx = (int) pow(worldSize * dimension.extents(coordinate) * dimension.extents(coordinate) / (dimension.extents(coordinate + 1) * dimension.extents(coordinate + 2)), 1.0/3.0);

        nxMax = nx;
        while (worldSize % nxMax > worldSize % (nxMax + 1)) nxMax++;

        nxMin = nx;
        while (worldSize % nxMin > worldSize % (nxMin - 1)) nxMin--;

        nx = (nx - nxMin < nxMax -nx) ? nxMin : nxMax;

        _processDims[coordinate] = nx;
        worldSize /= nx;
        coordinate++;
      }

    if (dimension.dimensionCount() > 1)
      {
        nx = (int) sqrt(worldSize * dimension.extents(coordinate) / dimension.extents(coordinate + 1));

        nxMax = nx;
        while (worldSize % nxMax > worldSize % (nxMax + 1)) nxMax++;

        nxMin = nx;
        while (worldSize % nxMin > worldSize % (nxMin - 1)) nxMin--;

        nx = (nx - nxMin < nxMax -nx) ? nxMin : nxMax;

        _processDims[coordinate] = nx;
        worldSize /= nx;
        coordinate++;
      }

    if (dimension.dimensionCount() > 0)
      {
        _processDims[coordinate] = worldSize;
      }
  }

  void addAgentToRandomLocation(Agent * agent)
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

  repast::Point<int> spaceToGrid(const repast::Point<double> & space) const
  {
    std::vector< int > Grid(_p_space->dimensions().dimensionCount(), 0);

    std::vector< double >::const_iterator itSpace = space.coords().begin();
    std::vector< double >::const_iterator endSpace = space.coords().end();
    std::vector< Space2Grid >::const_iterator itConversion = _conversion.begin();
    std::vector< int >::iterator itGrid = Grid.begin();

    for (; itSpace != endSpace; ++itSpace, ++itConversion, ++itGrid)
      {
        *itGrid = floor(itConversion->grid + itConversion->scale * (*itSpace - itConversion->space));
      }

    return Grid;
  }

  void moveAgentTo(const Agent *agent , const repast::Point<double> & pt)
  {
    _p_space->moveTo(agent, pt);
    _p_grid->moveTo(agent, spaceToGrid(pt));
  }

  void removeAgent(Agent * p_agent)
  {
    _p_space->removeAgent(p_agent);
    _p_grid->removeAgent(p_agent);
  }

  void getLocation(const repast::AgentId & id, std::vector<double> & loc) const
  {
    _p_space->getLocation(id, loc);
  }

  std::vector< Agent * > getNeighborsAt(const std::string neighborName, const repast::Point<int> & pt) const
  {
    std::vector< Agent *> agentsToPlay;

    repast::Moore2DGridQuery< Agent > moore2DQuery(_p_grid);
    int range = 0;
    bool includeCenter = true;
    moore2DQuery.query(pt, range, includeCenter, agentsToPlay);

    std::vector< Agent * > matchingNeighbors;

    /* Pulling agents across processes can result in duplicates. Check to make
    sure we aren't returning any */
    std::map<repast::AgentId, bool> seen;

    typename std::vector< Agent *>::iterator agentToPlay = agentsToPlay.begin();
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

  const repast::GridDimensions dimensions() const
  {
    return _p_space->dimensions();
  }

  void requestAgents()
  {
    int worldSize = repast::RepastProcess::instance()->worldSize();
    int rank = repast::RepastProcess::instance()->rank();

    repast::AgentRequest req(rank);

    /* For each process */
    for(int i = 0; i < worldSize; i++)
    {
      if(i != rank)// ... except this one
      {
        std::vector< Agent * > agents;
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

    repast::RepastProcess::instance()->requestAgents<Agent, Package, PackageProvider, PackageReceiver>(_context, req, _provider, _receiver, _receiver);
  }


  void synchronizeAgentStates()
  {
    repast::RepastProcess::instance()->synchronizeAgentStates<Package, PackageProvider, PackageReceiver>(_provider, _receiver);
  }


  std::vector< Agent * > selectAllAgents()
  {
    std::vector< Agent * > agents;
    _context.selectAgents(agents);
    return agents;
  }

  std::vector< Agent * > selectLocalAgents()
  {
    std::vector< Agent * > agents;
    _context.selectAgents(Context::LOCAL, agents);
    return agents;
  }

  std::vector< Agent * > selectRemoteAgents()
  {
    std::vector< Agent * > agents;
    _context.selectAgents(Context::NON_LOCAL, agents);
    return agents;
  }

  void addValueLayer(repast::DiscreteValueLayer<double, Borders> * p_vl)
  {
    _context.addValueLayer(p_vl);
  }

protected:
  static const int x[2];
  boost::mpi::communicator * _p_comm;
  repast::SharedContext< Agent > _context;
  std::vector<int> _processDims;
  const int _buffer;
  Space * _p_space;
  Grid  * _p_grid;
  PackageProvider _provider;
  PackageReceiver _receiver;

private:
  std::vector< Space2Grid > _conversion;
};

template <class Agent, class Package, class PackageProvider, class PackageReceiver>
const int ICompartmentLayer<Agent, Package, PackageProvider, PackageReceiver>::x[2] = {1, 1};

} // namespace ENISI

#endif
