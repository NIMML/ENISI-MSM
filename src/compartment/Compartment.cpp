#include "Compartment.h"
#include "compartment/DiffuserLayer.h"
#include "grid/Properties.h"

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
  mpBorders(NULL),
  // mpLocalBorders(NULL),
  mAdjacentCompartments(2, std::vector< Type >(2, INVALID)),
  mUniform(repast::Random::instance()->createUniDoubleGenerator(0.0, 1.0))
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

  mpBorders = new Borders(mDimensions);
  mpBorders->setBorderType(Borders::Y, Borders::LOW, mProperties.borderLowType);
  mpBorders->setBorderType(Borders::Y, Borders::HIGH, mProperties.borderHighType);

  // mpLocalBorders = new Borders(mpLayer->dimensions());
  // mpLocalBorders->setBorderType(Borders::X, Borders::LOW, Borders::PERMIABLE);
  // mpLocalBorders->setBorderType(Borders::X, Borders::HIGH, Borders::PERMIABLE);
  // mpLocalBorders->setBorderType(Borders::Y, Borders::LOW, Borders::PERMIABLE);
  // mpLocalBorders->setBorderType(Borders::Y, Borders::HIGH, Borders::PERMIABLE);

  mAdjacentCompartments[Borders::X][Borders::LOW] = INVALID;
  mAdjacentCompartments[Borders::X][Borders::HIGH] = INVALID;
  mAdjacentCompartments[Borders::Y][Borders::LOW] = mProperties.borderLowCompartment;
  mAdjacentCompartments[Borders::Y][Borders::HIGH] = mProperties.borderHighCompartment;
}

Compartment::~Compartment()
{
  if (mpLayer != NULL) delete mpLayer;
  if (mpBorders != NULL) delete mpBorders;
  // if (mpLocalBorders != NULL) delete mpBorders;

  while(!_diffuserLayers.empty()) 
    delete _diffuserLayers.back(), _diffuserLayers.pop_back();
}

const repast::GridDimensions & Compartment::dimensions() const
{
  return mDimensions;
}

const repast::GridDimensions & Compartment::localDimensions() const
{
  return mpLayer->spaceDimensions();
}

const Borders * Compartment::borders() const
{
  return mpBorders;
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

  if (mpBorders->boundsCheck(pt, &BoundState))
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

  if (!mpBorders->boundsCheck(Location, &BoundState))
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
                *itLocation = mDimensions.origin(i) - mpBorders->distanceFromBorder(Location, (Borders::Coodinate) i, Borders::LOW);
                break;

              case Borders::OUT_HIGH:
                *itLocation = mDimensions.origin(i) + mDimensions.extents(i) - mpBorders->distanceFromBorder(Location, (Borders::Coodinate) i, Borders::HIGH);
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
  mDimensions(dimensions),
  mCurrent(floor(round(dimensions.origin(0))), floor(round(dimensions.origin(1))))
{}

Compartment::GridIterator::~GridIterator()
{}

bool Compartment::GridIterator::next()
{
  size_t i, imax = mDimensions.dimensionCount();

  for (i = 0; i < imax; ++i)
    {
      mCurrent[i]++;

      if (mCurrent[i] < mDimensions.origin(i) + mDimensions.extents(i))
        {
          return true;
        }

      mCurrent[i] = round(mDimensions.origin(i));
    }

  return false;
}

const repast::Point< int > & Compartment::GridIterator::operator *()
{
  return mCurrent;
}

const repast::Point< int > & Compartment::GridIterator::operator ->()
{
  return mCurrent;
}

Compartment::GridIterator::operator bool()
{
  size_t i, imax = mDimensions.dimensionCount();

  for (i = 0; i < imax; ++i)
    {
      if (mCurrent[i] >= mDimensions.origin(i) + mDimensions.extents(i))
        {
          return false;
        }
    }

  return true;
}

