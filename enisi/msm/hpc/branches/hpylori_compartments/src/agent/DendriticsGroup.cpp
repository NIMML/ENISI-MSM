#include "DendriticsGroup.h"

DendriticsGroup::DendriticsGroup(
    const boost::uintmax_t dendriticsCount, CellLayer * p_layer)
  : CoordinateMap(p_layer)
{
  for (boost::uintmax_t i = 0; i < dendriticsCount; i++) 
  {
    const repast::GridDimensions * p_dimensions = getDimensions();

    repast::Point<double> extents = p_dimensions->extents();
    repast::Point<double> origin = p_dimensions->origin();

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

    addCellAt(DendriticState::IMMATURE, newLoc);
  }
}

void DendriticsGroup::act() 
{
  typedef CoordMap::const_iterator it_type;
  it_type end = coordMapEnd();

  for(it_type it = coordMapBegin(); it != end; it++) 
  {
    repast::Point<int> loc = it->first;
    StateCount stateCount = it->second;

    for (unsigned int i = 0; i < DendriticState::KEEP_AT_END; ++i)
    {
      DendriticState::State state = static_cast<DendriticState::State>(i);
      for (unsigned int j = 0; j < stateCount.state[i]; ++j)
      {
	act(state, loc);
      }
    }
  }
}

void DendriticsGroup::act(
    DendriticState::State state, const repast::Point<int> & loc)
{
  if (state == DendriticState::DEAD) return;

  const std::vector<const BacteriaGroup::StateCount *> 
    neighborList = getBacteriaNeighbors(loc);

  std::vector<const BacteriaGroup::StateCount *>::const_iterator iter 
    = neighborList.begin();

  DendriticState::State newState = state;
  while ( iter != neighborList.end() )
  {
    const BacteriaGroup::StateCount * p_bacteriaStateCount = *iter;

    unsigned int infectiousBacteriaCount 
      = p_bacteriaStateCount->state[BacteriaState::INFECTIOUS];
    unsigned int tolegenicBacteriaCount 
      = p_bacteriaStateCount->state[BacteriaState::TOLEGENIC];

    if (infectiousBacteriaCount && state == DendriticState::IMMATURE) 
    {
      newState = DendriticState::EFFECTOR;
    } 
    else if ( tolegenicBacteriaCount && state == DendriticState::IMMATURE ) 
    {
      newState = DendriticState::TOLEROGENIC;
    }
    ++iter;
  }

  if (newState == DendriticState::EFFECTOR) 
  {
    Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    cytoMap["IL6"]->setValueAtCoord(70, loc);
    cytoMap["IL12"]->setValueAtCoord(70, loc);
  }
  else if (newState == DendriticState::TOLEROGENIC) 
  {
    Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    cytoMap["TGFb"]->setValueAtCoord(70, loc);
  }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(newState, newLoc);
}

const std::vector<const BacteriaGroup::StateCount *> 
DendriticsGroup::getBacteriaNeighbors(const repast::Point<int> & loc)
{
  std::vector<BacteriaGroup *> & instances 
    = BacteriaGroup::instances();

  std::vector<const BacteriaGroup::StateCount *> allNeighbors;

  for (size_t i = 0; i < instances.size(); ++i)
  {
    const BacteriaGroup::StateCount *
      neighbors = instances[i]->getCellsAt(loc);

    allNeighbors.push_back(neighbors);
  }

  return allNeighbors;
}
