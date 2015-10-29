#include "TestFixture.h"
#include "TestBenchmark.h"
#include "TestSiloWriter.h"
#include "TestDiscreteValueLayer.h"
#include "TestValueLayerDiffuser.h"
#include "TestBacteria.h"
#include "TestImmuneCell.h"
#include "TestTcell.h"
#include "TestTcellODE.h"
#include "TestENISIAgent.h"
#include "TestDendritics.h"
#include "TestModelBuilder.h"

int main(int argc, char** argv) 
{
  TestBenchmark();
  TestFixture(argc, argv);

  TestSiloWriter();

  TestDiscreteValueLayer();
  TestValueLayerDiffuser();

  TestTcellODE();

  TestENISIAgent();
  TestBacteria();
  TestImmuneCell();
  TestTcell();
  TestDendritics();

  TestModelBuilder();

  return 0;
}
