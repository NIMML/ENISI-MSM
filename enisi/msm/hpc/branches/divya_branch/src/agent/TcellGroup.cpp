#include "TcellGroup.h"

TcellGroup::TcellGroup(
    const unsigned int & tcellCount, repast::SharedContext<ENISIAgent> * ctx)
  : ENISIAgent(ctx)
{
  init(tcellCount, ctx);
}

void TcellGroup::init(
    const unsigned int & tCellCount, repast::SharedContext<ENISIAgent> * ctx)
{
  for (unsigned int i = 0; i < tCellCount; i++) 
  {
    ENISIAgent::Space * space = static_cast<Space*>(ctx->getProjection("space"));

    repast::Point<double> extents = space->dimensions().extents();
    repast::Point<double> origin = space->dimensions().origin();

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

    coordMap[newLoc].state[NAIVE]++;
  }

  TcellGroup::instances().push_back(this);
}

void TcellGroup::act()
{
  typedef CoordMap::iterator it_type;

  for(it_type it = coordMap.begin(); it != coordMap.end(); it++) 
  {
    repast::Point<int> loc = it->first;
    StateCount stateCount  = it->second;

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

    /* get output cytokines */
    Cytokines::CytoMap & cytoMap = Cytokines::instance().map();
    cytoMap["IFNg"]->set(IFNg, loc);
    cytoMap["IL17"]->set(IL17, loc);
    cytoMap["IL10"]->set(IL10, loc);

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

  coordMap[loc].state[state]--;
  coordMap[newLoc].state[newState]++;
}

int TcellGroup::count()
{
  int count = 0;

  typedef CoordMap::const_iterator it_type;

  for(it_type it = coordMap.begin(); it != coordMap.end(); it++) 
  {
    StateCount stateCount  = it->second;

    for (unsigned int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      count += stateCount.state[i];
    }
  }

  return count;
}

TcellGroup::StateCount TcellGroup::countByState()
{
  StateCount total;

  typedef CoordMap::const_iterator it_type;

  for(it_type it = coordMap.begin(); it != coordMap.end(); it++) 
  {
    StateCount stateCount  = it->second;
    for (unsigned int i = 0; i < LAST_STATE_DO_NOT_MOVE; ++i)
    {
      total.state[i] += stateCount.state[i];
    }
  }

  return total;
}

void TcellGroup::addStateAt(State state, const repast::Point<int> & loc)
{
  coordMap[loc].state[state]++;
}

void TcellGroup::transferStateTo(
    State state, const repast::Point<int> & loc, unsigned int count)
{
  for (unsigned int i = 0; i < count; ++i)
  {
    std::pair<int, int> pair(loc.getX(), loc.getY());
    markedForTransfer[state].push_back(pair);
  }
}

std::vector<double> TcellGroup::randomMove(
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

bool TcellGroup::isPointInBounds(const repast::Point<int> & pt)
{
  bool ret = false;

  repast::GridDimensions dims = grid->dimensions();
  double totalWidth = dims.extents().getX();
  int worldSize = repast::RepastProcess::instance()->worldSize();
  double inBoundWidth = totalWidth / worldSize; 

  double oriX = dims.origin().getX();
  int rank = repast::RepastProcess::instance()->rank();
  double xBoundEnd = oriX + (inBoundWidth * (rank + 1)); 
  double xBoundStart = xBoundEnd - inBoundWidth; 

  double ptX = pt.getX();
  if ( (ptX >= xBoundStart) && (ptX <= xBoundEnd) ) ret = true;

  return ret;
}
