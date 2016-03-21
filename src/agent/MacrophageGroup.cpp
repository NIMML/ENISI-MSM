#include "agent/MacrophageGroup.h"
#include "agent/HPyloriGroup.h"
#include "agent/Cytokines.h"
#include "agent/MacrophageODE1.h"
#include "agent/MacrophageODE2.h"

using namespace ENISI;

MacrophageGroup::MacrophageGroup(const boost::uintmax_t macrophageCount,
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

      double xCoord = repast::Random::instance()
                      ->createUniDoubleGenerator(xStart, xEnd).next();

      double yCoord = repast::Random::instance()
                      ->createUniDoubleGenerator(yStart, yEnd).next();

      repast::Point<int> initialLoc(xCoord, yCoord);

      std::vector<double> moveTo = randomMove(1, initialLoc);
      repast::Point<int> newLoc(moveTo[0], moveTo[1]);

      addCellAt(MacrophageState::MONOCYTE, newLoc);
    }
}

void MacrophageGroup::act()
{
  coordMapConstIter end = coordMapEnd();

  for (coordMapConstIter it = coordMapBegin(); it != end; it++)
    {
      repast::Point<int> loc = it->first;
      const StateCount count = it->second;

      for (unsigned int i = 0; i < MacrophageState::KEEP_AT_END; ++i)
        {
          for (unsigned int j = 0; j < count.state[i]; ++j)
            {
              MacrophageState::State state = static_cast<MacrophageState::State>(i);
              act(state, loc);
            }
        }
    }
}

void MacrophageGroup::act(
  MacrophageState::State state, const repast::Point<int> & loc __attribute__((unused)))
{
  if (state == MacrophageState::DEAD) return;

  const std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >
  neighborList = getHPyloriNeighbors(loc);

  std::vector< const typename CoordinateMap<HPyloriState::KEEP_AT_END>::StateCount * >::const_iterator iter
    = neighborList.begin();

  MacrophageState::State newState = state;
  /* //If monocytes + hp //then new state -> m_reg
  if (state == MacrophageState::MONOCYTE)
  {
    if (hPyloriCount || tolBCount) {newState = MacrophageState::REGULATORY;}
  }
  */
  //If monocytes + TolB
  //then new state -> m_reg-

  while (iter != neighborList.end())
    {
      const HPyloriGroup::StateCount * p_hpyloriStateCount = *iter;

      /*identify states of HPylori counted -- naive name should be changed to LIVE*/
      unsigned int liveHPyloriCount
        = p_hpyloriStateCount->state[HPyloriState::NAIVE];

      /*get concentration of IFNg and IL10 for COPASI input*/
      double IFNg = Cytokines::instance().get("IFNg", loc);
      double IL10 = Cytokines::instance().get("IL10", loc);

      /* if no bacteria is around DC, then stays immature */
      if (liveHPyloriCount && state == MacrophageState::MONOCYTE)
        {
          /* set initial concentrations */
          MacrophageODE1 & odeModel = MacrophageODE1::getInstance();
          odeModel.setInitialConcentration("IFNg", IFNg);
          odeModel.setInitialConcentration("IL10", IL10);

          /* run time course */
          odeModel.runTimeCourse();

          // double IFNg = odeModel.getConcentration("IFNg");
          // double IL10 = odeModel.getConcentration("IL10");
          double Mreg = odeModel.getConcentration("Mreg");
          double Minf = odeModel.getConcentration("Minf");

          /* regulatory macrophages differentiate if ODE predicts regulatory differentiation */
          if (Mreg >= Minf)
            {
              newState = MacrophageState::REGULATORY;
            }

          /* inflammatory macrophages differentiate if ODE predicts inflammatory differentiation */
          if (Minf > Mreg)
            {
              newState = MacrophageState::INFLAMMATORY;
            }
        }

      /* regulatory macrophages produce IL10 */
      if (newState == MacrophageState::REGULATORY)
        {
          ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["IL10"].first->setValueAtCoord(70, loc);
        }
      /* inflammatory macrophages produce IFNg */
      else if (newState == MacrophageState::INFLAMMATORY)
        {
          ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
          cytoMap["IFNg"].first->setValueAtCoord(70, loc);
        }

      ++iter;
    }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);

  /* TO DO: increase rate if counts of eDC and E_dam are high */
  addCellAt(newState, newLoc);
}

std::vector< const typename CoordinateMap< HPyloriState::KEEP_AT_END >::StateCount * > MacrophageGroup::getHPyloriNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap< HPyloriState::KEEP_AT_END >::StateCount * > allNeighbors;

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
