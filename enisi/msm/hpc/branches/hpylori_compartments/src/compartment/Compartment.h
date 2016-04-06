#ifndef ENISI_MSM_COMPARTMENT_H
#define ENISI_MSM_COMPARTMENT_H

#include "agent/ENISIAgent.h"
#include "agent/AgentPackage.h"
#include "repast_hpc/matrix.h"
#include "grid/Iterator.h"

namespace ENISI {

class DiffuserLayer;
class Cytokine;
class SharedValueLayer;

template <class T, class Package, class PackageExchange> class ICompartmentLayer;

class Compartment
{
private:
  static Compartment* INSTANCES[];

  typedef ICompartmentLayer< Agent, AgentPackage, AgentPackageExchange > SharedLayer;

public:
  static const char* Names[];
  enum Type{lumen, epithilium, lamina_propria, gastric_lymph_node, INVALID = -1};

  struct sProperties
  {
    double spaceX;
    double spaceY;
    double gridSize;
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
  Iterator begin();

  repast::Point< double > gridToSpace(const repast::Point< int > & grid) const;
  repast::Point<int> spaceToGrid(const repast::Point<double> & space) const;

  void getLocation(const repast::AgentId & id, std::vector<double> & Location) const;
  bool moveTo(const repast::AgentId &id, repast::Point< double > &pt);
  bool moveTo(const repast::AgentId &id, std::vector< double > &newLocation);
  bool moveRandom(const repast::AgentId &id, const double & maxSpeed);
  bool addAgent(Agent * agent, const std::vector< double > & pt);
  bool addAgentToRandomLocation(Agent * agent);
  void removeAgent (Agent * pAgent);

  void getNeighbors(const repast::Point< int > &pt, unsigned int range, std::vector< Agent * > &out);
  void getNeighbors(const repast::Point< int > &pt, unsigned int range, const int & types, std::vector< Agent * > &out);
  void getAgents(const repast::Point< int > &pt, std::vector< Agent * > &out);
  void getAgents(const repast::Point< int > &pt, const int & types, std::vector< Agent * > &out);
  void getAgents(const repast::Point< int > &pt, const int & xOffset, const int & yOffset, std::vector< Agent * > &out);
  void getAgents(const repast::Point< int > &pt, const int & xOffset, const int & yOffset, const int & types, std::vector< Agent * > &out);

  size_t addCytokine(const std::string & name);
  const std::vector< Cytokine * > & getCytokines() const;
  const Cytokine * getCytokine(const std::string & name) const;
  double & cytokineValue(const std::string & name, const repast::Point< int > & location);

  void initializeDiffuserData();
  std::vector< double > & operator[](const repast::Point< int > & location);
  const std::vector< double > & operator[](const repast::Point< int > & location) const;
  const std::vector< double > & operator[](const repast::Point< double > & location) const;

  void synchronizeCells();
  void synchronizeDiffuser();

  const Type & getType() const;

  size_t localCount(const size_t & globalCount);
  size_t getRank(const repast::Point< double > & location) const;
  size_t getRank(const repast::Point< int > & location) const;
  void getBorderAgentsToPush(std::map< int, std::set< repast::AgentId > > & agentsToPush);

private:
  void getBorderAgentsToPush(const Borders::Coodinate &coordinate,
                             const Borders::Side & side,
                             std::map< int, std::set< repast::AgentId > > & agentsToPush);

  Compartment * transform(std::vector< double > & pt) const;
  Compartment * transform(std::vector< int > & pt) const;


  std::string getName() const;

  Type mType;

  sProperties mProperties;
  repast::GridDimensions mDimensions;
  SharedLayer * mpLayer;
  Borders * mpSpaceBorders;
  Borders * mpGridBorders;

  std::vector< std::vector< Type > > mAdjacentCompartments;
  repast::DoubleUniformGenerator mUniform;

  std::map< std::string, size_t > mCytokineMap;
  std::vector< Cytokine * > mCytokines;

  SharedValueLayer * mpDiffuserValues;

}; /* end Compartment */

}
#endif
