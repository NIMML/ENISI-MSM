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
    mpCellProvider(&mCellContext),
    mpCellReceiver(&mCellContext),
    mpDiffuserProvider(&mDiffuserContext),
    mpDiffuserReceiver(&mDiffuserContext),
    mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0)),
    mSpace2Grid(spaceDimension.dimensionCount()),
    mpGridTopology(NULL),
    mpDiffuserTopology(NULL)
  {
    determineProcessDimensions(gridDimension);
    //
    mpSpace = new Space(name +"-space", spaceDimension, mProcessDimensions, mBufferSize, mpCommunicator);
    mpGrid = new Grid(name +"-grid", gridDimension, mProcessDimensions, mBufferSize, mpCommunicator);
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

    std::vector< Space2Grid >::iterator itConversion = mSpace2Grid.begin();
    std::vector< Space2Grid >::iterator endConversion = mSpace2Grid.end();

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

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, std::vector< Agent * > &out)
  {
    if (range == 0)
      {
        getAgents(pt, out);
      }

    repast::Moore2DGridQuery< Agent > moore2DQuery(mpGrid);
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
    mpGrid->getObjectsAt(pt, out);
  }

  void getAgents(const repast::Point< int > &pt, const int & types, std::vector< Agent * > &out)
  {
    out.clear();
    std::vector< Agent * > Tmp;
    mpGrid->getObjectsAt(pt, Tmp);

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
    return mCellContext.getAgent(id);
  }

  bool moveTo(const repast::AgentId &id, const std::vector< double > & pt)
  {
    return mpSpace->moveTo(id, pt) && mpGrid->moveTo(id, spaceToGrid(pt));
  }

  bool addAgent(Agent * agent, const std::vector< double > & pt)
  {
    Agent * pAgent = mCellContext.addAgent(agent);
    repast::AgentId Id = pAgent->getId();

    return mpSpace->moveTo(Id, pt) && mpGrid->moveTo(Id, spaceToGrid(pt));
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
    mpSpace->removeAgent(pAgent);
    mpGrid->removeAgent(pAgent);
    mCellContext.removeAgent(pAgent);
  }

  repast::Point<int> spaceToGrid(const repast::Point<double> & space) const
  {
    std::vector< int > Grid(mpSpace->dimensions().dimensionCount(), 0);

    std::vector< double >::const_iterator itSpace = space.coords().begin();
    std::vector< double >::const_iterator endSpace = space.coords().end();
    std::vector< Space2Grid >::const_iterator itConversion = mSpace2Grid.begin();
    std::vector< int >::iterator itGrid = Grid.begin();

    for (; itSpace != endSpace; ++itSpace, ++itConversion, ++itGrid)
      {
        *itGrid = floor(itConversion->grid + itConversion->scale * (*itSpace - itConversion->space));
      }

    return Grid;
  }

  void getLocation(const repast::AgentId & id, std::vector<double> & loc) const
  {
    mpSpace->getLocation(id, loc);
  }

  std::vector< Agent * > getNeighborsAt(const std::string neighborName, const repast::Point<int> & pt) const
  {
    std::vector< Agent *> agentsToPlay;

    repast::Moore2DGridQuery< Agent > moore2DQuery(mpGrid);
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

    repast::RepastProcess::instance()->requestAgents<Agent, Package, PackageProvider, PackageReceiver>(mCellContext, req, mpCellProvider, mpCellReceiver, mpCellReceiver);
  }


  void synchronizeCellStates()
  {
    repast::RepastProcess::instance()->synchronizeAgentStates<Agent, Package, PackageProvider, PackageReceiver>(mCellContext, mpCellProvider, mpCellReceiver);
  }

  void synchronizeDiffuserStates()
  {
    repast::RepastProcess::instance()->synchronizeAgentStates<Agent, Package, PackageProvider, PackageReceiver>(mDiffuserContext, mpDiffuserProvider, mpDiffuserReceiver);
  }

  void synchronizeCells()
  {
    repast::RepastProcess::instance()->synchronizeProjectionInfo<Agent, Package, PackageProvider, PackageReceiver, PackageReceiver>(mCellContext, mpCellProvider, mpCellReceiver, mpCellReceiver);
  }

  void synchronizeDiffuser()
  {
    repast::RepastProcess::instance()->synchronizeProjectionInfo<Agent, Package, PackageProvider, PackageReceiver, PackageReceiver>(mDiffuserContext, mpDiffuserProvider, mpDiffuserReceiver, mpDiffuserReceiver);
  }

  std::vector< Agent * > selectAllAgents()
  {
    std::vector< Agent * > agents;
    mCellContext.selectAgents(agents);
    return agents;
  }

  std::vector< Agent * > selectLocalAgents()
  {
    std::vector< Agent * > agents;
    mCellContext.selectAgents(Context::LOCAL, agents);
    return agents;
  }

  std::vector< Agent * > selectRemoteAgents()
  {
    std::vector< Agent * > agents;
    mCellContext.selectAgents(Context::NON_LOCAL, agents);
    return agents;
  }

  bool addDiffuserValues(SharedValueLayer * pDiffuserValues)
  {
    Agent * pAgent = mDiffuserContext.addAgent(pDiffuserValues);
    repast::AgentId Id = pAgent->getId();

    return mpSharedValues->moveTo(Id, repast::Point< int >(mSharedValueDimensions.origin()[0], mSharedValueDimensions.origin()[1]));
  }

private:
  boost::mpi::communicator * mpCommunicator;
  repast::SharedContext< Agent > mCellContext;
  repast::SharedContext< Agent > mDiffuserContext;
  std::vector<int> mProcessDimensions;
  const int mBufferSize;
  Space * mpSpace;
  Grid * mpGrid;
  Grid * mpSharedValues;
  repast::GridDimensions mSpaceDimensions;
  repast::GridDimensions mGridDimensions;
  repast::GridDimensions mSharedValueDimensions;
  PackageProvider mpCellProvider;
  PackageReceiver mpCellReceiver;
  PackageProvider mpDiffuserProvider;
  PackageReceiver mpDiffuserReceiver;
  repast::DoubleUniformGenerator mUniform;
  std::vector< Space2Grid > mSpace2Grid;
  repast::CartTopology * mpGridTopology;
  repast::CartTopology * mpDiffuserTopology;
};

} // namespace ENISI

#endif
