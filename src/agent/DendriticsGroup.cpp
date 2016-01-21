#include "DendriticsGroup.h"

DendriticsGroup::DendriticsGroup(
    const boost::uintmax_t dendriticsCount, CellLayer * p_layer)
  : CellGroup(p_layer)
{
  for (boost::uintmax_t i = 0; i < dendriticsCount; i++) 
  {
    repast::GridDimensions dimensions = getDimensions();

    repast::Point<double> extents = dimensions.extents();
    repast::Point<double> origin = dimensions.origin();

    double xStart = origin.getX();
    double yStart = origin.getY();

    double xEnd = origin.getX() + extents.getX();
    double yEnd = origin.getY() + extents.getY();

    double xCoord = repast::Random::instance()
      ->createUniDoubleGenerator(xStart, xEnd).next();

    double yCoord = repast::Random::instance()
      ->createUniDoubleGenerator(yStart, yEnd).next();

    repast::Point<int> initialLoc(xCoord, yCoord);

    std::vector<double> moveTo = randomMove(1, initialLoc);
    repast::Point<int> newLoc(moveTo[0], moveTo[1]);

    coordMap[newLoc].state[IMMATURE]++;
  }
}

std::vector<double> DendriticsGroup::randomMove(
    const double & speed, const repast::Point<int> & fromPt) 
{
  double fullCircle = 2 * 3.14; // in radians
  double angle = 
    repast::Random::instance()->createUniDoubleGenerator(0, fullCircle).next();
  double radius = 
    repast::Random::instance()->createUniDoubleGenerator(0, speed).next();

  std::vector<double> moveTo;
  moveTo.push_back( fromPt.getX() + radius * cos(angle) );
  moveTo.push_back( fromPt.getY() + radius * sin(angle) );

  return moveTo;
}
void DendriticsGroup::act() 
{
  typedef CoordMap::iterator it_type;

  for(it_type it = coordMap.begin(); it != coordMap.end(); it++) 
  {
    repast::Point<int> loc = it->first;
    StateCount stateCount = it->second;

    for (unsigned int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      State state = static_cast<State>(i);
      for (unsigned int j = 0; j < stateCount.state[i]; ++j)
      {
	act(state, loc);
      }
    }
  }
}

void DendriticsGroup::act(State state, const repast::Point<int> & loc)
{
  if (state == DEAD) return;

  const std::vector<BacteriaGroup::StateCount> 
    neighborList = getBacteriaNeighbors(loc);

  std::vector<BacteriaGroup::StateCount>::const_iterator iter 
    = neighborList.begin();

  State newState = state;
  while ( iter != neighborList.end() )
  {
    const BacteriaGroup::StateCount bacteriaStateCount = *iter;

    unsigned int infectiousBacteriaCount 
      = bacteriaStateCount.state[BacteriaGroup::INFECTIOUS];
    unsigned int tolegenicBacteriaCount 
      = bacteriaStateCount.state[BacteriaGroup::TOLEGENIC];

    if (infectiousBacteriaCount && state == IMMATURE) 
    {
      newState = EFFECTOR;
    } 
    else if ( tolegenicBacteriaCount && state == IMMATURE ) 
    {
      newState = TOLEROGENIC;
    }
    ++iter;
  }

  if (newState == EFFECTOR) 
  {
    Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    cytoMap["IL6"]->setValueAtCoord(70, loc);
    cytoMap["IL12"]->setValueAtCoord(70, loc);
  }
  else if (newState == TOLEROGENIC) 
  {
    Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    cytoMap["TGFb"]->setValueAtCoord(70, loc);
  }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  coordMap[loc].state[state]--;
  coordMap[newLoc].state[newState]++;
}

const std::vector<BacteriaGroup::StateCount> 
DendriticsGroup::getBacteriaNeighbors(const repast::Point<int> & loc)
{
  std::vector<BacteriaGroup *> & instances 
    = BacteriaGroup::instances();

  std::vector<BacteriaGroup::StateCount> allNeighbors;

  for (size_t i = 0; i < instances.size(); ++i)
  {
    const BacteriaGroup::StateCount &
      neighbors = instances[i]->getCellsAt(loc);

    allNeighbors.push_back(neighbors);
  }

  return allNeighbors;
}
