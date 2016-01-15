#ifndef ENISI_MSM_AGENT_IMMUNE_CELL_H
#define ENISI_MSM_AGENT_IMMUNE_CELL_H

#include <string>
#include <map>
#include "MobileAgent.h"
#include "../ValueLayer.h" // repast::ValueLayer

class ImmuneCell: public MobileAgent<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver>
{
  public:
  typedef repast::DiscreteValueLayer<double, repast::StickyBorders> GridValueLayer;
  typedef std::map<std::string, GridValueLayer*> CytoMap;

  ImmuneCell(ICompartmentLayer<ENISIAgent, AgentGroupPackage, AgentGroupPackageProvider, AgentGroupPackageReceiver> * p_layer) : MobileAgent(p_layer) { }

  void addCytoLayer(std::string, GridValueLayer*);

  virtual Color getColor() =0;

  protected:
  CytoMap cytoMap;
};

#endif
