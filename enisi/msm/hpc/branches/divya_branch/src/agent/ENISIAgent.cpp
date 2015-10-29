#include "ENISIAgent.h"

int ENISIAgent::agentCount = 0;

ENISIAgent::ENISIAgent(repast::SharedContext<ENISIAgent>* ctx) 
  : context(ctx)
{ 
  space = static_cast<Space*>(context->getProjection("space"));
  grid = static_cast<Grid*>(context->getProjection("grid"));

  if (space == 0) 
    throw std::invalid_argument("space projection does not exist in context");
  if (grid == 0) 
    throw std::invalid_argument("grid projection does not exist in context");

  int rank = repast::RepastProcess::instance()->rank();

  id = repast::AgentId(agentCount++, rank, 0);
  id.currentRank(rank);

  /* Agent must be added to context before it can be moved in space/grid */
  context->addAgent(this);

  repast::Point<double> extents = space->dimensions().extents();
  repast::Point<double> origin = space->dimensions().origin();

  double xStart = origin.getX();
  double yStart = origin.getY();

  double xEnd = origin.getX() + extents.getX();
  double yEnd = origin.getY() + extents.getY();

  xCoord = repast::Random::instance()
    ->createUniDoubleGenerator(xStart, xEnd).next();

  yCoord = repast::Random::instance()
    ->createUniDoubleGenerator(yStart, yEnd).next();

  randomMove();
}

double ENISIAgent::randomMove(double speed) 
{
  double fullCircle = 2 * 3.14; // in radians
  double angle = 
    repast::Random::instance()->createUniDoubleGenerator(0, fullCircle).next();
  double radius = 
    repast::Random::instance()->createUniDoubleGenerator(0, speed).next();

  double x = xCoord + radius * cos(angle);
  double y = yCoord + radius * sin(angle);

  moveTo(x, y);

  return radius;
}

void ENISIAgent::moveTo(double x, double y)
{
  space->moveTo(id, repast::Point<double>(x, y));
  grid->moveTo(id, repast::Point<int>(x, y));

  xCoord = x;
  yCoord = y;
}

repast::Point<int> ENISIAgent::getGridLocation() const {
  std::vector<int> locationVector;
  grid->getLocation(id, locationVector);
  return repast::Point<int>(locationVector);
}
