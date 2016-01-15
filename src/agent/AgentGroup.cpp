#include "AgentGroup.h"

AgentGroup::AgentGroup(ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver> * p_layer)
 : MobileAgent(p_layer), _dimensions(p_layer->dimensions()) { }

void AgentGroup::transferStateTo(
    int state, const repast::Point<int> & loc, unsigned int count)
{
  for (unsigned int i = 0; i < count; ++i)
  {
    std::pair<int, int> pair(loc.getX(), loc.getY());
    markedForTransfer[state].push_back(pair);
  }
}

bool AgentGroup::isPointInBounds(const repast::Point<int> & pt)
{
  bool ret = false;

  repast::GridDimensions dims = getDimensions();
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

const repast::GridDimensions & AgentGroup::getDimensions() const
{ 
  return _dimensions;
}
