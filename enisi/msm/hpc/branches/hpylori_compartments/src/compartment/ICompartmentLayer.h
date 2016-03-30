#ifndef ENISI_MSM_ICOMPARTMENT_LAYER_H
#define ENISI_MSM_ICOMPARTMENT_LAYER_H

#include "repast_hpc/SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "repast_hpc/SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "repast_hpc/Moore2DGridQuery.h"
#include "agent/ENISIAgent.h"
#include "agent/AgentStates.h"
#include "agent/SharedValueLayer.h"
#include "grid/Borders.h"

namespace ENISI {

template <class Agent, class Package, class PackageProvider, class PackageReceiver>
class ICompartmentLayer
{ 
public:
  typedef ENISI::SimpleBorders Transformer;
  typedef repast::SimpleAdder< Agent > Adder;
  typedef repast::SharedContinuousSpace<Agent, Transformer, Adder> Space;
  typedef repast::SharedDiscreteSpace<Agent, Transformer, Adder> Grid;
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
    mpSharedValues(NULL),
    mSpaceDimensions(),
    mGridDimensions(),
    _provider(&_context),
    _receiver(&_context),
    mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0)),
    _conversion(spaceDimension.dimensionCount())
  {
    determineProcessDimensions(gridDimension);
    //
    _p_space = new Space(name +"-space", spaceDimension, _processDims, _buffer, _p_comm);
    _p_grid = new Grid(name +"-grid", gridDimension, _processDims, _buffer, _p_comm);
    repast::GridDimensions ProcessDimensions(repast::Point< double >(0.0, 0.0), repast::Point< double >(_processDims[0], _processDims[1]));
    mpSharedValues = new Grid(name +"-values", ProcessDimensions, _processDims, _buffer, _p_comm);

    _context.addProjection(_p_space);
    _context.addProjection(_p_grid);
    _context.addProjection(mpSharedValues);

    mSpaceDimensions = _p_space->dimensions();
    mGridDimensions = _p_grid->dimensions();
    mSharedValueDimensions = mpSharedValues->dimensions();

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

    int n;
    int nMin;
    int nMax;

    size_t i = Borders::X;

    if (dimension.dimensionCount() > 2)
      {
        n = (int) pow(worldSize * dimension.extents(i) * dimension.extents(i) / (dimension.extents(i + 1) * dimension.extents(i + 2)), 1.0/3.0);

        nMax = n;
        while (worldSize % nMax > worldSize % (nMax + 1)) nMax++;

        nMin = n;
        while (worldSize % nMin > worldSize % (nMin - 1)) nMin--;

        n = (n - nMin < nMax -n) ? nMin : nMax;

        _processDims[i] = n;
        worldSize /= n;
        i++;
      }

    if (dimension.dimensionCount() > 1)
      {
        n = (int) sqrt(worldSize * dimension.extents(i) / dimension.extents(i + 1));

        nMax = n;
        while (worldSize % nMax > worldSize % (nMax + 1)) nMax++;

        nMin = n;
        while (worldSize % nMin > worldSize % (nMin - 1)) nMin--;

        n = (n - nMin < nMax -n) ? nMin : nMax;

        _processDims[i] = n;
        worldSize /= n;
        i++;
      }

    if (dimension.dimensionCount() > 0)
      {
        _processDims[i] = worldSize;
      }
  }

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, std::vector< Agent * > &out)
  {
    if (range == 0)
      {
        getAgents(pt, out);
      }

    repast::Moore2DGridQuery< Agent > moore2DQuery(_p_grid);
    moore2DQuery.query(pt, range, true, out);
  }

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, const int & types, std::vector< Agent * > &out)
  {
    out.clear();
    std::vector< Agent * > Tmp;
    getNeighbors(pt, range, Tmp);

    typename std::vector< Agent * >::const_iterator it = Tmp.begin();
    typename std::vector< Agent * >::const_iterator end = Tmp.end();

    for (; it != end; ++it)
      {
        if ((*it)->getType() & types)
          {
            out.push_back(*it);
          }
      }
  }

  void getAgents(const repast::Point< int > &pt, std::vector< Agent * > &out)
  {
    _p_grid->getObjectsAt(pt, out);
  }

  void getAgents(const repast::Point< int > &pt, const int & types, std::vector< Agent * > &out)
  {
    out.clear();
    std::vector< Agent * > Tmp;
    _p_grid->getObjectsAt(pt, Tmp);

    typename std::vector< Agent * >::const_iterator it = Tmp.begin();
    typename std::vector< Agent * >::const_iterator end = Tmp.end();

    for (; it != end; ++it)
      {
        if ((*it)->getType() & types)
          {
            out.push_back(*it);
          }
      }
  }

  Agent * getAgent(const repast::AgentId &id)
  {
    return _context.getAgent(id);
  }

  bool moveTo(const repast::AgentId &id, const std::vector< double > & pt)
  {
    return _p_space->moveTo(id, pt) && _p_grid->moveTo(id, spaceToGrid(pt));
  }

  bool addAgent(Agent * agent, const std::vector< double > & pt)
  {
    Agent * pAgent = _context.addAgent(agent);
    repast::AgentId Id = pAgent->getId();

    return _p_space->moveTo(Id, pt) && _p_grid->moveTo(Id, spaceToGrid(pt));
  }

  bool addAgentToRandomLocation(Agent * agent)
  {
    std::vector< double > Location(2);
    repast::Point<double> extents = mSpaceDimensions.extents();
    repast::Point<double> origin = mSpaceDimensions.origin();

    Location[Borders::X] = origin.getX() + extents.getX() * mUniform.next();
    Location[Borders::Y] = origin.getY() + extents.getY() * mUniform.next();

    return addAgent(agent, Location);
  }

  void removeAgent (Agent * pAgent)
  {
    _p_space->removeAgent(pAgent);
    _p_grid->removeAgent(pAgent);
    _context.removeAgent(pAgent);
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

  const repast::GridDimensions & spaceDimensions() const
  {
    return mSpaceDimensions;
  }

  const repast::GridDimensions & gridDimensions() const
  {
    return mGridDimensions;
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

  bool addDiffuserValues(SharedValueLayer * pDiffuserValues)
  {
    Agent * pAgent = _context.addAgent(pDiffuserValues);
    repast::AgentId Id = pAgent->getId();

    return mpSharedValues->moveTo(Id, repast::Point< int >(mSharedValueDimensions.origin()[0], mSharedValueDimensions.origin()[1]));
  }

  void addValueLayer(repast::DiscreteValueLayer<double, Transformer> * p_vl)
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
  Grid * _p_grid;
  Grid * mpSharedValues;
  repast::GridDimensions mSpaceDimensions;
  repast::GridDimensions mGridDimensions;
  repast::GridDimensions mSharedValueDimensions;
  PackageProvider _provider;
  PackageReceiver _receiver;
  repast::DoubleUniformGenerator mUniform;
private:
  std::vector< Space2Grid > _conversion;
};

template <class Agent, class Package, class PackageProvider, class PackageReceiver>
const int ICompartmentLayer<Agent, Package, PackageProvider, PackageReceiver>::x[2] = {1, 1};

} // namespace ENISI

#endif
