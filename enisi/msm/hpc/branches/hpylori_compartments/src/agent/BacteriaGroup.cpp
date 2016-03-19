#include "BacteriaGroup.h"
#include "TcellGroup.h"

using namespace ENISI;

BacteriaGroup::BacteriaGroup(const boost::uintmax_t bacteriaCount, Compartment * pCompartment) :
  CoordinateMap(pCompartment)
{
  init(bacteriaCount);
}

void BacteriaGroup::init(const boost::uintmax_t bacteriaCount)
{
  for (boost::uintmax_t i = 0; i < bacteriaCount; i++)
    {
      BacteriaState::State state = BacteriaState::INFECTIOUS;

      if (i >= bacteriaCount / 2) {state = BacteriaState::TOLEGENIC;}

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

      addCellAt(state, newLoc);
    }
}

void BacteriaGroup::act()
{
  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
    {
      repast::Point<int> loc = it->first;
      StateCount stateCount  = it->second;

      for (unsigned int i = 0; i < BacteriaState::KEEP_AT_END; ++i)
        {
          BacteriaState::State state = static_cast<BacteriaState::State>(i);

          for (unsigned int j = 0; j < stateCount.state[i]; ++j)
            {
              act(state, loc);
            }
        }
    }
}

void BacteriaGroup::act(
  BacteriaState::State state, const repast::Point<int> & loc)
{
  if (state == BacteriaState::DEAD) return;

  const std::vector< const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount * >
    neighborList = getEpithelialCellNeighbors(loc);

    std::vector< const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount * >::const_iterator iter
      = neighborList.begin();

    const std::vector< const TcellGroup::StateCount *>
    neighborList2 = getTcellNeighbors(loc);

    std::vector< const TcellGroup::StateCount *>::const_iterator iter2
      = neighborList2.begin();

    while (iter != neighborList.end() && iter2 != neighborList2.end())
         {
           const EpithelialCellGroup::StateCount * p_epithelialcellStateCount = *iter;

           /*identify states of Epithelial Cells counted */
           unsigned int damagedEpithelialCellCount
             = p_epithelialcellStateCount->state[EpithelialCellState::DAMAGED];


           /* move Bacteria across epithelial border if in contact with damaged Epithelial cell */
           if (damagedEpithelialCellCount && mpCompartment->getName() == "Lumen")
           {
          	std::vector BacteriaLoc;
          	CoordinateMap -> getLocation (state, loc);
          	std::vector NewBacteriaLoc;
          	NewBacteriaLoc.push_back(BacteriaLoc[0]);
          	NewBacteriaLoc.push_back(BacteriaLoc[1]+2);
          	delCellAt(state,loc);
          	addCellAt(state,NewBacteriaLoc);
           }

           const TcellGroup::StateCount * p_tcellCount = *iter2;

           unsigned int th1Count = p_tcellCount->state[TcellState::TH1];
           unsigned int th17Count = p_tcellCount->state[TcellState::TH17];

           /* Bacteria dies is nearby damaged epithelial cell, th1 or th17 and is infectious*/
           if ((newState == BacteriaState::INFECTIOUS) && (damagedEpithelialCellCount || th1Count || th17Count))
           {
               delCellAt(state, loc);
               addCellAt(BacteriaState::DEAD, loc);
               return;
           }

      ++iter;
      ++iter2;
    }

    /* Bacteria become infectious when moved into Lamina Propria */
               if (mpCompartment->getName()== "LaminaPropria")
               {
            	   newState = BacteriaState::INFECTIOUS;
               }

               /* TODO: Bacteria are removed when macrophage uptake/differentiate */

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(state, newLoc);
}

const std::vector< const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount * >
BacteriaGroup::getEpithelialCellNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<EpithelialCellState::KEEP_AT_END>::StateCount * > allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "EpithelialCellGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          EpithelialCellGroup * p_epithelialcellGroup = static_cast<EpithelialCellGroup *>(agents[i]);
          allNeighbors.push_back(p_epithelialcellGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}

const std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >
BacteriaGroup::getTcellNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * > allNeighbors;

  std::vector<Agent *> agents = layer()->selectAllAgents();

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
