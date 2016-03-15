#ifndef ENISI_MSM_AGENT_TCELLS_H
#define ENISI_MSM_AGENT_TCELLS_H

#include <string>
#include <map>
#include "ImmuneCell.h"
#include "TcellODE.h"
#include "compartment/CellLayer.h"

class Tcell: public ImmuneCell 
{
public:
  Tcell(ENISI::CellLayer * p_layer)
    : ImmuneCell(p_layer) { setState(ENISI::AgentState::NAIVE); }

  Tcell(ENISI::CellLayer * p_layer, ENISI::AgentState::State st)
    : ImmuneCell(p_layer) { setState(st); }

  virtual Color getColor();
  virtual std::string classname() { return "Tcell"; }

  virtual void act();
};

#endif
