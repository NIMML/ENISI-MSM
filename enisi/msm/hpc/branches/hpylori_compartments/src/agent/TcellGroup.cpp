#include "TcellGroup.h"

using namespace ENISI;

TcellGroup::TcellGroup(const boost::uintmax_t tcellCount,
                       Compartment * pCompartment) :
    CoordinateMap(pCompartment)
{
  init(tcellCount);
}

void TcellGroup::init(const boost::uintmax_t tCellCount)
{
  for (boost::uintmax_t i = 0; i < tCellCount; i++)
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

      addCellAt(TcellState::NAIVE, newLoc);
    }
}

void TcellGroup::act()
{
  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
    {
      repast::Point<int> loc = it->first;
      const StateCount count = it->second;

      for (unsigned int i = 0; i < TcellState::KEEP_AT_END; ++i)
        {
          TcellState::State state = static_cast<TcellState::State>(i);
          for (unsigned int j = 0; j < count.state[i]; ++j)
            {
              act(state, loc);
            }
        }
    }
}

void TcellGroup::act(TcellState::State state, const repast::Point<int> & loc)
{
  if (state == TcellState::DEAD)
    return;

  const std::vector<const MacrophageGroup::StateCount * > neighborList = getMacrophageNeighbors(loc);
  std::vector<const MacrophageGroup::StateCount *>::const_iterator iter = neighborList.begin();

  TcellState::State newState = state;
  double IL6 = Cytokines::instance().get("IL6", loc);
  double TGFb = Cytokines::instance().get("TGFb", loc);
  double IL12 = Cytokines::instance().get("IL12", loc);
  while (iter != neighborList.end())
    {
      unsigned int macrophageregCount = (*iter)->state[MacrophageState::REGULATORY];

      if (IL6 + TGFb + IL12 > 1.0)
        {
          /* set initial concentrations */
          TcellODE & odeModel = TcellODE::getInstance();
          odeModel.setInitialConcentration("IL6", IL6);
          odeModel.setInitialConcentration("TGFb", TGFb);
          odeModel.setInitialConcentration("IL12", IL12);

          /* run time course */
          odeModel.runTimeCourse();

          double IFNg = odeModel.getConcentration("IFNg");
          double IL17 = odeModel.getConcentration("IL17");
          double IL10 = odeModel.getConcentration("IL10");

          /* get output cytokines */
          Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["IFNg"].first->setValueAtCoord(IFNg, loc);
          cytoMap["IL17"].first->setValueAtCoord(IL17, loc);
          cytoMap["IL10"].first->setValueAtCoord(IL10, loc);

          if (IL17 > 0.5)
            {
              newState = TcellState::TH17;
            }
          else if (IFNg > 0.5)
            {
              newState = TcellState::TH1;
            }
          else if (IL10 > 0.5)
            {
              newState = TcellState::TREG;
            }
          else if ((IL10 > 0.5 * IFNg) && (macrophageregCount > 0))
            {
              newState = TcellState::Tr;
            } // The rule is if nT is in contact with REGULATORY macrophages, and if IL10> a* IFNg
              //then nT -> Tr (state transition). Here, 'a' has been hard coded as 0.5
          ++iter;
        }

      std::vector<double> moveTo = randomMove(1, loc);
      repast::Point<int> newLoc(moveTo[0], moveTo[1]);

      delCellAt(state, loc);
      addCellAt(newState, newLoc);
    }
}

int TcellGroup::count()
{
  int total = 0;

  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
    {
      const StateCount count = it->second;

      for (unsigned int i = 0; i < TcellState::KEEP_AT_END; ++i)
        {
          total += count.state[i];
        }
    }

  return total;
}

TcellGroup::StateCount TcellGroup::countByState()
{
  StateCount total;

  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
    {
      const StateCount count = it->second;
      for (int i = 0; i < TcellState::KEEP_AT_END; ++i)
        {
          total.state[i] += count.state[i];
        }
    }

  return total;
}

void TcellGroup::transferStateTo(TcellState::State state,
                                 const repast::Point<int> & loc,
                                 unsigned int count)
{
  CellGroup::transferStateTo(state, loc, count);
}

/*definition for function to find all neighbors that are Macrophages */
std::vector<const MacrophageGroup::StateCount * > TcellGroup::getMacrophageNeighbors(const repast::Point<int> & loc)
{
  std::vector<const MacrophageGroup::StateCount *> allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "MacrophageGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          MacrophageGroup * p_macrophageGroup =
              static_cast<MacrophageGroup *>(agents[i]);
          allNeighbors.push_back(p_macrophageGroup->getCellsAt(loc));
        }
    }

  return allNeighbors;
}
