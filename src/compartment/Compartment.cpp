#include "Compartment.h"

namespace ENISI {

Compartment::Compartment(
    const repast::GridDimensions & dimensions)
  : _dimensions(dimensions)
    ,_p_cellLayer(new CellLayer(_dimensions))
{ }

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

void Compartment::requestAgents()
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

}
