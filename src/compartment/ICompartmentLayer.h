#ifndef ENISI_MSM_ICOMPARTMENT_LAYER_H
#define ENISI_MSM_ICOMPARTMENT_LAYER_H

#include "repast_hpc/SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "repast_hpc/SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "repast_hpc/Moore2DGridQuery.h"

#include "agent/ENISIAgent.h"
#include "agent/AgentStates.h"
#include "agent/SharedValueLayer.h"
#include "grid/Borders.h"
#include "grid/SharedSpace.h"
#include "DataWriter/LocalFile.h"

namespace ENISI {

template <class AgentType, class Package, class PackageExchange>
class ICompartmentLayer
{ 
private:
  struct Space2Grid
    {
      double grid;
      double space;
      double scale;
    };


public:
  typedef ENISI::SimpleBorders Transformer;
  typedef repast::SimpleAdder< AgentType > Adder;
  typedef ENISI::SharedContinuousSpace<AgentType, Transformer, Adder> Space;
  typedef ENISI::SharedDiscreteSpace<AgentType, Transformer, Adder> Grid;
  typedef repast::SharedContext< AgentType > Context;
  typedef boost::filter_iterator<repast::IsLocalAgent< AgentType >, typename repast::SharedContext< AgentType >::const_iterator> LocalIterator;

//  typedef Agent AgentType;

  ICompartmentLayer(const std::string & name,
                    const std::vector<int> & processDimensions,
                    const repast::GridDimensions & spaceDimension,
                    const repast::GridDimensions & gridDimension) :
    mpCommunicator(repast::RepastProcess::instance()->getCommunicator()),
    mCellContext(mpCommunicator),
    mDiffuserContext(mpCommunicator),
    mBufferSize(1),
    mpSpace(NULL),
    mpGrid(NULL),
    mpSharedValues(NULL),
    mLocalSpaceDimensions(),
    mLocalGridDimensions(),
    mpCellExchange(&mCellContext),
    mpDiffuserExchange(&mDiffuserContext),
    mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0)),
    mSpace2Grid(spaceDimension.dimensionCount()),
    mpGridTopology(NULL),
    mpDiffuserTopology(NULL)
  {
    typename std::vector< Space2Grid >::iterator itConversion = mSpace2Grid.begin();
    typename std::vector< Space2Grid >::iterator endConversion = mSpace2Grid.end();

    std::vector< double >::const_iterator itGridOrigin = gridDimension.origin().begin();
    std::vector< double >::const_iterator itGridExtents = gridDimension.extents().begin();

    std::vector< double >::const_iterator itSpaceOrigin = spaceDimension.origin().begin();
    std::vector< double >::const_iterator itSpaceExtents = spaceDimension.extents().begin();

    double SpaceBufferScale = 0;

    for (; itConversion != endConversion; ++itConversion, ++itGridOrigin, ++itGridExtents, ++itSpaceOrigin, ++itSpaceExtents)
      {
        itConversion->grid = round(*itGridOrigin);
        itConversion->space = *itSpaceOrigin;
        itConversion->scale = *itGridExtents / *itSpaceExtents;

        SpaceBufferScale = std::max(SpaceBufferScale,  *itSpaceExtents / *itGridExtents);
      }

    mpSpace = new Space(name + "-space", spaceDimension, processDimensions, SpaceBufferScale * mBufferSize, mpCommunicator);
    mpGrid = new Grid(name + "-grid", gridDimension, processDimensions, mBufferSize, mpCommunicator);
    mpGridTopology = new repast::CartTopology(processDimensions, gridDimension.origin().coords(), gridDimension.extents().coords(), Transformer().isPeriodic(), mpCommunicator);

    /*
    repast::Neighbors Neighbors;
    mpGridTopology->createNeighbors(Neighbors);
    LocalFile::debug() << Neighbors;
    */

    repast::GridDimensions ProcessDimensions(repast::Point< double >(0.0, 0.0), repast::Point< double >(processDimensions[0], processDimensions[1]));
    mpSharedValues = new Grid(name + "-values", ProcessDimensions, processDimensions, mBufferSize, mpCommunicator);
    mpDiffuserTopology = new repast::CartTopology(processDimensions, ProcessDimensions.origin().coords(), ProcessDimensions.extents().coords(), Transformer().isPeriodic(), mpCommunicator);

    mCellContext.addProjection(mpSpace);
    mCellContext.addProjection(mpGrid);
    mDiffuserContext.addProjection(mpSharedValues);

    mLocalSpaceDimensions = mpSpace->dimensions();
    mLocalGridDimensions = mpGrid->dimensions();
    mLocalSharedValueDimensions = mpSharedValues->dimensions();
  }

  virtual ~ICompartmentLayer()
  {}

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, std::vector< AgentType * > &out)
  {
    if (range == 0)
      {
        getAgents(pt, out);
      }

    repast::Moore2DGridQuery< AgentType > moore2DQuery(mpGrid);
    moore2DQuery.query(pt, range, true, out);
  }

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, const int & types, std::vector< AgentType * > &out)
  {
    out.clear();
    std::vector< AgentType * > Tmp;
    getNeighbors(pt, range, Tmp);

    typename std::vector< AgentType * >::const_iterator it = Tmp.begin();
    typename std::vector< AgentType * >::const_iterator end = Tmp.end();

    for (; it != end; ++it)
      {
        if ((*it)->getType() & types)
          {
            out.push_back(*it);
          }
      }
  }

  void getAgents(const repast::Point< int > &pt, std::vector< AgentType * > &out)
  {
    mpGrid->getObjectsAt(pt, out);
  }

  void getAgents(const repast::Point< int > &pt, const int & types, std::vector< AgentType * > &out)
  {
    out.clear();
    std::vector< AgentType * > Tmp;
    mpGrid->getObjectsAt(pt, Tmp);

    typename std::vector< AgentType * >::const_iterator it = Tmp.begin();
    typename std::vector< AgentType * >::const_iterator end = Tmp.end();

    for (; it != end; ++it)
      {
        if ((*it)->getType() & types)
          {
            out.push_back(*it);
          }
      }
  }

  AgentType * getAgent(const repast::AgentId &id)
  {
    return mCellContext.getAgent(id);
  }

  bool moveTo(const repast::AgentId &id, const std::vector< double > & pt)
  {
    return mpSpace->moveTo(id, pt) && mpGrid->moveTo(id, spaceToGrid(pt));
  }

  bool addAgent(AgentType * agent, const std::vector< double > & pt)
  {
    AgentType * pAgent = mCellContext.addAgent(agent);
    repast::AgentId Id = pAgent->getId();

    return mpSpace->moveTo(Id, pt) && mpGrid->moveTo(Id, spaceToGrid(pt));
  }

  bool addAgentToRandomLocation(AgentType * agent)
  {
    std::vector< double > Location(2);
    const repast::Point<double> & origin = mLocalSpaceDimensions.origin();
    const repast::Point<double> & extents = mLocalSpaceDimensions.extents();

    Location[Borders::X] = origin.getX() + extents.getX() * mUniform.next();
    Location[Borders::Y] = origin.getY() + extents.getY() * mUniform.next();

    return addAgent(agent, Location);
  }

  void removeAgent (AgentType * pAgent)
  {
    mpSpace->removeAgent(pAgent);
    mpGrid->removeAgent(pAgent);
    mCellContext.removeAgent(pAgent);
  }

  int spaceToGrid(const Borders::Coodinate & coordinate, const double & space) const
  {
    return floor(space * mSpace2Grid[coordinate].scale);
  }

  std::vector< int > spaceToGrid(const std::vector< double > & space) const
  {
    std::vector< int > Grid(mpSpace->dimensions().dimensionCount(), 0);

    std::vector< double >::const_iterator itSpace = space.begin();
    std::vector< double >::const_iterator endSpace = space.end();
    typename std::vector< Space2Grid >::const_iterator itConversion = mSpace2Grid.begin();
    std::vector< int >::iterator itGrid = Grid.begin();

    for (; itSpace != endSpace; ++itSpace, ++itConversion, ++itGrid)
      {
        *itGrid = floor(itConversion->grid + itConversion->scale * (*itSpace - itConversion->space));
      }

    return Grid;
  }

  double gridToSpace(const Borders::Coodinate &coordinate, const int & grid) const
  {
    return grid / mSpace2Grid[coordinate].scale;
  }

  std::vector< double > gridToSpace(const std::vector< int > & grid) const
  {
    std::vector< double > Space(mpSpace->dimensions().dimensionCount(), 0);

    std::vector< int >::const_iterator itGrid = grid.begin();
    std::vector< int >::const_iterator endGrid = grid.end();
    typename std::vector< Space2Grid >::const_iterator itConversion = mSpace2Grid.begin();
    std::vector< double >::iterator itSpace = Space.begin();

    for (; itGrid != endGrid; ++itGrid, ++itConversion, ++itSpace)
      {
        *itSpace = itConversion->space + (*itGrid - itConversion->grid) / itConversion->scale;
      }

    return Space;
  }

  void getLocation(const repast::AgentId & id, std::vector<double> & loc) const
  {
    mpSpace->getLocation(id, loc);
  }

  std::vector< AgentType * > getNeighborsAt(const std::string neighborName, const repast::Point<int> & pt) const
  {
    std::vector< AgentType *> agentsToPlay;

    repast::Moore2DGridQuery< AgentType > moore2DQuery(mpGrid);
    int range = 0;
    bool includeCenter = true;
    moore2DQuery.query(pt, range, includeCenter, agentsToPlay);

    std::vector< AgentType * > matchingNeighbors;

    /* Pulling agents across processes can result in duplicates. Check to make
    sure we aren't returning any */
    std::map<repast::AgentId, bool> seen;

    typename std::vector< AgentType *>::iterator agentToPlay = agentsToPlay.begin();

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

  const repast::GridDimensions & localSpaceDimensions() const
  {
    return mLocalSpaceDimensions;
  }

  const repast::GridDimensions & localGridDimensions() const
  {
    return mLocalGridDimensions;
  }

  void requestAgents(repast::AgentRequest & request)
  {
    repast::RepastProcess::instance()->requestAgents<AgentType, Package, PackageExchange, PackageExchange>(mCellContext, request, mpCellExchange, mpCellExchange, mpCellExchange);
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
        std::vector< AgentType * > agents;
        /* Choose all agents */
        mCellContext.selectAgents(agents);

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

    requestAgents(req);
  }

  void synchronizeCells()
  {
    // mpGrid->balance does not work since we may push to a non neighbor

    // Find all local agents which are not part of the local space and move them to the new process
	LocalIterator itLocal = localBegin();
	LocalIterator endLocal = localEnd();

    for (; itLocal != endLocal; ++itLocal)
      {
      std::vector< double > Location(2, 0);
      repast::AgentId Id = (*itLocal)->getId();

      getLocation(Id, Location);

      if (!mLocalSpaceDimensions.contains(Location))
        {
          int Rank = getRank(Location, 0, 0);
          // LocalFile::debug() << "Moving Agent: " << (*itLocal)->classname() << " to Rank: " << Rank << std::endl;
          repast::RepastProcess::instance()->moveAgent(Id, Rank);
        }
      }

    repast::RepastProcess::instance()->synchronizeAgentStatus<AgentType, Package, PackageExchange, PackageExchange>(mCellContext, mpCellExchange, mpCellExchange, mpCellExchange);
    repast::RepastProcess::instance()->synchronizeProjectionInfo<AgentType, Package, PackageExchange, PackageExchange, PackageExchange>(mCellContext, mpCellExchange, mpCellExchange, mpCellExchange);
    repast::RepastProcess::instance()->synchronizeAgentStates<Package, PackageExchange, PackageExchange>(mpCellExchange, mpCellExchange);
  }

  LocalIterator localBegin()
  {
	return mCellContext.localBegin();
  }

  LocalIterator localEnd()
  {
	return mCellContext.localEnd();
  }

  void synchronizeDiffuser()
  {
    repast::RepastProcess::instance()->synchronizeProjectionInfo<AgentType, Package, PackageExchange, PackageExchange, PackageExchange>(mDiffuserContext, mpDiffuserExchange, mpDiffuserExchange, mpDiffuserExchange);
    repast::RepastProcess::instance()->synchronizeAgentStates<Package, PackageExchange, PackageExchange>(mpDiffuserExchange, mpDiffuserExchange);
  }

  Context & getCellContext()
  {
    return mCellContext;
  }

  Context & getValueContext()
  {
    return mDiffuserContext;
  }

  size_t getRank(const std::vector< double > & location, const double & xOffset, const double & yOffset) const
  {
    std::vector< double > Location = location;
    Location[Borders::X] += xOffset;
    Location[Borders::Y] += yOffset;

    return getRank(spaceToGrid(Location), 0, 0);
  }

  size_t getRank(const std::vector< int > & location, const int & xOffset, const int & yOffset) const
  {
    std::vector< int > Location(2);
    Location[Borders::X] = floor((location[Borders::Y] + yOffset) / mLocalGridDimensions.extents(Borders::Y));
    Location[Borders::Y] = floor((location[Borders::X] + xOffset)/ mLocalGridDimensions.extents(Borders::X));

    size_t Rank = mpGridTopology->getRank(Location, 0, 0);

    return Rank;
  }

  std::vector< AgentType * > selectAllAgents()
  {
    std::vector< AgentType * > agents;
    mCellContext.selectAgents(agents);
    return agents;
  }

  std::vector< AgentType * > selectLocalAgents()
  {
    std::vector< AgentType * > agents;
    mCellContext.selectAgents(Context::LOCAL, agents);
    return agents;
  }

  std::vector< AgentType * > selectRemoteAgents()
  {
    std::vector< AgentType * > agents;
    mCellContext.selectAgents(Context::NON_LOCAL, agents);
    return agents;
  }

  bool addDiffuserValues(SharedValueLayer * pDiffuserValues, Compartment * pCompartment)
  {
    AgentType * pAgent = mDiffuserContext.addAgent(pDiffuserValues);
    repast::AgentId Id = pAgent->getId();
    mpSharedValues->setFunctor(new Functor< Compartment >(pCompartment, &Compartment::getBorderValuesToPush));

    return mpSharedValues->moveTo(Id, repast::Point< int >(mLocalSharedValueDimensions.origin()[0], mLocalSharedValueDimensions.origin()[1]));
  }

  void addCompartment(Compartment * pCompartment)
  {
    mpGrid->setFunctor(new Functor< Compartment >(pCompartment, &Compartment::getBorderCellsToPush));
  }

private:
  boost::mpi::communicator * mpCommunicator;
  repast::SharedContext< AgentType > mCellContext;
  repast::SharedContext< AgentType > mDiffuserContext;
  const int mBufferSize;
  Space * mpSpace;
  Grid * mpGrid;
  Grid * mpSharedValues;
  repast::GridDimensions mLocalSpaceDimensions;
  repast::GridDimensions mLocalGridDimensions;
  repast::GridDimensions mLocalSharedValueDimensions;
  PackageExchange mpCellExchange;
  PackageExchange mpDiffuserExchange;
  repast::DoubleUniformGenerator mUniform;
  std::vector< Space2Grid > mSpace2Grid;
  repast::CartTopology * mpGridTopology;
  repast::CartTopology * mpDiffuserTopology;
};

} // namespace ENISI

#endif
