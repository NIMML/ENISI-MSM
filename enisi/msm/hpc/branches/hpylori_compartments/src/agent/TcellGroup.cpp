#include "TcellGroup.h"

TcellGroup::TcellGroup(
    const boost::uintmax_t tcellCount, CellLayer * p_layer)
  : CellGroup(p_layer)
{
  init(tcellCount);
}

void TcellGroup::init(const boost::uintmax_t tCellCount)
{
  for (boost::uintmax_t i = 0; i < tCellCount; i++) 
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

    addCellAt(NAIVE, newLoc);
  }

  TcellGroup::instances().push_back(this);
}

void TcellGroup::act()
{
  typedef CoordMap::const_iterator it_type;
  it_type end = coordMapEnd();

  for(it_type it = coordMapBegin(); it != end; it++) 
  {
    repast::Point<int> loc = it->first;
    const StateCount count = it->second;

    for (unsigned int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      State state = static_cast<State>(i);
      for (unsigned int j = 0; j < count.state[i]; ++j)
      {
	act(state, loc);
      }
    }
  }
}

void TcellGroup::act(State state, const repast::Point<int> & loc)
{
  if (state == DEAD) return;

  double IL6  = Cytokines::instance().get("IL6", loc);
  double TGFb = Cytokines::instance().get("TGFb", loc);
  double IL12 = Cytokines::instance().get("IL12", loc);

  State newState = state;

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

/*    std::cout << "CD4+ T Cell at (" << loc.getX() << ", " << loc.getY() << ")\n";*/
    //std::cout << "Inputs Cytokines:\n";
    //std::cout << "IL12 : " << IL12 << "\n";
    //std::cout << "IL6 : " << IL6 << "\n";
    //std::cout << "TGFb : " << TGFb << "\n";
    //std::cout << "Outputs Cytokines:\n";
    //std::cout << "IFNg : " << IFNg << "\n";
    //std::cout << "IL17 : " << IL17 << "\n";
    /*std::cout << "IL10 : " << IL10 << "\n";*/

    /* get output cytokines */
    Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    cytoMap["IFNg"]->setValueAtCoord(IFNg, loc);
    cytoMap["IL17"]->setValueAtCoord(IL17, loc);
    cytoMap["IL10"]->setValueAtCoord(IL10, loc);

    if (IL17 > 0.5) {
      newState = TH17;
    } else if (IFNg > 0.5) {
      newState = TH1;
    } else if (IL10 > 0.5) {
      newState = TREG;
    }
  }

  std::vector<double> moveTo = randomMove(1, loc);
  repast::Point<int> newLoc(moveTo[0], moveTo[1]);

  delCellAt(state, loc);
  addCellAt(newState, newLoc);
}

int TcellGroup::count()
{
  int total = 0;

  typedef CoordMap::const_iterator it_type;
  it_type end = coordMapEnd();

  for(it_type it = coordMapBegin(); it != end; it++) 
  {
    const StateCount count  = it->second;

    for (unsigned int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      total += count.state[i];
    }
  }

  return total;
}

TcellGroup::StateCount TcellGroup::countByState()
{
  StateCount total;

  typedef CoordMap::const_iterator it_type;
  it_type end = coordMapEnd();

  for(it_type it = coordMapBegin(); it != end; it++) 
  {
    const StateCount count  = it->second;
    for (int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      total.state[i] += count.state[i];
    }
  }

  return total;
}

void TcellGroup::transferStateTo(
    State state, const repast::Point<int> & loc, unsigned int count)
{
  CellGroup::transferStateTo(state, loc, count);
}
