#include "../InitSharedContextTestFixture.h"
#include "Tcell.h"

class ATcell: public InitSharedContext 
{ 
public:
  Tcell * tCell;
  void SetUp() {
    InitSharedContext::SetUp(); 
    tCell = new Tcell(global_context);
  }
  void TearDown() {
    delete tCell;
  }
};

TEST_F(ATcell, HasDefaultStateNAIVE)
{
  ASSERT_THAT(tCell->getState(), Eq(AgentState::NAIVE));
}

TEST_F(ATcell, SuccessfullyAddsCytoLayer)
{
  std::string name = "ValueLayer";
  bool dense = true;
  repast::DiscreteValueLayer<double, repast::WrapAroundBorders>
    valueLayer(name, global_gridDims, dense);

  tCell->addCytoLayer("test", &valueLayer);
}
