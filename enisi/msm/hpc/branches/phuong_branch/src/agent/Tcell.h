#ifndef ENISI_MSM_TCELLS_H
#define ENISI_MSM_TCELLS_H

#include <string>
#include <map>
#include "ImmuneCell.h"
#include "TcellODE.h"

class Tcell: public ImmuneCell 
{
public:
  Tcell(repast::SharedContext<ENISIAgent>* ctx) 
    : ImmuneCell(ctx) { setState(AgentState::NAIVE); }
  Tcell(repast::SharedContext<ENISIAgent>* ctx, AgentState::State st) 
    : ImmuneCell(ctx) { setState(st); }

  virtual Color getColor();
  virtual std::string classname() { return "Tcell"; }

  virtual void act();
};

#endif
