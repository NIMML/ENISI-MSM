#include "Tcell.h"

/* "construct on first use" idiom */
/* http://www.parashift.com/c++-faq/static-init-order-on-first-use.html */
TcellODE& odeModel() {
  return TcellODE::getInstance();
}

Tcell::Color Tcell::getColor(){
  Color color;

  switch(_state){
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
  if (_state == AgentState::DEAD) return;

  /* get the grid location of this cell */
  repast::Point<int> pt = getGridLocation();

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

    //std::cout << "CD4<< T Cell at (" << pt.getX() << ", " << pt.getY() << ")" << "\n";
    //std::cout << "Inputs Cytokines:" << "\n";
    //std::cout << "IL12 : " << IL12 << "\n";
    //std::cout << "IL6 : " << IL6 << "\n";
    //std::cout << "TGFb : " << TGFb << "\n";
    //std::cout << "Outputs Cytokines:" << "\n";
    //std::cout << "IL17 : " << IL17 << "\n";
    //std::cout << "IFNg : " << IFNg << "\n";
    //std::cout << "IL10 : " << IL10 << "\n";

    /* get output cytokines */
    cytoMap["IFNg"]->set(IFNg, pt);
    cytoMap["IL17"]->set(IL17, pt);
    cytoMap["IL10"]->set(IL10, pt);

    if (IL17 > 0.5) {
      _state = AgentState::TH17;
    } else if (IFNg > 0.5) {
      _state = AgentState::TH1;
    } else if (IL10 > 0.5) {
      _state = AgentState::TREG;
    }
  }
  randomMove();
}
