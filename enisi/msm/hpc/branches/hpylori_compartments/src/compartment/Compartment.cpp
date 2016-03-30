#include "Compartment.h"
#include "compartment/DiffuserLayer.h"
#include "grid/Properties.h"
#include "agent/Cytokine.h"
#include "agent/SharedValueLayer.h"

using namespace ENISI;

// static
const char* Compartment::Names[] = {"lumen", "epithilium", "lamina_propria", "gastric_lymph_node", NULL};

// static
Compartment* Compartment::INSTANCES[] = {NULL, NULL, NULL, NULL};

// static
Compartment* Compartment::instance(const Compartment::Type & type)
{
  Compartment *pInstance = INSTANCES[type];

  if (pInstance == NULL)
    {
      pInstance = new Compartment(type);
    }

  return pInstance;
}

Compartment::Compartment(const Type & type):
  _diffuserLayers(),
  mType(type),
  mProperties(),
  mDimensions(),
  mpLayer(NULL),
  mpSpaceBorders(NULL),
  mpGridBorders(NULL),
  mAdjacentCompartments(2, std::vector< Type >(2, INVALID)),
  mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0)),
  mCytokineMap(),
  mpDiffuserValues(NULL)
{
  std::string Name = Names[mType];

  Properties::getValue(Name + ".space.x", mProperties.spaceX);
  Properties::getValue(Name + ".space.y", mProperties.spaceY);
  Properties::getValue(Name + ".grid.x", mProperties.gridX);
  Properties::getValue(Name + ".grid.y", mProperties.gridY);

  std::string borderLow = Properties::getValue(Name + ".border.y.low");
  mProperties.borderLowCompartment = Properties::toEnum(borderLow, Names, INVALID);
  mProperties.borderLowType = Properties::toEnum(borderLow, Borders::TypeNames, Borders::PERMIABLE);

  std::string borderHigh = Properties::getValue(Name + ".border.y.high");
  mProperties.borderHighCompartment = Properties::toEnum(borderHigh, Names, INVALID);
  mProperties.borderHighType = Properties::toEnum(borderHigh, Borders::TypeNames, Borders::PERMIABLE);

  std::vector< double > Origin(2, 0);
  std::vector< double > SpaceExtents(2);
  SpaceExtents[Borders::X] = mProperties.spaceX;
  SpaceExtents[Borders::Y] = mProperties.spaceY;
  std::vector< double > GridExtents(2);
  GridExtents[Borders::X] = mProperties.gridX;
  GridExtents[Borders::Y] = mProperties.gridY;

  mDimensions = repast::GridDimensions(Origin, SpaceExtents);
  repast::GridDimensions GridDimensions(Origin, GridExtents);

  mpLayer = new SharedLayer(Name, mDimensions, GridDimensions);

  mpSpaceBorders = new Borders(mDimensions);
  mpSpaceBorders->setBorderType(Borders::Y, Borders::LOW, mProperties.borderLowType);
  mpSpaceBorders->setBorderType(Borders::Y, Borders::HIGH, mProperties.borderHighType);

  mpGridBorders = new Borders(GridDimensions);
  mpGridBorders->setBorderType(Borders::Y, Borders::LOW, mProperties.borderLowType);
  mpGridBorders->setBorderType(Borders::Y, Borders::HIGH, mProperties.borderHighType);

  mAdjacentCompartments[Borders::X][Borders::LOW] = INVALID;
  mAdjacentCompartments[Borders::X][Borders::HIGH] = INVALID;
  mAdjacentCompartments[Borders::Y][Borders::LOW] = mProperties.borderLowCompartment;
  mAdjacentCompartments[Borders::Y][Borders::HIGH] = mProperties.borderHighCompartment;
}

Compartment::~Compartment()
{
  if (INSTANCES[mType] == this)
    {
      INSTANCES[mType] = NULL;
    }

  if (mpLayer != NULL) delete mpLayer;
  if (mpSpaceBorders != NULL) delete mpSpaceBorders;
  if (mpGridBorders != NULL) delete mpGridBorders;

  while(!_diffuserLayers.empty()) 
    delete _diffuserLayers.back(), _diffuserLayers.pop_back();
}

const repast::GridDimensions & Compartment::dimensions() const
{
  return mDimensions;
}

const repast::GridDimensions & Compartment::localSpaceDimensions() const
{
  return mpLayer->spaceDimensions();
}

const repast::GridDimensions & Compartment::localGridDimensions() const
{
  return mpLayer->gridDimensions();
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

Compartment::GridIterator Compartment::begin()
{
  return GridIterator(mpLayer->gridDimensions());
}

void Compartment::getLocation(const repast::AgentId & id, std::vector<double> & Location) const
{
  mpLayer->getLocation(id, Location);
}

bool Compartment::moveTo(const repast::AgentId &id, const repast::Point< double > &pt)
{
  return moveTo(id, pt.coords());
}

bool Compartment::moveTo(const repast::AgentId &id, const std::vector< double > &pt)
{
  std::vector< Borders::BoundState > BoundState(2);

  if (mpSpaceBorders->boundsCheck(pt, &BoundState))
    {
      return mpLayer->moveTo(id, pt);
    }

  // We are at the compartment boundaries;
  size_t i = Borders::X;
  std::vector<double> Out(2);

  std::vector<Borders::BoundState>::const_iterator itState = BoundState.begin();
  std::vector<Borders::BoundState>::const_iterator endState = BoundState.end();
  std::vector<double>::const_iterator itIn = pt.begin();
  std::vector<double>::iterator itOut = Out.begin();

  Compartment * pTarget = NULL;

  for (; itState != endState; ++itState, ++itIn, ++itOut, ++i)
    {
      if (pTarget != NULL)
        {
          *itOut = *itIn;
          continue;
        }

      switch (*itState)
        {
          case Borders::OUT_LOW:
            if (mAdjacentCompartments[i][Borders::LOW] != INVALID)
              {
                pTarget = instance(mAdjacentCompartments[i][Borders::LOW]);
                const repast::GridDimensions & Dimensions = pTarget->dimensions();
                *itOut = Dimensions.origin(i) + Dimensions.extents(i) + *itIn - mDimensions.origin(i);
              }
            else
              {
                throw std::invalid_argument("No adjacent Compartment");
              }

            break;

          case Borders::OUT_HIGH:
            if (mAdjacentCompartments[i][Borders::HIGH] != INVALID)
              {
                pTarget = instance(mAdjacentCompartments[i][Borders::HIGH]);
                const repast::GridDimensions & Dimensions = pTarget->dimensions();
                *itOut = Dimensions.origin(i) + *itIn - mDimensions.extents(i);
              }
            else
              {
                throw std::invalid_argument("No adjacent Compartment");
              }

            break;

          case Borders::INBOUND:
            *itOut = *itIn;
            break;
        }
    }

  bool success = true;

  if (pTarget != NULL)
    {
      Agent * pAgent = mpLayer->getAgent(id);
      success = pTarget->addAgent(pAgent, Out);
      removeAgent(pAgent);
    }

  return success;
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

  std::vector< Borders::BoundState > BoundState(2);

  if (!mpSpaceBorders->boundsCheck(Location, &BoundState))
    {
      // We are at the compartment boundaries;
      // Since this is a random move we reflect at the compartment border

      size_t i = Borders::X;

      std::vector<Borders::BoundState>::const_iterator itState = BoundState.begin();
      std::vector<Borders::BoundState>::const_iterator endState = BoundState.end();
      std::vector<double>::iterator itLocation = Location.begin();

      for (; itState != endState; ++itState, ++itLocation, ++i)
        {
          switch (*itState)
            {
              case Borders::OUT_LOW:
                *itLocation = mDimensions.origin(i) - mpSpaceBorders->distanceFromBorder(Location, (Borders::Coodinate) i, Borders::LOW);
                break;

              case Borders::OUT_HIGH:
                *itLocation = mDimensions.origin(i) + mDimensions.extents(i) - mpSpaceBorders->distanceFromBorder(Location, (Borders::Coodinate) i, Borders::HIGH);
                break;

              case Borders::INBOUND:
                break;
            }
        }
    }

  return moveTo(id, Location);
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
  mpLayer->getAgents(pt, out);
}

void Compartment::getAgents(const repast::Point< int > &pt,
                            const int & types,
                            std::vector< Agent * > &out)
{
  mpLayer->getAgents(pt, types, out);
}

size_t Compartment::addCytokine(const std::string & name)
{
  Cytokine * pCytokine = new Cytokine(getName() + "." + name);

  pCytokine->setIndex(mCytokines.size());
  mCytokines.push_back(pCytokine);
  mCytokineMap.insert(std::make_pair(pCytokine->getName(), pCytokine->getIndex()));

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

double & Compartment::cytokineValue(const std::string & name, const repast::Point< int > & location)
{
  return mpDiffuserValues->operator[](location)[mCytokineMap[name]];
}

void Compartment::initializeDiffuserData()
{
  if (mCytokineMap.empty()) return;

  if (mpDiffuserValues == NULL)
    {
      mpDiffuserValues = new SharedValueLayer(Agent::DiffuserValues, mType, mCytokineMap.size());
      mpLayer->addDiffuserValues(mpDiffuserValues);

      std::vector< double > InitialValues(mCytokineMap.size());
      std::vector< double >::iterator itInitialValue = InitialValues.begin();
      std::vector< Cytokine * >::const_iterator it = mCytokines.begin();
      std::vector< Cytokine * >::const_iterator end = mCytokines.end();

      for (; it != end; ++it, ++itInitialValue)
        {
          *itInitialValue = (*it)->getInitialValue();
        }

      for (GridIterator itGrid = begin(); itGrid; itGrid.next())
        {
          mpDiffuserValues->operator[](*itGrid) = InitialValues;
        }
    }
}

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
  return operator[](mpLayer->spaceToGrid(location));
}

DiffuserLayer * Compartment::newDiffuserLayer()
{
  DiffuserLayer * p_layer = new DiffuserLayer(mDimensions);
  _diffuserLayers.push_back(p_layer);
  return p_layer;
}

void Compartment::requestDiffuserAgents()
{
  for (size_t i = 0; i < _diffuserLayers.size(); ++i)
  {
    _diffuserLayers[i]->requestAgents();
  }
}

void Compartment::diffuse()
{
  for (size_t i = 0; i < _diffuserLayers.size(); i++)
  {
    _diffuserLayers[i]->diffuse();
  }
}

void Compartment::updateReferenceDiffuserGrid()
{
  for (size_t i = 0; i < _diffuserLayers.size(); i++)
  {
    _diffuserLayers[i]->updateReferenceDiffuserGrid();
  }
}

const Compartment::Type & Compartment::getType() const
{
  return mType;
}

std::string Compartment::getName() const
{
  return Names[mType];
}

Compartment::GridIterator::GridIterator(const repast::GridDimensions & dimensions):
  mOrigin(dimensions.dimensionCount(), 0),
  mExtents(dimensions.dimensionCount(), 0),
  mCurrent(dimensions.dimensionCount(), 0)
{
  for (size_t i = 0; i < dimensions.dimensionCount(); ++i)
    {
      mOrigin[i] = floor(dimensions.origin(i));
      mExtents[i] = floor(dimensions.extents(i));
    }

  mCurrent = mOrigin;
}

Compartment::GridIterator::GridIterator(const repast::Point< int > & origin, repast::Point< int > & extents):
  mOrigin(origin),
  mExtents(extents),
  mCurrent(origin)
{}

Compartment::GridIterator::~GridIterator()
{}

bool Compartment::GridIterator::next(const size_t coodinate)
{
  size_t i, imax = mOrigin.dimensionCount();

  for (i = coodinate; i < imax; ++i)
    {
      mCurrent[i]++;

      if (mCurrent[i] < mOrigin[i] + mExtents[i])
        {
          return true;
        }

      mCurrent[i] = round(mOrigin[i]);
    }

  return false;
}

const repast::Point< int > & Compartment::GridIterator::operator *()
{
  return mCurrent;
}

const repast::Point< int > * Compartment::GridIterator::operator ->()
{
  return &mCurrent;
}

Compartment::GridIterator::operator bool()
{
  size_t i, imax = mOrigin.dimensionCount();

  for (i = 0; i < imax; ++i)
    {
      if (mCurrent[i] >= mOrigin[i] + mExtents[i])
        {
          return false;
        }
    }

  return true;
}

