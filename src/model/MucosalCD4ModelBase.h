#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_BASE_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_BASE_H

#include "../ValueLayer.h" //patched DiscreteValueLayer
#include "../diffuser/Diffuser.h" 
#include "../agent/AgentFactory.h"
#include "../SiloWriter.h"

/* Repast libs */
#include "repast_hpc/Properties.h"
#include "repast_hpc/initialize_random.h"

class MucosalCD4ModelBase 
{
public:
  MucosalCD4ModelBase(repast::Properties * p, boost::mpi::communicator * comm) : 
    height(repast::strToInt(p->getProperty("grid.height"))), 
    width(repast::strToInt(p->getProperty("grid.width"))),
    _context(comm)
  { 
    const repast::Point<double> origin(0, 0);
    const repast::Point<double> extents(height, width);

    const std::string name = "compartment";
    const repast::GridDimensions dimensions(origin, extents);

    _p_compartment = new ENISI::Compartment(dimensions);
  }

  ~MucosalCD4ModelBase();

  typedef repast::StickyBorders Borders;
  typedef repast::SimpleAdder<ENISI::Agent> Adder;

  typedef ENISI::Agent::Context Context;
  typedef repast::SharedContinuousSpace<ENISI::Agent, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<ENISI::Agent, Borders, Adder> Grid;

  typedef repast::DiscreteValueLayer<double, Borders> ValueLayer;


protected:
  void createBacteria(int);
  void createTcells(int);
  void createDendritics(int);

  const int height;
  const int width;

  ValueLayer* vl;

  //TODO destructor method for cytokines
  std::map<std::string, ValueLayer*> cytokines; 
  std::map<std::string, int> cytokineMultipliers; 

  repast::Properties* props;

  repast::GridDimensions gridDimensions;

  std::vector<ENISI::Diffuser *> valueDiffusers;

  virtual void setUpCytokines();
  void setUpCytokineMultipliers();
  void diffuse();
  virtual void summation();
  void recordResults();

private:
  Context _context;
  ENISI::Compartment * _p_compartment;
};

#endif
