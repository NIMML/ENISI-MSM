#include "gmock/gmock.h"
#include "TcellODE.h"

TEST(ATcellODE, SetsInitialConcentrations)
{
  ENISI::TcellODE& odeModel = ENISI::TcellODE::getInstance();

  odeModel.setInitialConcentration("IL6", 70);
  odeModel.setInitialConcentration("TGFb", 70);
  odeModel.setInitialConcentration("IL12", 70);
}
