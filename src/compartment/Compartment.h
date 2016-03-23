#ifndef ENISI_MSM_COMPARTMENT_H
#define ENISI_MSM_COMPARTMENT_H

#include "ICompartmentLayer.h"
#include "agent/AgentGroupPackage.h"

namespace ENISI {

class CellLayer;
class DiffuserLayer;

class Compartment
{
private:
  static Compartment* INSTANCES[];

  typedef ICompartmentLayer< Agent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver > SharedLayer;

public:
  static const char* Names[];
  enum Type{lumen, epithilium, lamina_propria, gastric_lymph_node, INVALID = -1};

  struct sProperties
  {
    double spaceX;
    double spaceY;
    double gridX;
    double gridY;
    Type borderLowCompartment;
    Borders::Type borderLowType;
    Type borderHighCompartment;
    Borders::Type borderHighType;
  };

  static Compartment* instance(const Type & type);

  Compartment(const Type & type);

  Compartment(const repast::GridDimensions &,
              const std::string name = "Default");

  ~Compartment();

  CellLayer * cellLayer();

  DiffuserLayer * newDiffuserLayer();

  void requestDiffuserAgents();
  void diffuse();
  void updateReferenceDiffuserGrid();
  std::string getName() const;

private:

  const repast::GridDimensions * _dimensions;
  CellLayer * _p_cellLayer;
  std::vector<DiffuserLayer *> _diffuserLayers;

  Type mType;
  sProperties mProperties;
  SharedLayer * mpLayer;
  Borders * mpBorders;
  Borders * mpLocalBorders;

}; /* end Compartment */

}
#endif
