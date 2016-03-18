#include "TcellGroup.h"
#include "MacrophageGroup.h"
#include "DendriticsGroup.h"

using namespace ENISI;
int p_rule19;/*Rule 19 parameter*/
int p_rule20;/*Rule 20 parameter*/
int p_rule21;/*Rule 21 parameter*/
int p_rule22;/*Rule 22 parameter*/
int p_rule23;/*Rule 23 parameter*/
int p_rule31;/*Rule 31 parameter*/
int p_rule35;/*Rule 35 parameter*/
int p_rule36;/*Rule 36 parameter*/
int p_rule37;/*Rule 37 parameter*/
int p_rule39;/*Rule 39 parameter*/
int p_rule40;/*Rule 40 parameter*/
int p_rule41;/*Rule 41 parameter*/


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

  // Get Macrophage Neighbors
  const std::vector< const typename CoordinateMap<MacrophageState::KEEP_AT_END>::StateCount * > neighborList = getMacrophageNeighbors(loc);
  std::vector< const typename CoordinateMap<MacrophageState::KEEP_AT_END>::StateCount * >::const_iterator iter = neighborList.begin();

  //Get Tcell Neighbors for Rules 19-23 and 36-38
  const std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * > neighborListTcells = getTcellNeighbors(loc);
  std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >::const_iterator iter2 =  neighborListTcells.begin();

  // Get Dendritic cell Neighbors for Rule 39
  const std::vector< const typename CoordinateMap<DendriticState::KEEP_AT_END>::StateCount * > neighborListDC = getDendriticsNeighbors(loc);
  std::vector< const typename CoordinateMap<DendriticState::KEEP_AT_END>::StateCount * >::const_iterator iter3 = neighborListDC.begin();

  TcellState::State newState = state;
  double IL6 = Cytokines::instance().get("IL6", loc);
  double TGFb = Cytokines::instance().get("TGFb", loc);
  double IL12 = Cytokines::instance().get("IL12", loc);

  //Rules 19-23 and 36-38 for iter2 and neighborListTcells, and iter3 for DCs
  while (iter != neighborList.end()
         && iter2 != neighborListTcells.end()
         && iter3 != neighborListDC.end())
    {
      unsigned int macrophageregCount =
        (*iter)->state[MacrophageState::REGULATORY];
      //iter2 for counting TcellNeighbors - TH17,iTREG, TH1
      const TcellGroup::StateCount * p_tcellCount = *iter2;
      unsigned int th17Count = p_tcellCount->state[TcellState::TH17]; //Rules 22, 23, 36-39 when Th17 is in contact
      unsigned int itregCount = p_tcellCount->state[TcellState::iTREG]; //Rules 19-21 when iTreg is in contact
      unsigned int th1Count = p_tcellCount->state[TcellState::TH1];
      //iter 3 for counting Dendritic Cell Neighbbors - effector and TOLEROGENIC DC
      unsigned int eDCCount =
        (*iter3)->state[DendriticState::EFFECTOR]; //Rule 39 eDC count that is in contact with nT
      unsigned int tDCCount =
        (*iter3)->state[DendriticState::TOLEROGENIC]; //Rule 23 tDC count

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
              newState = TcellState::iTREG;
            }
          else if ((IL10 > 0.5 * IFNg) && (macrophageregCount > 0)
                   && state == TcellState::NAIVE
                   && mpCompartment->getName() == "LaminaPropria" && (p_rule31 > rand()%1+0))
            {
              newState = TcellState::Tr; /* Rule 31- The rule is if nT is in contact with regulatory macrophages, and if IL10> a* IFNg
           //then nT -> Tr (state transition). Here, 'a' is an arbitrary constant and has been hard coded to 0.5 */
            }
          else if ((th17Count > 0) && state == TcellState::TH17
                   && mpCompartment->getName() == "GLN" && (p_rule36 > rand()%1+0))
            {
              newState = TcellState::iTREG; /*Rule 36*/
            }
          else if ((itregCount > 0) && state == TcellState::TH17
                   && mpCompartment->getName() == "GLN" && (p_rule35 > rand()%1+0))
            {
              newState = TcellState::iTREG; /*Rule 35*/
            }
          else if ((th17Count > 0) && state == TcellState::iTREG
                   && mpCompartment->getName() == "GLN"&& (p_rule37 > rand()%1+0))
            {
              newState = TcellState::TH17; /*Rule 37*/
            }
          else if ((eDCCount > 0) && state == TcellState::NAIVE
                   && mpCompartment->getName() == "GLN"&& (p_rule39 > rand()%1+0))
            {
              newState = TcellState::TH1; /*Rule 39*/
            }
          else if ((eDCCount > 0) && state == TcellState::NAIVE
                   && mpCompartment->getName() == "GLN"&& (p_rule40 > rand()%1+0))
            {
        	  delCellAt(state, loc);/*Rule 40* - nT can die when in contact with eDC in GLN*/
        	  addCellAt(TcellState::DEAD, loc); /*Rule 40* - nT can 'proliferate' when in contact with nT in GLN */

            }
          else if ((itregCount > 0) && state == TcellState::iTREG
                   && mpCompartment->getName() == "LaminaPropria"&& (p_rule20 > rand()%1+0))
            {
              newState = TcellState::TH17; /*Rule 20*/
            }
          else if ((th17Count > 0) && state == TcellState::TH17
                   && mpCompartment->getName() == "LaminaPropria"&& (p_rule21 > rand()%1+0))
            {
              newState = TcellState::TH17; /*Rule 21*/
            }
          else if ((itregCount > 0) && state == TcellState::TH1
                   && mpCompartment->getName() == "LaminaPropria" && (p_rule22 > rand()%1+0))
            {
              newState = TcellState::iTREG; /*Rule 22*/
            }
          else if ((tDCCount > 0) && state == TcellState::TH17
                   && mpCompartment->getName() == "LaminaPropria"&& (p_rule23 > rand()%1+0))
            {
              newState = TcellState::iTREG; /*Rule 23*/
            }
          else if ((th1Count > 0) && state == TcellState::iTREG
                   && mpCompartment->getName() == "LaminaPropria"&& (p_rule19 > rand()%1+0))
            {
              newState = TcellState::TH17; /*Rule 19*/
            }
          else if ((eDCCount > 0) && state == TcellState::NAIVE
          				&& mpCompartment->getName() == "LaminaPropria" && (p_rule41 > rand()%1+0))
          	{
          	delCellAt(state, loc);/*Rule 41* - nT can die when in contact with eDC in Lamina Propria*/
          	addCellAt(TCellState::DEAD, loc); /*Rule 41* - nT can 'proliferate' when in contact with nT in Propria */
          	}
        }

      //Added conditions for Rules 18 - 23 and 36-41
      ++iter; //Macrophage Count
      ++iter2; //Tcellcount
      ++iter3; //Dendritic Cell count
    }

  if (newState == TcellState::TH1) //Rule 29 If T cell state is TH1, then release IFNg
    {
      ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
      cytoMap["IFNg"].first->setValueAtCoord(2, loc); // arbitrary value for IFNg
    }
  else if (newState == TcellState::Tr || TcellState::iTREG)   //Rule 30, If T cell state is Tr then release IL10 [or iTREG]
    {
      ENISI::Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
      cytoMap["IL10"].first->setValueAtCoord(3, loc); //arbitrary value for IL10
    }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(newState, newLoc);
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
std::vector< const typename CoordinateMap<MacrophageState::KEEP_AT_END>::StateCount * >
TcellGroup::getMacrophageNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<MacrophageState::KEEP_AT_END>::StateCount * > allNeighbors;

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

/*definition for function to find all neighbors that are Tcells (TH17 and iTREG */
std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >TcellGroup::getTcellNeighbors(const repast::Point<int> & loc)
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
/*definition for function to find all neighbors that are Dendritic cells */
std::vector< const typename CoordinateMap<DendriticState::KEEP_AT_END>::StateCount * >
TcellGroup::getDendriticsNeighbors(const repast::Point<int> & loc)
{
  std::vector< const typename CoordinateMap<DendriticState::KEEP_AT_END>::StateCount * > allNeighbors;

  std::vector<ENISI::Agent *> agents = layer()->selectAllAgents();

  for (size_t i = 0; i < agents.size(); ++i)
    {
      if (agents[i]->classname() == "DendriticsGroup")
        {
          /* TODO: Remove this cast when cellLayer is refactored to take CellGroup
           * agents only */
          DendriticsGroup * p_DendriticsGroup = static_cast<DendriticsGroup *>(agents[i]);
          allNeighbors.push_back(p_DendriticsGroup->getCellsAt(loc));
        }
    } //Rule for DendriticsGroup

  return allNeighbors;
}
