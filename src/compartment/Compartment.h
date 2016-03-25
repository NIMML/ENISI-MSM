#ifndef ENISI_MSM_COMPARTMENT_H
#define ENISI_MSM_COMPARTMENT_H

#include "ICompartmentLayer.h"
#include "agent/ENISIAgent.h"
#include "agent/AgentGroupPackage.h"
#include "repast_hpc/matrix.h"

namespace ENISI {

class DiffuserLayer;

class Compartment
{
public:
  class GridIterator
  {
  private:
    GridIterator();
  public:
    GridIterator(const repast::GridDimensions & dimensions);
    ~GridIterator();
    bool next();
    const repast::Point< int > & operator *();
    const repast::Point< int > & operator ->();
    operator bool();

  private:
    repast::GridDimensions mDimensions;
    repast::Point< int > mCurrent;
  };
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

  ~Compartment();

  const repast::GridDimensions & dimensions() const;
  const repast::GridDimensions & localDimensions() const;
  const Borders * borders() const;
  const Compartment * getAdjacentCompartment(const Borders::Coodinate &coordinate, const Borders::Side & side) const;
  GridIterator begin();

  void getLocation(const repast::AgentId & id, std::vector<double> & Location) const;
  bool moveTo(const repast::AgentId &id, const repast::Point< double > &pt);
  bool moveTo(const repast::AgentId &id, const std::vector< double > &newLocation);
  bool moveRandom(const repast::AgentId &id, const double & maxSpeed);
  bool addAgent(Agent * agent, const std::vector< double > & pt);
  bool addAgentToRandomLocation(Agent * agent);
  void removeAgent (Agent * pAgent);

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, std::vector< Agent * > &out);
  void getNeighbors(const repast::Point< int > &pt, unsigned int range, const int & types, std::vector< Agent * > &out);
  void getAgents(const repast::Point< int > &pt, std::vector< Agent * > &out);
  void getAgents(const repast::Point< int > &pt, const int & types, std::vector< Agent * > &out);

  DiffuserLayer * newDiffuserLayer();

  void requestDiffuserAgents();
  void diffuse();
  void updateReferenceDiffuserGrid();
  const Type & getType() const;
private:

  std::string getName() const;

  std::vector<DiffuserLayer *> _diffuserLayers;

  Type mType;
  sProperties mProperties;
  repast::GridDimensions mDimensions;
  SharedLayer * mpLayer;
  Borders * mpBorders;
  // Borders * mpLocalBorders;
  std::vector< std::vector< Type > > mAdjacentCompartments;
  repast::DoubleUniformGenerator mUniform;

}; /* end Compartment */

}
#endif
