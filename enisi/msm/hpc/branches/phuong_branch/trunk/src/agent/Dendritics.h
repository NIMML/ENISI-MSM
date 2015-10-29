#ifndef ENISI_MSM_DENDRITICS_H
#define ENISI_MSM_DENDRITICS_H

#include "ImmuneCell.h"
#include "Bacteria.h"

class Dendritics: public ImmuneCell {
public:
  Dendritics(repast::SharedContext<ENISIAgent>* ctx) 
    : ImmuneCell(ctx) { setState(AgentState::IMMATURE); }
  Dendritics(repast::SharedContext<ENISIAgent>* ctx, AgentState::State st) 
    : ImmuneCell(ctx) { setState(st); }

  virtual void act();
  virtual Color getColor();
  virtual std::string classname() { return "Dendritics"; }
};

#endif
