#include "HPyloriGroup.h"
#include "EpithelialCellGroup.h"
#include "TcellGroup.h"

using namespace ENISI;

HPyloriGroup::HPyloriGroup(const boost::uintmax_t macrophageCount,
                           Compartment * pCompartment) :
    CoordinateMap(pCompartment)
{
  for (boost::uintmax_t i = 0; i < macrophageCount; i++)
    {
      const repast::GridDimensions * p_dimensions = getDimensions();

      repast::Point<double> extents = p_dimensions->extents();
      repast::Point<double> origin = p_dimensions->origin();

      double xStart = origin.getX();
      double yStart = origin.getY();

      double xEnd = origin.getX() + extents.getX();
      double yEnd = origin.getY() + extents.getY();

      double xCoord = repast::Random::instance()->createUniDoubleGenerator(
          xStart, xEnd).next();

      double yCoord = repast::Random::instance()->createUniDoubleGenerator(
          yStart, yEnd).next();

      repast::Point<int> initialLoc(xCoord, yCoord);

      std::vector<double> moveTo = randomMove(1, initialLoc);
      repast::Point<int> newLoc(moveTo[0], moveTo[1]);

      addCellAt(HPyloriState::NAIVE, newLoc);
    }
}

void HPyloriGroup::act()
{
}

void HPyloriGroup::act(HPyloriState::State state,
                       const repast::Point<int> & loc)
{
  if (state == HPyloriState::DEAD)
    return;

  const std::vector<
      const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount *> neighborList =
      getEpithelialCellNeighbors(loc);
  std::vector<
      const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount *>::const_iterator iter =
      neighborList.begin();

  std::vector<
      const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount *> neighborList2 =
      getTcellNeighbors(loc);
  std::vector<
      const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount *>::const_iterator iter2 =
      neighborList2.begin();

  while (iter != neighborList.end() && iter2 != neighborList2.end())
    {
      /*identify states of Epithelial Cells counted */
      unsigned int damagedEpithelialCellCount =
          (*iter)->state[EpithelialCellState::DAMAGED];

      /* move HPylori across epithelial border if in contact with damaged Epithelial cell */
      if (damagedEpithelialCellCount && mpCompartment->getName() == "Lumen")
        {
          std::vector<int> NewHPyloriLoc = loc.coords();
          NewHPyloriLoc[1] += 2;
          delCellAt(state, loc);
          addCellAt(state, NewHPyloriLoc);
        }

      unsigned int th1Count = (*iter2)->state[TcellState::TH1];
      unsigned int th17Count = (*iter2)->state[TcellState::TH17];

      /* HPylori dies is nearby damaged epithelial cell, th1 or th17*/
      if (damagedEpithelialCellCount || th1Count || th17Count)
        {
          // newState = HPyloriState::DEAD;
        }

      ++iter;
      ++iter2;
    }

  /* TODO: H Pylori are removed when macrophage uptake/differentiate */

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(state, newLoc);
}

std::vector<
    const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount *> HPyloriGroup::getEpithelialCellNeighbors(
    const repast::Point<int> & loc)
{
  std::vector<
      const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount *> allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "EpithelialCellGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          EpithelialCellGroup * p_epithelialcellGroup =
              static_cast<EpithelialCellGroup *>(agents[i]);
          allNeighbors.push_back(p_epithelialcellGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}

std::vector<const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount *> HPyloriGroup::getTcellNeighbors(
    const repast::Point<int> & loc)
{
  std::vector<
      const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount *> allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "TcellGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          TcellGroup * p_tcellGroup = static_cast<TcellGroup *>(agents[i]);
          allNeighbors.push_back(p_tcellGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}
