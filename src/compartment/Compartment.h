#ifndef ENISI_MSM_COMPARTMENT_H
#define ENISI_MSM_COMPARTMENT_H

#include "ICompartmentLayer.h"
#include "agent/ENISIAgent.h"
#include "agent/AgentPackage.h"
#include "repast_hpc/matrix.h"

namespace ENISI {

class DiffuserLayer;
class Cytokine;
class SharedValueLayer;

class Compartment
{
public:
  class GridIterator
  {
  private:
    GridIterator();
  public:
    GridIterator(const repast::GridDimensions & dimensions);
    GridIterator(const repast::Point< int > & origin, repast::Point< int > & extents);
    ~GridIterator();
    bool next(const size_t coodinate = 0);
    const repast::Point< int > & operator *();
    const repast::Point< int > * operator ->();
    operator bool();

  private:
    repast::Point< int > mOrigin;
    repast::Point< int > mExtents;
    repast::Point< int > mCurrent;
  };
private:
  static Compartment* INSTANCES[];

  typedef ICompartmentLayer< Agent, AgentPackage, AgentPackageProvider, AgentPackageReceiver > SharedLayer;

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
  const repast::GridDimensions & localSpaceDimensions() const;
  const repast::GridDimensions & localGridDimensions() const;
  const Borders * spaceBorders() const;
  const Borders * gridBorders() const;
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

  size_t addCytokine(const std::string & name);
  const std::vector< Cytokine * > & getCytokines() const;
  const Cytokine * getCytokine(const std::string & name) const;
  double & cytokineValue(const std::string & name, const repast::Point< int > & location);

  void initializeDiffuserData();
  std::vector< double > & operator[](const repast::Point< int > & location);
  const std::vector< double > & operator[](const repast::Point< int > & location) const;
  const std::vector< double > & operator[](const repast::Point< double > & location) const;

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
  Borders * mpSpaceBorders;
  Borders * mpGridBorders;
  // Borders * mpLocalBorders;
  std::vector< std::vector< Type > > mAdjacentCompartments;
  repast::DoubleUniformGenerator mUniform;

  std::map< std::string, size_t > mCytokineMap;
  std::vector< Cytokine * > mCytokines;

  SharedValueLayer * mpDiffuserValues;
}; /* end Compartment */

}
#endif
