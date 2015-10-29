#ifndef ENISI_MSM_IMMUNE_CELL_H
#define ENISI_MSM_IMMUNE_CELL_H

#include <string>
#include <map>
#include "ENISIAgent.h"
#include "../ValueLayer.h" // repast::ValueLayer

class ImmuneCell: public ENISIAgent
{
  public:
  typedef repast::DiscreteValueLayer<double, Borders> GridValueLayer;
  typedef std::map<std::string, GridValueLayer*> CytoMap;

  ImmuneCell(repast::SharedContext<ENISIAgent>* ctx) : ENISIAgent(ctx) { }

  void addCytoLayer(std::string, GridValueLayer*);

  virtual Color getColor() =0;

  protected:
  CytoMap cytoMap;
};

#endif
