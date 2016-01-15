#include "DiffuserPackage.h"

/* Serializable Agent Package Data */

DiffuserPackage::DiffuserPackage(){ }

DiffuserPackage::DiffuserPackage(
    int _id, int _rank, int _type, int _currentRank,
    int _xOrigin, int _yOrigin, int _xExtent, int _yExtent,
    std::vector<double> _assignedGridValues
): id(_id), rank(_rank), type(_type), currentRank(_currentRank),
   xOrigin(_xOrigin), yOrigin(_yOrigin), xExtent(_xExtent), yExtent(_yExtent),
   assignedGridValues(_assignedGridValues)
{ }

DiffuserPackageProvider::DiffuserPackageProvider(repast::SharedContext<Diffuser>* p_agent)
  : _p_context(p_agent) { }

void DiffuserPackageProvider::providePackage(
    Diffuser * agent, std::vector<DiffuserPackage>& out)
{
  repast::AgentId id = agent->getId();

  repast::GridDimensions dimensions = agent->getDimensions();
  repast::Point<double> origin = dimensions.origin();
  repast::Point<double> extents = dimensions.extents();

  DiffuserPackage package(
    id.id(), id.startingRank(), id.agentType(), id.currentRank(),
    origin.getX(), origin.getY(), extents.getX(), extents.getY(),
    agent->getAssignedGridValues()
  );

  out.push_back(package);
}

void DiffuserPackageProvider::provideContent(
    repast::AgentRequest req, std::vector<DiffuserPackage>& out)
{
  std::vector<repast::AgentId> ids = req.requestedAgents();

  for(size_t i = 0; i < ids.size(); i++)
  {
    /* RepastProcess doesn't clear the AgentRequest when executing
     * requestAgents() multiple times. This leads to agent id "bleedover" from
     * other contexts, causing getAgent() to return null agents if not checked */
    if (_p_context->getAgent(ids[i]))
      providePackage(_p_context->getAgent(ids[i]), out);
  }
}


DiffuserPackageReceiver::DiffuserPackageReceiver(
    repast::SharedContext<Diffuser>* p_context): _p_context(p_context){}

Diffuser * 
DiffuserPackageReceiver::createAgent(DiffuserPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type, package.currentRank);

  repast::GridDimensions dimensions(
      repast::Point<double>(package.xOrigin, package.yOrigin), 
      repast::Point<double>(package.xExtent, package.yExtent)
  );

  DiffuserLayer layer(dimensions);
  Diffuser * agent = new Diffuser(&layer);

  agent->setId(id);

  return agent;
}

void DiffuserPackageReceiver::updateAgent(DiffuserPackage package)
{
  repast::AgentId id(package.id, package.rank, package.type);
  Diffuser * agent = _p_context->getAgent(id);
  agent->setId(id);

  std::vector<repast::Point<int> > coords = 
    agent->getGridCoordsAssignedToRank();
  agent->setGridPointsToCalculate(coords);
  agent->setValuesAtCoords(package.assignedGridValues, coords);
}

