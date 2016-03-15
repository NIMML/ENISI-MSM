#ifndef ENISI_MSM_AGENT_IMMUNE_CELL_H
#define ENISI_MSM_AGENT_IMMUNE_CELL_H

#include <string>
#include <map>
#include "compartment/CellLayer.h"
#include "../ValueLayer.h" // repast::ValueLayer

class CellLayer;

class ImmuneCell : public ENISI::Agent
{
public:
  typedef repast::DiscreteValueLayer<double, repast::StickyBorders> GridValueLayer;
  typedef std::map<std::string, GridValueLayer*> CytoMap;

  ImmuneCell(ENISI::CellLayer *);

  void addCytoLayer(std::string, GridValueLayer*);

  virtual Color getColor() =0;

  void move(double x, double y);
  double randomMove(double = 1);

  std::vector<double> getLocation();
  std::vector<ENISI::Agent *> getNeighbors(const std::string);

protected:
  CytoMap cytoMap;
private:
  ENISI::CellLayer * _p_layer;
};

#endif
