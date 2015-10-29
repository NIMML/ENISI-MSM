#ifndef ENISI_MSM_MUCOSAL_CD4_MODEL_BASE_H
#define ENISI_MSM_MUCOSAL_CD4_MODEL_BASE_H

#include "../ValueLayer.h" //patched DiscreteValueLayer
#include "../ValueLayerDiffuser.h" 
#include "../agent/AgentFactory.h"
#include "../SiloWriter.h"

/* Repast libs */
#include "Properties.h"
#include "initialize_random.h"

class MucosalCD4ModelBase 
{
public:
  MucosalCD4ModelBase(repast::Properties * p) : 
    height(repast::strToInt(p->getProperty("grid.height"))), 
    width(repast::strToInt(p->getProperty("grid.width")))
  { };

  ~MucosalCD4ModelBase();

  typedef repast::WrapAroundBorders Borders;
  typedef repast::SimpleAdder<ENISIAgent> Adder;

  typedef repast::SharedContext<ENISIAgent> Context;
  typedef repast::SharedContinuousSpace<ENISIAgent, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<ENISIAgent, Borders, Adder> Grid;

  typedef repast::DiscreteValueLayer<double, Borders> ValueLayer;
  typedef repast::ValueLayerDiffuser Diffuser;


protected:
  const int height;
  const int width;

  ValueLayer* vl;

  //TODO destructor method for cytokines
  std::map<std::string, ValueLayer*> cytokines; 
  std::map<std::string, int> cytokineMultipliers; 

  repast::Properties* props;

  repast::GridDimensions gridDimensions;

  std::vector<repast::ValueLayerDiffuser *> valueDiffusers;

  virtual void setUpCytokines();
  void setUpCytokineMultipliers();
  void diffuse();
  virtual void summation();
  void recordResults();
private:
};

#endif
