#include "EpithelialCellGroup.h"
#include "BacteriaGroup.h"
#include "Cytokines.h"
#include "TcellGroup.h"

using namespace ENISI;

EpithelialCellGroup::EpithelialCellGroup(const boost::uintmax_t count, Compartment * pCompartment) :
  CoordinateMap(pCompartment)
{
  for (boost::uintmax_t i = 0; i < count; i++)
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

      addCellAt(EpithelialCellState::HEALTHY, newLoc);
    }
}

void EpithelialCellGroup::act()
{
  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
    {
      repast::Point<int> loc = it->first;
      StateCount stateCount = it->second;

      for (unsigned int i = 0; i < EpithelialCellState::KEEP_AT_END; ++i)
        {
          EpithelialCellState::State state = static_cast<EpithelialCellState::State>(i);

          for (unsigned int j = 0; j < stateCount.state[i]; ++j)
            {
              act(state, loc);
            }
        }
    }
}

void EpithelialCellGroup::act(EpithelialCellState::State state, const repast::Point<int> & loc)
{
  if (state == EpithelialCellState::DEAD) return;

  const std::vector<const BacteriaGroup::StateCount *>
  neighborList = getNeighbors(loc);

  std::vector<const BacteriaGroup::StateCount *>::const_iterator iter
    = neighborList.begin();

  //Get Tcell Neighbors for Rules 9 and 10
      const std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * > neighborListTcells
  	= getTcellNeighbors(loc);
      std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >::const_iterator iter2
  	=  neighborListTcells.begin();


  EpithelialCellState::State newState = state;

  while (iter != neighborList.end() && iter2 !=neighborListTcell.end)
    {
      const BacteriaGroup::StateCount * p_bacteriaStateCount = *iter;

      unsigned int infectiousBacteriaCount
        = p_bacteriaStateCount->state[BacteriaState::INFECTIOUS];
      unsigned int tolegenicBacteriaCount
        = p_bacteriaStateCount->state[BacteriaState::TOLEROGENIC];
    //Rules 9 and 10
      const TcellGroup::StateCount * p_tcellCount = *iter2;

            unsigned int th17Count
      	  	  = p_tcellCount->state[TcellState::TH17]; //Rule 10 when Th17 is in contact
            unsigned int th1Count
      	  	  = p_tcellCount->state[TcellState::TH1];//RUle 9 when Th1 is in contact

      if (infectiousBacteriaCount && state == EpithelialCellState::HEALTHY)
        {
          newState = EpithelialCellState::DAMAGED;
        }
      else if (tolegenicBacteriaCount && state == EpithelialCellState::HEALTHY)
        {
          newState = EpithelialCellState::HEALTHY;
        }
      else if (th17Count && state = EpithelialCellState::IMMATURE
         		  && mpCompartment->getName() == "LaminaPropria")
        {
          newState = EpithelialCellState::DAMAGED; /*Rule 10*/
          /* CHECK : Here there should be a function for information regarding the Layer,
          for eg. This rule requires the state transition when TH17 in LaminaPropria is in contact with E at 'Epithelium and LaminaPropria' membrane*/
        }
      else if (th1Count && state = EpithelialCellState::IMMATURE
               		  && mpCompartment->getName() == "LaminaPropria")
         {
           newState = EpithelialCellState::DAMAGED; /*Rule 9*/
           /* CHECK : Here there should be a function for information regarding the Layer,
           for eg. This rule requires the state transition when TH1 in LaminaPropria is in contact with E at 'Epithelium and LaminaPropria' membrane*/
          }
       else if (state = EpithelialCellState::IMMATURE && mpCompartment->getName() == "Epithelium")
          {
         	 addCellAt(state, newLoc);/* Rule 8*/
         	 delCellAt(EpithelialCellState::DAMAGED, loc); /*Rule 11*/
           }
      ++iter;
      ++iter2;
    }

  if (newState == EpithelialCellState::DAMAGED)
    {
      ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
      cytoMap["IL6"].first->setValueAtCoord(70, loc);
      cytoMap["IL12"].first->setValueAtCoord(70, loc);
    }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(newState, newLoc);
}

const std::vector< const typename CoordinateMap<BacteriaState::KEEP_AT_END>::StateCount * >
EpithelialCellGroup::getNeighbors(const repast::Point<int> & loc)
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

/*definition for function to find all neighbors that are Tcells (TH17 and TH1) */
std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >
	EpithelialCellGroup::getTcellNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * > allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "TcellGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          TcellGroup * p_TcellGroup = static_cast<TcellGroup *>(agents[i]);
          allNeighbors.push_back(p_TcellGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}




