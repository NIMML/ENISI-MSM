#include "Compartment.h"
#include "compartment/CellLayer.h"
#include "compartment/DiffuserLayer.h"

using namespace ENISI;

Compartment::Compartment(const repast::GridDimensions & dimensions,
                         const std::string name) :
  _dimensions(dimensions),
  _p_cellLayer(new CellLayer(_dimensions)),
  _diffuserLayers(),
  mName(name)
{}

Compartment::~Compartment()
{
  while(!_diffuserLayers.empty()) 
    delete _diffuserLayers.back(), _diffuserLayers.pop_back();

  delete _p_cellLayer;
}

CellLayer * Compartment::cellLayer() { return _p_cellLayer; }

DiffuserLayer * Compartment::newDiffuserLayer()
{
  DiffuserLayer * p_layer = new DiffuserLayer(_dimensions);
  _diffuserLayers.push_back(p_layer);
  return p_layer;
}

void Compartment::requestDiffuserAgents()
{
  for (size_t i = 0; i < _diffuserLayers.size(); ++i)
  {
    _diffuserLayers[i]->requestAgents();
  }
}

void Compartment::diffuse()
{
  for (size_t i = 0; i < _diffuserLayers.size(); i++)
  {
    _diffuserLayers[i]->diffuse();
  }
}

void Compartment::updateReferenceDiffuserGrid()
{
  for (size_t i = 0; i < _diffuserLayers.size(); i++)
  {
    _diffuserLayers[i]->updateReferenceDiffuserGrid();
  }
}

const std::string & Compartment::getName() const
{
  return mName;
}
