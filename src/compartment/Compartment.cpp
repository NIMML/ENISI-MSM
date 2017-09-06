#include "compartment/Compartment.h"

#include "ICompartmentLayer.h"

#include "grid/Properties.h"
#include "agent/Cytokine.h"
#include "agent/SharedValueLayer.h"
#include "agent/GroupInterface.h"
#include "diffuser/DiffuserImpl.h"
#include "DataWriter/LocalFile.h"
#include "grid/SharedSpace.h"

// #define DEBUG_SHARED

using namespace ENISI;

// static
const char* Compartment::Names[] = {"lumen", "epithilium", "lamina_propria", "gastric_lymph_node", NULL};

// static
Compartment* Compartment::INSTANCES[] = {NULL, NULL, NULL, NULL};

// static
Compartment* Compartment::instance(const Compartment::Type & type)
{
  Compartment **pInstance = &INSTANCES[type];

  if (*pInstance == NULL)
    {
      *pInstance = new Compartment(type);
    }

  return *pInstance;
}

Compartment::Compartment(const Type & type):
  mType(type),
  mProperties(),
  mProcessDimensions(2, 0),
  mSpaceDimensions(),
  mGridDimensions(),
  mpLayer(NULL),
  mpSpaceBorders(NULL),
  mpGridBorders(NULL),
  mAdjacentCompartments(2, std::vector< Type >(2, INVALID)),
  mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0)),
  mCytokineMap(),
  mpDiffuserValues(NULL),
  mGroups(),
  mpDiffuser(NULL),
  mNoLocalAgents(false)
{
  std::string Name = Names[mType];
  const Properties * pProperties = Properties::instance(Properties::model);

  pProperties->getValue(Name + ".space.x", mProperties.spaceX);
  pProperties->getValue(Name + ".space.y", mProperties.spaceY);
  Properties::instance(Properties::run)->getValue("grid.size", mProperties.gridSize);

  determineProcessDimensions();
  mNoLocalAgents = repast::RepastProcess::instance()->rank() >= mProcessDimensions[0] * mProcessDimensions[1];

  mProperties.gridX = round(mProperties.spaceX / mProcessDimensions[Borders::X]) * mProcessDimensions[Borders::X];
  mProperties.gridY = round(mProperties.spaceY / mProcessDimensions[Borders::Y]) * mProcessDimensions[Borders::Y];

  std::string borderLow = pProperties->getValue(Name + ".border.y.low");
  mProperties.borderLowCompartment = pProperties->toEnum(borderLow, Names, INVALID);
  mProperties.borderLowType = pProperties->toEnum(borderLow, Borders::TypeNames, Borders::PERMIABLE);

  std::string borderHigh = pProperties->getValue(Name + ".border.y.high");
  mProperties.borderHighCompartment = pProperties->toEnum(borderHigh, Names, INVALID);
  mProperties.borderHighType = pProperties->toEnum(borderHigh, Borders::TypeNames, Borders::PERMIABLE);

  std::vector< double > Origin(2, 0);
  std::vector< double > SpaceExtents(2);
  SpaceExtents[Borders::X] = mProperties.spaceX;
  SpaceExtents[Borders::Y] = mProperties.spaceY;
  std::vector< double > GridExtents(2);
  GridExtents[Borders::X] = mProperties.gridX;
  GridExtents[Borders::Y] = mProperties.gridY;

  mSpaceDimensions = repast::GridDimensions(Origin, SpaceExtents);
  mGridDimensions = repast::GridDimensions(Origin, GridExtents);

  mpSpaceBorders = new Borders(mSpaceDimensions);
  mpSpaceBorders->setBorderType(Borders::Y, Borders::LOW, mProperties.borderLowType);
  mpSpaceBorders->setBorderType(Borders::Y, Borders::HIGH, mProperties.borderHighType);

  mpGridBorders = new Borders(mGridDimensions);
  mpGridBorders->setBorderType(Borders::Y, Borders::LOW, mProperties.borderLowType);
  mpGridBorders->setBorderType(Borders::Y, Borders::HIGH, mProperties.borderHighType);

  mAdjacentCompartments[Borders::X][Borders::LOW] = INVALID;
  mAdjacentCompartments[Borders::X][Borders::HIGH] = INVALID;
  mAdjacentCompartments[Borders::Y][Borders::LOW] = mProperties.borderLowCompartment;
  mAdjacentCompartments[Borders::Y][Borders::HIGH] = mProperties.borderHighCompartment;

  LocalFile::debug() << getName() << ": Process Dimensions:     " << mProcessDimensions[0] << ", " << mProcessDimensions[1] << std::endl;

  mpLayer = new SharedLayer(Name, mProcessDimensions, mSpaceDimensions, mGridDimensions);

  LocalFile::debug() << " Space Dimensions:       " << mSpaceDimensions << std::endl;
  LocalFile::debug() << " Grid Dimensions :       " << mGridDimensions << std::endl;
  LocalFile::debug() << " Local Space Dimensions: " << localSpaceDimensions() << std::endl;
  LocalFile::debug() << " Local Grid Dimensions:  " << localGridDimensions() << std::endl << std::endl;

  mpLayer->addCompartment(this);

  /*
  repast::CartTopology topology(mProcessDimensions,
                                mDimensions.origin().coords(),
                                mDimensions.extents().coords(),
                                true,
                                repast::RepastProcess::instance()->getCommunicator());

  repast::Neighbors neighbors;
  topology.createNeighbors(neighbors);
  */
}

void Compartment::determineProcessDimensions()
{
  std::vector< double > Dimension = repast::Point< double >(mProperties.spaceX, mProperties.spaceY).coords();

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
      while (worldSize % nMax != 0)
        nMax++;

      nMin = n;
      while (nMin > 1 && worldSize % nMin != 0)
        nMin--;

      n = (n - nMin < nMax - n) ? nMin : nMax;

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


// virtual
Compartment::~Compartment()
{
  if (INSTANCES[mType] == this)
    {
      INSTANCES[mType] = NULL;
    }

//  if (mpLayer != NULL) delete mpLayer;
  if (mpSpaceBorders != NULL) delete mpSpaceBorders;
  if (mpGridBorders != NULL) delete mpGridBorders;
}

const repast::GridDimensions & Compartment::spaceDimensions() const
{
  return mSpaceDimensions;
}

const repast::GridDimensions & Compartment::gridDimensions() const
{
  return mGridDimensions;
}

const repast::GridDimensions & Compartment::localSpaceDimensions() const
{
  return mpLayer->localSpaceDimensions();
}

const repast::GridDimensions & Compartment::localGridDimensions() const
{
  return mpLayer->localGridDimensions();
}

const Borders * Compartment::spaceBorders() const
{
  return mpSpaceBorders;
}

const Borders * Compartment::gridBorders() const
{
  return mpGridBorders;
}

const Compartment * Compartment::getAdjacentCompartment(const Borders::Coodinate &coordinate, const Borders::Side & side) const
{
  return instance(mAdjacentCompartments[coordinate][side]);
}

Iterator Compartment::begin()
{
  if (mNoLocalAgents)
    {
      return Iterator(repast::GridDimensions(repast::Point<double>(0, 0), repast::Point<double>(0, 0)));
    }

  return Iterator(mpLayer->localGridDimensions());
}

double Compartment::gridToSpace(const Borders::Coodinate &coordinate, const int & grid) const
{
  return mpLayer->gridToSpace(coordinate, grid);
}

std::vector< double > Compartment::gridToSpace(const std::vector< int > & grid) const
{
  return mpLayer->gridToSpace(grid);
}


int Compartment::spaceToGrid(const Borders::Coodinate &coordinate, const double & space) const
{
  return mpLayer->spaceToGrid(coordinate, space);
}

std::vector< int > Compartment::spaceToGrid(const std::vector< double > & space) const
{
  return mpLayer->spaceToGrid(space);
}

void Compartment::getLocation(const repast::AgentId & id, std::vector<double> & Location) const
{
  mpLayer->getLocation(id, Location);
}

bool Compartment::moveTo(const repast::AgentId &id, repast::Point< double > &pt)
{
  return moveTo(id, pt.coords());
}

bool Compartment::moveTo(const repast::AgentId &id, std::vector< double > &pt)
{
  // We need to transform the point possibly to the coordinates of an adjacent compartment.
  Compartment * pTarget = transform(pt);

  if (pTarget == this)
    {
      return mpLayer->moveTo(id, pt);
    }

  bool success = false;

  if (pTarget != NULL)
    {
      Agent * pAgent = mpLayer->getAgent(id);
      success = pTarget->addAgent(pAgent, pt);
      removeAgent(pAgent);
    }

  return success;
}

Compartment * Compartment::transform(std::vector< double > & location) const
{
  mpSpaceBorders->transform(location);

  std::vector< Borders::BoundState > BoundState(2);

  if (mpSpaceBorders->boundsCheck(location, &BoundState))
    {
      return const_cast< Compartment * >(this);
    }

  Compartment * pTarget = mapToOtherCompartment(location, BoundState);

  if (pTarget != NULL)
    {
      // It is possible that we are still outside the boundaries and need another transformation
      // This recursive call will take care of this
	  LocalFile::debug() << "Recursive transform attempt: " << pTarget->getName() << std::endl;
      pTarget = pTarget->transform(location);
    }

  if (pTarget != NULL)
  	{
	  LocalFile::debug() << "Recursive transform result:  " << pTarget->getName() << std::endl;
  	}

  return pTarget;
}

Compartment * Compartment::transform(std::vector< int > & location) const
{
  mpGridBorders->transform(location);

  std::vector< Borders::BoundState > BoundState(2, Borders::INBOUND);

  if (mpGridBorders->boundsCheck(location, &BoundState))
    {
      return const_cast< Compartment * >(this);
    }

  std::vector< double > Space = gridToSpace(location);

  Compartment * pTarget = mapToOtherCompartment(Space, BoundState);

  if (pTarget != NULL)
    {
      // It is possible that we are still outside the boundaries and need another transformation
      // This recursive call will take care of this
	  LocalFile::debug() << "Recursive transform attempt: " << pTarget->getName() << std::endl;
	  pTarget = pTarget->transform(Space);
    }

  if (pTarget != NULL)
  	{
	  LocalFile::debug() << "Recursive transform result:  " << pTarget->getName() << std::endl;
      location = pTarget->spaceToGrid(Space);
  	}

  return pTarget;
}

Compartment * Compartment::mapToOtherCompartment(std::vector< double > & pt,
                                                 const std::vector< Borders::BoundState > & BoundState) const
{
  // We are outside the compartment boundaries, find the adjacent compartment
  Compartment * pTarget = NULL;
  size_t Coordinate = Borders::X;
  std::vector<Borders::BoundState>::const_iterator itState = BoundState.begin();
  std::vector<Borders::BoundState>::const_iterator endState = BoundState.end();
  std::vector< double >::iterator itIn = pt.begin();

  for (; itState != endState; ++itState, ++itIn, ++Coordinate)
    {
      switch (*itState)
        {
          case Borders::OUT_LOW:
            if (mAdjacentCompartments[Coordinate][Borders::LOW] != INVALID)
              {
                pTarget = instance(mAdjacentCompartments[Coordinate][Borders::LOW]);
                const repast::GridDimensions & Dimensions = pTarget->spaceDimensions();
                *itIn += Dimensions.origin(Coordinate) + Dimensions.extents(Coordinate) - mSpaceDimensions.origin(Coordinate);
              }

            break;

          case Borders::OUT_HIGH:
            if (mAdjacentCompartments[Coordinate][Borders::HIGH] != INVALID)
              {
                pTarget = instance(mAdjacentCompartments[Coordinate][Borders::HIGH]);
                const repast::GridDimensions & Dimensions = pTarget->spaceDimensions();
                *itIn += Dimensions.origin(Coordinate) - mSpaceDimensions.extents(Coordinate);
              }

            break;

          case Borders::INBOUND:
          case Borders::OUT_BOTH:
            break;
        }
    }

  return pTarget;
}


bool Compartment::moveRandom(const repast::AgentId &id, const double & maxSpeed)
{
  static double fullCircle = 2 * M_PI; // in radians
  double angle = fullCircle * mUniform.next();
  double radius = maxSpeed * mUniform.next();

  std::vector< double > Location(2);

  mpLayer->getLocation(id, Location);
  Location[0] += radius * cos(angle);
  Location[1] += radius * sin(angle);

  mpSpaceBorders->transform(Location);

  std::vector< Borders::BoundState > BoundState(2);

  if (!mpSpaceBorders->boundsCheck(Location, &BoundState))
    {
      // We are at the compartment boundaries;
      // Since this is a random move we reflect at the compartment border

      size_t i = Borders::X;
      double tmp;

      std::vector<Borders::BoundState>::const_iterator itState = BoundState.begin();
      std::vector<Borders::BoundState>::const_iterator endState = BoundState.end();
      std::vector<double>::iterator itLocation = Location.begin();

      for (; itState != endState; ++itState, ++itLocation, ++i)
        {
          switch (*itState)
            {
              case Borders::OUT_LOW:
                tmp = fmod(mSpaceDimensions.origin(i) - *itLocation, 2.0 * mSpaceDimensions.extents(i));

                if (tmp < mSpaceDimensions.extents(i))
                  *itLocation = mSpaceDimensions.origin(i) + tmp;
                else
                  *itLocation = mSpaceDimensions.origin(i) + 2.0 * mSpaceDimensions.extents(i) - tmp;

                break;

              case Borders::OUT_HIGH:
                tmp = fmod(*itLocation - mSpaceDimensions.origin(i) - mSpaceDimensions.extents(i), 2.0 * mSpaceDimensions.extents(i));

                if (tmp < mSpaceDimensions.extents(i))
                  *itLocation = mSpaceDimensions.origin(i) + mSpaceDimensions.extents(i) - tmp;
                else
                  *itLocation = mSpaceDimensions.origin(i) + tmp - mSpaceDimensions.extents(i);

                break;

              case Borders::INBOUND:
              case Borders::OUT_BOTH:
                break;
            }
        }
    }

  return mpLayer->moveTo(id, Location);
}

bool Compartment::addAgent(Agent * agent, const std::vector< double > & pt)
{
  return mpLayer->addAgent(agent, pt);
}

bool Compartment::addAgentToRandomLocation(Agent * agent)
{
  return mpLayer->addAgentToRandomLocation(agent);
}

void Compartment::removeAgent(Agent * pAgent)
{
  mpLayer->removeAgent(pAgent);
}

void Compartment::getNeighbors(const repast::Point< int > &pt,
                               unsigned int range,
                               std::vector< Agent * > &out)
{
  mpLayer->getNeighbors(pt, range, out);
}

void Compartment::getNeighbors(const repast::Point< int > &pt,
                               unsigned int range,
                               const int & types,
                               std::vector< Agent * > &out)
{
  mpLayer->getNeighbors(pt, range, types, out);
}

void Compartment::getAgents(const repast::Point< int > &pt,
                            std::vector< Agent * > &out)
{
  std::vector< int > Location = pt.coords();

  Compartment * pTarget = transform(Location);

  if (pTarget == this)
    {
      mpLayer->getAgents(Location, out);
    }
  else if (pTarget != NULL)
    {
      pTarget->getAgents(Location, out);
    }

  return ;
}

void Compartment::getAgents(const repast::Point< int > &pt,
                            const int & types,
                            std::vector< Agent * > &out)
{
  std::vector< int > Location = pt.coords();

  Compartment * pTarget = transform(Location);

  if (pTarget == this)
    {
      mpLayer->getAgents(Location, types, out);
    }
  else if (pTarget != NULL)
    {
      pTarget->getAgents(Location, types, out);
    }

  return ;
}

void Compartment::getAgents(const repast::Point< int > &pt, const int & xOffset, const int & yOffset, std::vector< Agent * > &out)
{
  std::vector< int > Location = pt.coords();
  Location[Borders::X] += xOffset;
  Location[Borders::Y] += yOffset;

  getAgents(Location, out);

  return ;
}

void Compartment::getAgents(const repast::Point< int > &pt, const int & xOffset, const int & yOffset, const int & types, std::vector< Agent * > &out)
{
  std::vector< int > Location = pt.coords();
  Location[Borders::X] += xOffset;
  Location[Borders::Y] += yOffset;

  getAgents(Location, types, out);

  return ;
}

size_t Compartment::addCytokine(const std::string & name)
{
  Cytokine * pCytokine = new Cytokine(getName() + "." + name);

  pCytokine->setIndex(mCytokines.size());
  mCytokines.push_back(pCytokine);
  mCytokineMap.insert(std::make_pair(name, pCytokine->getIndex()));

  return pCytokine->getIndex();
}

const Cytokine * Compartment::getCytokine(const std::string & name) const
{
  std::map< std::string, size_t >::const_iterator found = mCytokineMap.find(name);

  if (found != mCytokineMap.end())
    {
      return mCytokines[found->second];
    }

  return NULL;
}

const std::vector< Cytokine * > & Compartment::getCytokines() const
{
  return mCytokines;
}

std::vector< double > & Compartment::cytokineValues(const repast::Point< int > & pt)
{
  if (mpDiffuserValues != NULL &&
      mpDiffuserValues->contains(pt))
    {
      // LocalFile::debug() << "  local" << std::endl;

      return mpDiffuserValues->operator[](pt);
    }

  // We loop through all non local agents and check whether they contain the value
  SharedLayer::Context::const_state_aware_iterator it = mpLayer->getValueContext().begin(SharedLayer::Context::NON_LOCAL);
  SharedLayer::Context::const_state_aware_iterator end = mpLayer->getValueContext().end(SharedLayer::Context::NON_LOCAL);

  std::vector< double > * pFound = NULL;

  for (; it != end && pFound == NULL; ++it)
    {
      SharedValueLayer * pValues = static_cast< SharedValueLayer * >(&**it);
      // LocalFile::debug() << "  trying: " << pValues->origin() << ", " << pValues->shape() << std::endl;

      pFound = pValues->tryLocation(pt);
    }

  if (pFound != NULL)
    {
      return *pFound;
    }

  LocalFile::debug() << "ERROR: " << getName() << " " << pt << ", " << localGridDimensions() << std::endl;
  LocalFile::debug() << mpDiffuserValues->origin() << ", " << mpDiffuserValues->shape() << std::endl;

  throw std::runtime_error("cytokine value not found: location not shared");

  static std::vector< double > NaN(mCytokines.size(), std::numeric_limits< double >::quiet_NaN());
  return NaN;
}

double & Compartment::cytokineValue(const std::string & name, const repast::Point< int > & pt)
{
  std::vector< int > Location = pt.coords();
  // LocalFile::debug() << name << "(" << getName() << "): (" << Location[Borders::X] << ", " << Location[Borders::Y] << ") -> ";

  Compartment * pTarget = transform(Location);

  if (pTarget == this)
    {
      // LocalFile::debug() << "(" << Location[Borders::X] << ", " << Location[Borders::Y] << ")" << std::endl;

      return cytokineValues(Location)[mCytokineMap[name]];
    }
  else if (pTarget != NULL)
    {
      // LocalFile::debug() << name << "(" << pTarget->getName() << "): (" << Location[Borders::X] << ", " << Location[Borders::Y] << ")" << std::endl;

      return pTarget->cytokineValue(name, Location);
    }


  throw std::runtime_error("cytokine value not found: unable to determine target compartment");

  static double NaN = std::numeric_limits< double >::quiet_NaN();
  return NaN;
}

double & Compartment::cytokineValue(const std::string & name, const repast::Point< int > & pt, const int & xOffset, const int & yOffset)
{
  std::vector< int > Location = pt.coords();
  // LocalFile::debug() << name << "(" << getName() << "): (" << Location[Borders::X] << ", " << Location[Borders::Y] << ") + (" << xOffset << ", " << yOffset << ")" << std::endl;

  Location[Borders::X] += xOffset;
  Location[Borders::Y] += yOffset;

  return cytokineValue(name, Location);
}

void Compartment::initializeDiffuserData()
{
  if (mNoLocalAgents) return;

  if (mCytokineMap.empty()) return;

  if (mpDiffuserValues == NULL)
    {
      mpDiffuserValues = new SharedValueLayer(Agent::DiffuserValues, mType, mCytokineMap.size());
      mpLayer->addDiffuserValues(mpDiffuserValues, this);

      std::vector< double > InitialValues(mCytokineMap.size());
      std::vector< double >::iterator itInitialValue = InitialValues.begin();
      std::vector< Cytokine * >::const_iterator it = mCytokines.begin();
      std::vector< Cytokine * >::const_iterator end = mCytokines.end();

      for (; it != end; ++it, ++itInitialValue)
        {
          *itInitialValue = (*it)->getInitialValue();
        }

      for (Iterator itGrid = begin(); itGrid; itGrid.next())
        {
          mpDiffuserValues->operator[](*itGrid) = InitialValues;
        }
    }

  if (mpDiffuser == NULL)
    {
      mpDiffuser = new DiffuserImpl(this);
    }
}

SharedValueLayer * Compartment::getDiffuserData()
{
  return mpDiffuserValues;
}

/*
std::vector< double > & Compartment::operator[](const repast::Point< int > & location)
{
  return mpDiffuserValues->operator[](location);
}

const std::vector< double > & Compartment::operator[](const repast::Point< int > & location) const
{
  return mpDiffuserValues->operator[](location);
}

const std::vector< double > & Compartment::operator[](const repast::Point< double > & location) const
{
  return operator[](mpLayer->spaceToGrid(location.coords()));
}
*/

void Compartment::synchronizeCells()
{
  if (mNoLocalAgents) return;

  mpLayer->synchronizeCells();
}

// virtual
void Compartment::write(const std::string & separator)
{
  if (mNoLocalAgents) return;

  std::ostream & o = LocalFile::instance(getName())->stream();

  repast::ScheduleRunner& runner = repast::RepastProcess::instance()->getScheduleRunner();
  o << getName() << " TICK: " << round(runner.currentTick())
    << ", Agents " << mpLayer->getCellContext().size()
    << ", " << mpLayer->localGridDimensions() << std::endl;


  // We loop through all local agents an write them out.
  SharedLayer::Context::const_state_aware_iterator it = mpLayer->getCellContext().begin(SharedLayer::Context::LOCAL);
  SharedLayer::Context::const_state_aware_iterator end = mpLayer->getCellContext().end(SharedLayer::Context::LOCAL);

  if (it != end)
    {
      for (size_t i = 0; i < 10; ++i)
        {
          if (i)
            {
              o << "\t";
            }

          o << "X\tY\tid\tname\tstate";
        }

      o << std::endl;
    }

  std::vector< double > Location;
  for (size_t i = 0; it != end; ++it, ++i)
    {
      Agent & Agent = **it;
      mpLayer->getLocation(Agent.getId(), Location);
      o << Location[0] << separator << Location[1] << separator;
      Agent.write(o, separator, this);

      // 10 agents per line
      if ((i % 10) == 9)
        {
          o << std::endl;
        }
      else
        {
          o << separator;
        }
    }

#ifdef DEBUG_SHARED
  // We loop through all local agents an write them out.
  it = mpLayer->getCellContext().begin(SharedLayer::Context::NON_LOCAL);
  end = mpLayer->getCellContext().end(SharedLayer::Context::NON_LOCAL);

  if (it != end)
    {
      for (size_t i = 0; i < 10; ++i)
        {
          if (i)
            {
              o << "\t";
            }

          o << "X\tY\tname\tstate";
        }

      o << std::endl;
    }

  for (size_t i = 0; it != end; ++it, ++i)
    {
      Agent & Agent = **it;
      mpLayer->getLocation(Agent.getId(), Location);
      o << Location[0] << separator << Location[1] << separator;
      Agent.write(o, separator, this);

      // 10 agents per line
      if ((i % 10) == 9)
        {
          o << std::endl;
        }
      else
        {
          o << separator;
        }
    }
#endif

  if (mpDiffuserValues != NULL)
    {
      o << std::endl;

      mpDiffuserValues->write(o, separator, this);
    }

  o << std::endl;
  o << std::endl;

  o.flush();
}

void Compartment::getBorderCellsToPush(std::set<repast::AgentId> & /* agentsToTest */,
                                       std::map< int, std::set< repast::AgentId > > & agentsToPush)
{
  // LocalFile::debug() << getName() << " (" << agentsToTest.size() << "): " << localGridDimensions() << std::endl;

  std::vector< Borders::Coodinate > Coordinates;
  std::vector< Borders::Side > Sides;

  repast::Point< double > Out = localGridDimensions().origin();

  if (mAdjacentCompartments[Borders::X][Borders::LOW] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::X, Borders::LOW) < 0.5)
    {
      Coordinates.push_back(Borders::X);
      Sides.push_back(Borders::LOW);
    }

  if (mAdjacentCompartments[Borders::Y][Borders::LOW] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::Y, Borders::LOW) < 0.5)
    {
      Coordinates.push_back(Borders::Y);
      Sides.push_back(Borders::LOW);
    }

  Out.add(localGridDimensions().extents());

  if (mAdjacentCompartments[Borders::X][Borders::HIGH] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::X, Borders::HIGH) < 1.5)
    {
      Coordinates.push_back(Borders::X);
      Sides.push_back(Borders::HIGH);
    }

  if (mAdjacentCompartments[Borders::Y][Borders::HIGH] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      Coordinates.push_back(Borders::Y);
      Sides.push_back(Borders::HIGH);
    }

  std::vector< Borders::Coodinate >::const_iterator it = Coordinates.begin();
  std::vector< Borders::Coodinate >::const_iterator end = Coordinates.end();
  std::vector< Borders::Side >::const_iterator itSide = Sides.begin();

  for (; it != end; ++it, ++itSide)
    {
      // Add all local agent Ids which are near the border to be pushed;
      getBorderCellsToPush(*it, *itSide, agentsToPush);
    }
}

void Compartment::getBorderCellsToPush(const Borders::Coodinate & coordinate,
                                       const Borders::Side & side,
                                       std::map< int, std::set< repast::AgentId > > & agentsToPush)
{
  // LocalFile::debug() << getName() << ": [" << (coordinate == Borders::X ? "X" : "Y") << ", " << (side == Borders::LOW ? "low" : "high") << "]" << std::endl;
  Borders::Coodinate OtherCordinate = (coordinate == Borders::Y) ? Borders::X : Borders::Y;

  Iterator itPoint(localGridDimensions());

  if (side == Borders::HIGH)
    {
      for (int i = 0, imax = localGridDimensions().extents(coordinate) - 1; i < imax; ++i)
        {
          itPoint.next(coordinate);
        }
    }

  for (int i = 0, imax = localGridDimensions().extents(OtherCordinate); i < imax; i++, itPoint.next(OtherCordinate))
    {
      // LocalFile::debug() << *itPoint << ":" << std::endl;

      std::set< size_t > TargetRanks = getRanks(itPoint->coords(), coordinate, side);

      std::set< size_t >::const_iterator itRank = TargetRanks.begin();
      std::set< size_t >::const_iterator endRank = TargetRanks.end();

      for (; itRank != endRank; ++itRank)
        {
          std::map< int, std::set< repast::AgentId > >::iterator found = agentsToPush.find(*itRank);

          if (found == agentsToPush.end())
            {
              found = agentsToPush.insert(std::make_pair(*itRank, std::set< repast::AgentId >())).first;
            }

          std::vector< Agent * > out;
          mpLayer->getAgents(*itPoint, out);

          std::vector< Agent * >::const_iterator it = out.begin();
          std::vector< Agent * >::const_iterator end = out.end();

          for (; it != end; ++it)
            {
              found->second.insert((*it)->getId());
            }
        }
    }
}

void Compartment::getBorderValuesToPush(std::set<repast::AgentId> & /* agentsToTest */,
                                        std::map< int, std::set< repast::AgentId > > & agentsToPush)
{
  // LocalFile::debug() << getName() << ": " << localGridDimensions() << std::endl;

  std::vector< Borders::Coodinate > Coordinates;
  std::vector< Borders::Side > Sides;

  repast::Point< double > Out = localGridDimensions().origin();

  if (mAdjacentCompartments[Borders::X][Borders::LOW] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::X, Borders::LOW) < 0.5)
    {
      Coordinates.push_back(Borders::X);
      Sides.push_back(Borders::LOW);
    }

  if (mAdjacentCompartments[Borders::Y][Borders::LOW] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::Y, Borders::LOW) < 0.5)
    {
      Coordinates.push_back(Borders::Y);
      Sides.push_back(Borders::LOW);
    }

  Out.add(localGridDimensions().extents());

  if (mAdjacentCompartments[Borders::X][Borders::HIGH] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::X, Borders::HIGH) < 1.5)
    {
      Coordinates.push_back(Borders::X);
      Sides.push_back(Borders::HIGH);
    }

  if (mAdjacentCompartments[Borders::Y][Borders::HIGH] != INVALID &&
      mpGridBorders->distanceFromBorder(Out.coords(), Borders::Y, Borders::HIGH) < 1.5)
    {
      Coordinates.push_back(Borders::Y);
      Sides.push_back(Borders::HIGH);
    }

  std::vector< Borders::Coodinate >::const_iterator it = Coordinates.begin();
  std::vector< Borders::Coodinate >::const_iterator end = Coordinates.end();
  std::vector< Borders::Side >::const_iterator itSide = Sides.begin();

  for (; it != end; ++it, ++itSide)
    {
      // Add all local agent Ids which are near the border to be pushed;
      getBorderValuesToPush(*it, *itSide, agentsToPush);
    }
}

void Compartment::getBorderValuesToPush(const Borders::Coodinate & coordinate,
                                        const Borders::Side & side,
                                        std::map< int, std::set< repast::AgentId > > & agentsToPush)
{
  Borders::Coodinate OtherCordinate = (coordinate == Borders::Y) ? Borders::X : Borders::Y;

  Iterator itPoint(localGridDimensions());

  if (side == Borders::HIGH)
    {
      for (int i = 0, imax = localGridDimensions().extents(coordinate) - 1; i < imax; ++i)
        {
          itPoint.next(coordinate);
        }
    }

  std::set< int > Targets;

  for (int i = 0, imax = localGridDimensions().extents(OtherCordinate); i < imax; i++, itPoint.next(OtherCordinate))
    {
      std::set< size_t > TargetRanks = getRanks(itPoint->coords(), coordinate, side);
      Targets.insert(TargetRanks.begin(), TargetRanks.end());
    }

  repast::AgentId Id = mpDiffuserValues->getId();

  std::set< int >::const_iterator itTarget = Targets.begin();
  std::set< int >::const_iterator endTarget = Targets.end();

  // LocalFile::debug() << mpDiffuserValues->origin() << ", " << mpDiffuserValues->shape() << " to: ";

  for (; itTarget != endTarget; ++itTarget)
    {
      // LocalFile::debug() <<  *itTarget << " ";
      std::map< int, std::set< repast::AgentId > >::iterator found = agentsToPush.find(*itTarget);

      if (found == agentsToPush.end())
        {
          found = agentsToPush.insert(std::make_pair(*itTarget, std::set< repast::AgentId >())).first;
        }

      found->second.insert(Id);
    }

  // LocalFile::debug() << std::endl;
}

void Compartment::synchronizeDiffuser()
{
  if (mNoLocalAgents) return;

  // Nothing to do
  if (mpDiffuserValues == NULL) return;

  // mpDiffuserValues->write(LocalFile::debug(), "\t", this);

  mpLayer->synchronizeDiffuser();

  // We loop through all non local agents and update the local diffuser border values.
  SharedLayer::Context::const_state_aware_iterator it = mpLayer->getValueContext().begin(SharedLayer::Context::NON_LOCAL);
  SharedLayer::Context::const_state_aware_iterator end = mpLayer->getValueContext().end(SharedLayer::Context::NON_LOCAL);

  for (; it != end; ++it)
    {
      mpDiffuserValues->updateBufferValues(*static_cast< SharedValueLayer * >(&**it),
                                           *mpGridBorders);
    }

  // Complete Information based on border settings
  mpDiffuserValues->completeBufferValues(*mpGridBorders);

  // mpDiffuserValues->write(LocalFile::debug(), "\t", this);
}

const Compartment::Type & Compartment::getType() const
{
  return mType;
}

size_t Compartment::localCount(const double & concentration)
{
  if (mNoLocalAgents) return 0;

  size_t rank = repast::RepastProcess::instance()->rank();
  size_t worldSize = mProcessDimensions[0] * mProcessDimensions[1];

  size_t GlobalCount = concentration * mProperties.spaceX *  mProperties.spaceY;
  size_t LocalCount = GlobalCount / worldSize;

  if (rank < GlobalCount - LocalCount * worldSize) LocalCount++;

  return LocalCount;
}

std::set< size_t > Compartment::getRanks(const std::vector< int > & location,
                                         const Borders::Coodinate & coordinate,
                                         const Borders::Side & side) const
{
  // LocalFile::debug() << getName() << ": (" << location[Borders::X] << ", " << location[Borders::Y] << "), [" << (coordinate == Borders::X ? "X" : "Y") << ", " << (side == Borders::LOW ? "low" : "high") << "] -> (";
  Borders::Coodinate OtherCoordinate = (coordinate == Borders::Y) ? Borders::X : Borders::Y;

  std::vector< int > LowerLimit = location;
  LowerLimit[coordinate] = mGridDimensions.origin(coordinate) + side == Borders::LOW ? -1 : mGridDimensions.extents(coordinate);
  std::vector< int > UpperLimit = LowerLimit;
  UpperLimit[OtherCoordinate] += 1;

  // LocalFile::debug() << LowerLimit[Borders::X] << ", " << LowerLimit[Borders::Y] << ")-(" << UpperLimit[Borders::X] << ", " << UpperLimit[Borders::Y] << ") -> ";


  // This transforms the lower limit to the new compartments coordinates
  Compartment * pCompartment = transform(LowerLimit);

  if (pCompartment == this || pCompartment == NULL)
    {
      LocalFile::debug() << "ERROR getRanks: " << getName() << ": " << location[Borders::X] << ", " << location[Borders::Y] << std::endl;

      throw std::runtime_error("getRanks invalid location");
    }

  // We can now manually transform the the upper limit
  UpperLimit[coordinate] = LowerLimit[coordinate];
  UpperLimit[OtherCoordinate] = pCompartment->spaceToGrid(OtherCoordinate, gridToSpace(OtherCoordinate, UpperLimit[OtherCoordinate]));

  // LocalFile::debug() << pCompartment->getName() << ": (" << LowerLimit[Borders::X] << ", " << LowerLimit[Borders::Y] << ")-(" << UpperLimit[Borders::X] << ", " << UpperLimit[Borders::Y] << "):" << std::endl;


  std::set< size_t > Ranks;

  Ranks.insert(pCompartment->getRank(LowerLimit));
  Ranks.insert(pCompartment->getRank(UpperLimit));

  pCompartment->bisect(OtherCoordinate, LowerLimit, UpperLimit, Ranks);

  return Ranks;
}

void Compartment::bisect(const Borders::Coodinate & coordinate,
                         const std::vector< int > & low,
                         const std::vector< int > & high,
                         std::set< size_t > & ranks) const
{
  std::vector< int > Middle = low;
  Middle[coordinate] = (low[coordinate] + high[coordinate]) / 2;

  if (ranks.insert(getRank(Middle)).second)
    {
      bisect(coordinate, low, Middle, ranks);
      bisect(coordinate, Middle, high, ranks);
    }
}

size_t Compartment::getRank(const std::vector< int > & location) const
{
  std::vector< int > Location = location;

  Compartment * pTarget = transform(Location);

  // LocalFile::debug() << pTarget->getName() << ": (" << Location[Borders::X] << ", " << Location[Borders::Y] << "): ";

  if (pTarget == this)
    {
      size_t Rank = mpLayer->getRank(Location, 0, 0);
      // LocalFile::debug() << "Rank = " << Rank << std::endl;

      return Rank;
    }
  else if (pTarget != NULL)
    {
      // LocalFile::debug() << " -> ";

      return pTarget->getRank(Location);
    }

  return (size_t) INVALID;
}

size_t Compartment::getRank(const std::vector< int > & location, const int & xOffset, const int & yOffset) const
{
  std::vector< int > Location = location;
  // LocalFile::debug() << getName() << ": (" << Location[Borders::X] << ", " << Location[Borders::Y] << ") + (" << xOffset << ", " <<yOffset << ") -> (";

  Location[Borders::X] += xOffset;
  Location[Borders::Y] += yOffset;
  // LocalFile::debug() << Location[Borders::X] << ", " << Location[Borders::Y] << ") -> ";

  return getRank(Location);
}

void Compartment::addGroup(GroupInterface * pGroup)
{
  mGroups.push_back(pGroup);
}

void Compartment::act()
{
  std::vector< GroupInterface * >::iterator it = mGroups.begin();
  std::vector< GroupInterface * >::iterator end = mGroups.end();

  for (; it != end; ++it)
    {
      (*it)->act();
    }

  for (it = mGroups.begin(); it != end; ++it)
    {
      (*it)->move();
    }

  synchronizeCells();
}

void Compartment::diffuse()
{
  if (mpDiffuser != NULL)
    {
      mpDiffuser->diffuse(1.0); // TODO CRITICAL determine step size;
      synchronizeDiffuser();
    }
}

std::string Compartment::getName() const
{
  return Names[mType];
}

Compartment::LocalIterator Compartment::localBegin()
{
  return mpLayer->localBegin();
}

Compartment::LocalIterator Compartment::localEnd()
{
  return mpLayer->localEnd();
}
