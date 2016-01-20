#ifndef ENISI_MSM_AGENT_DENDRITICS_H
#define ENISI_MSM_AGENT_DENDRITICS_H

#include "ImmuneCell.h"
#include "Bacteria.h"
#include "compartment/CellLayer.h"

class Dendritics: public ImmuneCell {
public:
  Dendritics(CellLayer * p_layer) 
    : ImmuneCell(p_layer) { setState(AgentState::IMMATURE); }

  Dendritics(CellLayer * p_layer, AgentState::State st) 
    : ImmuneCell(p_layer) { setState(st); }

  virtual void act();
  virtual Color getColor();
  virtual std::string classname() { return "Dendritics"; }
};

#endif
