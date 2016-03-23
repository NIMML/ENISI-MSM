#include "Compartment.h"
#include "compartment/CellLayer.h"
#include "compartment/DiffuserLayer.h"
#include "grid/Properties.h"

using namespace ENISI;

// static
const char* Compartment::Names[] = {"lumen", "epithilium", "lamina_propria", "gastric_lymph_node", NULL};

// static
Compartment* Compartment::INSTANCES[] = {NULL, NULL, NULL, NULL};

// static
Compartment* Compartment::instance(const Compartment::Type & type)
{
  Compartment *pInstance = INSTANCES[type];

  if (pInstance == NULL)
    {
      pInstance = new Compartment(type);
    }

  return pInstance;
}

Compartment::Compartment(const Type & type):
  _dimensions(NULL),
  _p_cellLayer(NULL),
  _diffuserLayers(),
  mType(type),
  mProperties(),
  mpLayer(NULL),
  mpBorders(NULL),
  mpLocalBorders(NULL)
{
  std::string Name = Names[mType];

  Properties::getValue(Name + ".space.x", mProperties.spaceX);
  Properties::getValue(Name + ".space.y", mProperties.spaceY);
  Properties::getValue(Name + ".grid.x", mProperties.gridX);
  Properties::getValue(Name + ".grid.y", mProperties.gridY);

  std::string borderLow = Properties::getValue(Name + ".border.y.low");
  mProperties.borderLowCompartment = Properties::toEnum(borderLow, Names, INVALID);
  mProperties.borderLowType = Properties::toEnum(borderLow, Borders::TypeNames, Borders::PERMIABLE);

  std::string borderHigh = Properties::getValue(Name + ".border.y.high");
  mProperties.borderHighCompartment = Properties::toEnum(borderHigh, Names, INVALID);
  mProperties.borderHighType = Properties::toEnum(borderHigh, Borders::TypeNames, Borders::PERMIABLE);

  std::vector< double > Origin(2, 0);
  std::vector< double > SpaceExtents(2);
  SpaceExtents[Borders::X] = mProperties.spaceX;
  SpaceExtents[Borders::Y] = mProperties.spaceY;
  std::vector< double > GridExtents(2);
  GridExtents[Borders::X] = mProperties.gridX;
  GridExtents[Borders::Y] = mProperties.gridY;
  repast::GridDimensions SpaceDimensions(Origin, SpaceExtents);
  repast::GridDimensions GridDimensions(Origin, GridExtents);

  mpLayer = new SharedLayer(Name, SpaceDimensions, GridDimensions);

  mpBorders = new Borders(SpaceDimensions);
  mpBorders->setLowBorderType(Borders::Y, mProperties.borderLowType);
  mpBorders->setHighBorderType(Borders::Y, mProperties.borderHighType);

  mpLocalBorders = new Borders(mpLayer->dimensions());
  mpLocalBorders->setLowBorderType(Borders::X, Borders::PERMIABLE);
  mpLocalBorders->setHighBorderType(Borders::X, Borders::PERMIABLE);
  mpLocalBorders->setLowBorderType(Borders::Y, Borders::PERMIABLE);
  mpLocalBorders->setHighBorderType(Borders::Y, Borders::PERMIABLE);
}

Compartment::Compartment(const repast::GridDimensions & dimensions,
                         const std::string ) :
  _dimensions(&dimensions),
  _p_cellLayer(new CellLayer(dimensions)),
  _diffuserLayers(),
  mType(),
  mProperties(),
  mpLayer(NULL),
  mpBorders(NULL),
  mpLocalBorders(NULL)
{}

Compartment::~Compartment()
{
  if (mpLayer != NULL) delete mpLayer;
  if (mpBorders != NULL) delete mpBorders;
  if (mpLocalBorders != NULL) delete mpBorders;

  while(!_diffuserLayers.empty()) 
    delete _diffuserLayers.back(), _diffuserLayers.pop_back();

  delete _p_cellLayer;
}

CellLayer * Compartment::cellLayer() { return _p_cellLayer; }

DiffuserLayer * Compartment::newDiffuserLayer()
{
  DiffuserLayer * p_layer = new DiffuserLayer(*_dimensions);
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

std::string Compartment::getName() const
{
  return Names[mType];
}
