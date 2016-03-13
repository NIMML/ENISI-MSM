#include "Tcell.h"

/* "construct on first use" idiom */
/* http://www.parashift.com/c++-faq/static-init-order-on-first-use.html */
TcellODE& odeModel() {
  return TcellODE::getInstance();
}

Tcell::Color Tcell::getColor(){
  Color color;

  switch(getState()){
    case AgentState::NAIVE:
      color = pink;
      break;
    case AgentState::TH1:
      color = red;
      break;
    case AgentState::TH17:
      color = blue;
      break;
    case AgentState::TREG:
      color = green;
      break;
      //case AgentState::Tr:
      //color = cyan;
    case AgentState::DEAD:
      color = black;
      break;
    default:
      throw std::invalid_argument("invalid state when getting Tcell color");
  }

  return color;
}

void Tcell::act()
{
  if (getState() == AgentState::DEAD) return;

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
      setState(AgentState::TH17);
    } else if (IFNg > 0.5) {
      setState(AgentState::TH1);
    } else if (IL10 > 0.5) {
      setState(AgentState::TREG);
    }
  }
  randomMove();
}
