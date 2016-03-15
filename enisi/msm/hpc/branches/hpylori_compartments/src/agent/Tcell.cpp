#include "Tcell.h"

/* "construct on first use" idiom */
/* http://www.parashift.com/c++-faq/static-init-order-on-first-use.html */
TcellODE& odeModel() {
  return TcellODE::getInstance();
}

Tcell::Color Tcell::getColor(){
  Color color;

  switch(getState()){
    case ENISI::AgentState::NAIVE:
      color = pink;
      break;
    case ENISI::AgentState::TH1:
      color = red;
      break;
    case ENISI::AgentState::TH17:
      color = blue;
      break;
    case ENISI::AgentState::TREG:
      color = green;
      break;
    case ENISI::AgentState::DEAD:
      color = black;
      break;
    default:
      throw std::invalid_argument("invalid state when getting Tcell color");
  }

  return color;
}

void Tcell::act()
{
  if (getState() == ENISI::AgentState::DEAD) return;

  /* get the grid location of this cell */
  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);

  double IL6 = cytoMap["IL6"]->get(pt);
  double TGFb = cytoMap["TGFb"]->get(pt);
  double IL12 = cytoMap["IL12"]->get(pt);

  if (IL6 + TGFb + IL12 > 1.0) 
  {
    /* set initial concentrations */
    odeModel().setInitialConcentration("IL6", IL6);
    odeModel().setInitialConcentration("TGFb", TGFb);
    odeModel().setInitialConcentration("IL12", IL12);
    
    /* run time course */
    odeModel().runTimeCourse();
    
    double IFNg = odeModel().getConcentration("IFNg");
    double IL17 = odeModel().getConcentration("IL17");
    double IL10 = odeModel().getConcentration("IL10");

    /* get output cytokines */
    cytoMap["IFNg"]->set(IFNg, pt);
    cytoMap["IL17"]->set(IL17, pt);
    cytoMap["IL10"]->set(IL10, pt);

    if (IL17 > 0.5) {
      setState(ENISI::AgentState::TH17);
    } else if (IFNg > 0.5) {
      setState(ENISI::AgentState::TH1);
    } else if (IL10 > 0.5) {
      setState(ENISI::AgentState::TREG);
    }
  }
  randomMove();
}
