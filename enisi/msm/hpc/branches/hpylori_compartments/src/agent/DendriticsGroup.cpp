#include "DendriticsGroup.h"
#include "HPyloriGroup.h"
#include "BacteriaGroup.h"
#include "Cytokines.h"

using namespace ENISI;

DendriticsGroup::DendriticsGroup(const boost::uintmax_t dendriticsCount, Compartment * pCompartment) :
  CoordinateMap(pCompartment)
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
  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
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

  /* get TolB neighbors */
  const std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * >
  neighborList = getBacteriaNeighbors(loc);

  std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * >::const_iterator iter
    = neighborList.begin();

  /* get HPylori neighbors */
  const std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >
  neighborList2 = getHPyloriNeighbors(loc);

  std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >::const_iterator iter2
    = neighborList2.begin();

  DendriticState::State newState = state;

  while (iter != neighborList.end() && iter2 != neighborList2.end())
    {
      const BacteriaGroup::StateCount * p_bacteriaStateCount = *iter;

      /* with new compartments bacteria state only needs live and dead, as infectious are all in LP and
       * tolegenic are all in lumen     */
      unsigned int infectiousBacteriaCount
        = p_bacteriaStateCount->state[BacteriaState::INFECTIOUS];
      unsigned int tolegenicBacteriaCount
        = p_bacteriaStateCount->state[BacteriaState::TOLEROGENIC];

      const HPyloriGroup::StateCount * p_hpyloriStateCount = *iter2;

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      unsigned int liveHPyloriCount
        = p_hpyloriStateCount->state[HPyloriState::NAIVE];

      /* if no bacteria is around DC, then stays immature */
      if (infectiousBacteriaCount + liveHPyloriCount == 0 && state == DendriticState::IMMATURE)
        {
          newState = DendriticState::IMMATURE;
        }
      /*if more HPylori surrounds DC than bacteria and DC is in epithelium then becomes effector --
       *  0.5 is arbitrary */
      else if (liveHPyloriCount > 0.5 * tolegenicBacteriaCount + 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "Epithelium")
        {
          newState = DendriticState::EFFECTOR;
        }
      /*if less HPylori surrounds DC than bacteria and DC is in epithelium then becomes tolerogenic --
       *  0.5 is arbitrary */
      else if (liveHPyloriCount <= 0.5 * tolegenicBacteriaCount + 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "Epithelium")
        {
          newState = DendriticState::TOLEROGENIC;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary */
      else if (liveHPyloriCount + tolegenicBacteriaCount > 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "LaminaPropria")
        {
          newState = DendriticState::EFFECTOR;
        }
      /*if sufficient Hpylori and bacteria surround DC and DC is in lamina propria then becomes effector --
       *  1 is arbitrary */
      else if (liveHPyloriCount + tolegenicBacteriaCount <= 1
               && state == DendriticState::IMMATURE
               && mpCompartment->getName() == "LaminaPropria")
        {
          newState = DendriticState::TOLEROGENIC;
        }

      ++iter;
      ++iter2;
    }

  if (newState == DendriticState::EFFECTOR)
    {
      ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
      cytoMap["IL6"].first->setValueAtCoord(70, loc);
      cytoMap["IL12"].first->setValueAtCoord(70, loc);
    }
  else if (newState == DendriticState::TOLEROGENIC)
    {
      ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
      cytoMap["TGFb"].first->setValueAtCoord(70, loc);
    }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(newState, newLoc);
}

const std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * >
DendriticsGroup::getBacteriaNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * > allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "BacteriaGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          BacteriaGroup * p_bacteriaGroup = static_cast<BacteriaGroup *>(agents[i]);
          allNeighbors.push_back(p_bacteriaGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}

/*function to find all neighbors that are HPylori */
const std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >
DendriticsGroup::getHPyloriNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * > allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "HPyloriGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          HPyloriGroup * p_hpyloriGroup = static_cast<HPyloriGroup *>(agents[i]);
          allNeighbors.push_back(p_hpyloriGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}
