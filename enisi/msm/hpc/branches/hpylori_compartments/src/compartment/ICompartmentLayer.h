#ifndef ENISI_MSM_ICOMPARTMENT_LAYER_H
#define ENISI_MSM_ICOMPARTMENT_LAYER_H

#include "repast_hpc/SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "repast_hpc/SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "repast_hpc/Moore2DGridQuery.h"

#include "agent/ENISIAgent.h"
#include "agent/AgentStates.h"
#include "agent/SharedValueLayer.h"
#include "grid/Borders.h"
#include "Projection.h"

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
  typedef repast::SharedContinuousSpace<AgentType, Transformer, Adder> Space;
  typedef ENISI::Projection<AgentType, Transformer, Adder> Grid;
  typedef repast::SharedContext< AgentType > Context;
//  typedef Agent AgentType;

  ICompartmentLayer(const std::string & name,
                    const repast::GridDimensions & spaceDimension,
                    const repast::GridDimensions & gridDimension) :
    mpCommunicator(repast::RepastProcess::instance()->getCommunicator()),
    mCellContext(mpCommunicator),
    mDiffuserContext(mpCommunicator),
    mProcessDimensions(spaceDimension.dimensionCount()),
    mBufferSize(1),
    mpSpace(NULL),
    mpGrid(NULL),
    mpSharedValues(NULL),
    mSpaceDimensions(),
    mGridDimensions(),
    mpCellExchange(&mCellContext),
    mpDiffuserExchange(&mDiffuserContext),
    mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0)),
    mSpace2Grid(spaceDimension.dimensionCount()),
    mpGridTopology(NULL),
    mpDiffuserTopology(NULL)
  {
    determineProcessDimensions(gridDimension);
    //
    mpSpace = new Space(name + "-space", spaceDimension, mProcessDimensions, 0, mpCommunicator);
    mpGrid = new Grid(name + "-grid", gridDimension, mProcessDimensions, mBufferSize, mpCommunicator);
    mpGridTopology = new repast::CartTopology(mProcessDimensions, gridDimension.origin().coords(), gridDimension.extents().coords(), Transformer().isPeriodic(), mpCommunicator);

    repast::GridDimensions ProcessDimensions(repast::Point< double >(0.0, 0.0), repast::Point< double >(mProcessDimensions[0], mProcessDimensions[1]));
    mpSharedValues = new Grid(name +"-values", ProcessDimensions, mProcessDimensions, mBufferSize, mpCommunicator);
    mpDiffuserTopology = new repast::CartTopology(mProcessDimensions, ProcessDimensions.origin().coords(), ProcessDimensions.extents().coords(), Transformer().isPeriodic(), mpCommunicator);

    mCellContext.addProjection(mpSpace);
    mCellContext.addProjection(mpGrid);
    mDiffuserContext.addProjection(mpSharedValues);

    mSpaceDimensions = mpSpace->dimensions();
    mGridDimensions = mpGrid->dimensions();
    mSharedValueDimensions = mpSharedValues->dimensions();

    typename std::vector< Space2Grid >::iterator itConversion = mSpace2Grid.begin();
    typename std::vector< Space2Grid >::iterator endConversion = mSpace2Grid.end();

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
    std::vector< double > Dimension = dimension.extents().coords();
    
    int worldSize = repast::RepastProcess::instance()->worldSize();

    int n;
    int nMin;
    int nMax;

    size_t i = Borders::X;
    bool swap2D = false;

    // TODO 3D process dimensions are not supported in repast HPC at this point in time
    if (Dimension.size() > 2)
      {
        // TODO Pick the smallest dimension and swap see 2D
        n = (int) pow(worldSize * Dimension[i] * Dimension[i] / (Dimension[i + 1] * Dimension[i + 2]), 1.0/3.0);

        nMax = n;
        while (worldSize % nMax > worldSize % (nMax + 1)) nMax++;

        nMin = n;
        while (worldSize % nMin > worldSize % (nMin - 1)) nMin--;

        n = (n - nMin < nMax -n) ? nMin : nMax;

        mProcessDimensions[i] = n;
        worldSize /= n;
        i++;
      }

    if (Dimension.size() > 1)
      {
        if (Dimension[i + 1] < Dimension[i])
          {
            swap2D = true;
            double tmp = Dimension[i];
            Dimension[i] = Dimension[i +1];
            Dimension[i + 1] = tmp;
          }

        n = ceil(sqrt(worldSize * Dimension[i] / Dimension[i + 1]));

        nMax = n;
        while (worldSize % nMax > worldSize % (nMax + 1))
          nMax++;

        nMin = n;
        while (nMin > 1 && worldSize % nMin > worldSize % (nMin - 1))
          nMin--;

        n = (n - nMin < nMax -n) ? nMin : nMax;

        mProcessDimensions[i] = n;
        worldSize /= n;
        i++;
      }

    if (Dimension.size() > 0)
      {
        mProcessDimensions[i] = worldSize;
      }

    if (swap2D)
      {
        double tmp = mProcessDimensions[i];
        mProcessDimensions[i] = mProcessDimensions[i - 1];
        mProcessDimensions[i - 1] = tmp;
      }


  }

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
    repast::Point<double> extents = mSpaceDimensions.extents();
    repast::Point<double> origin = mSpaceDimensions.origin();

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

  const repast::GridDimensions & spaceDimensions() const
  {
    return mSpaceDimensions;
  }

  const repast::GridDimensions & gridDimensions() const
  {
    return mGridDimensions;
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

  void synchronizeCellStates()
  {
    repast::RepastProcess::instance()->synchronizeAgentStates<AgentType, Package, PackageExchange, PackageExchange>(mCellContext, mpCellExchange, mpCellExchange);
  }

  void synchronizeDiffuserStates()
  {
    repast::RepastProcess::instance()->synchronizeAgentStates<AgentType, Package, PackageExchange, PackageExchange>(mDiffuserContext, mpDiffuserExchange, mpDiffuserExchange);
  }

  void synchronizeCells()
  {
    repast::RepastProcess::instance()->synchronizeProjectionInfo<AgentType, Package, PackageExchange, PackageExchange, PackageExchange>(mCellContext, mpCellExchange, mpCellExchange, mpCellExchange);
  }

  void synchronizeDiffuser()
  {
    repast::RepastProcess::instance()->synchronizeProjectionInfo<AgentType, Package, PackageExchange, PackageExchange, PackageExchange>(mDiffuserContext, mpDiffuserExchange, mpDiffuserExchange, mpDiffuserExchange);
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
    return getRank(spaceToGrid(location), round(xOffset), round(xOffset));
  }

  size_t getRank(const std::vector< int > & location, const int & xOffset, const int & yOffset) const
  {
    size_t Rank = mpGridTopology->getRank(location, xOffset, yOffset);

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

  bool addDiffuserValues(SharedValueLayer * pDiffuserValues)
  {
    AgentType * pAgent = mDiffuserContext.addAgent(pDiffuserValues);
    repast::AgentId Id = pAgent->getId();

    return mpSharedValues->moveTo(Id, repast::Point< int >(mSharedValueDimensions.origin()[0], mSharedValueDimensions.origin()[1]));
  }

  void addCompartment(Compartment * pCompartment)
  {
    mpGrid->setFunctor(new Functor< Compartment >(pCompartment, &Compartment::getBorderCellsToPush));
  }

private:
  boost::mpi::communicator * mpCommunicator;
  repast::SharedContext< AgentType > mCellContext;
  repast::SharedContext< AgentType > mDiffuserContext;
  std::vector<int> mProcessDimensions;
  const int mBufferSize;
  Space * mpSpace;
  Grid * mpGrid;
  Grid * mpSharedValues;
  repast::GridDimensions mSpaceDimensions;
  repast::GridDimensions mGridDimensions;
  repast::GridDimensions mSharedValueDimensions;
  PackageExchange mpCellExchange;
  PackageExchange mpDiffuserExchange;
  repast::DoubleUniformGenerator mUniform;
  std::vector< Space2Grid > mSpace2Grid;
  repast::CartTopology * mpGridTopology;
  repast::CartTopology * mpDiffuserTopology;
};

} // namespace ENISI

#endif
