#include "../ValueLayer.h"
#include "InitSharedContextTestFixture.h"

class ATcell: public InitSharedContext 
{ 
public:
  Tcell * _p_tcell;
  void SetUp() {
    InitSharedContext::SetUp(); 

    _p_tcell = (Tcell *) _factory.create("Tcell", &_compartment);
  }
  void TearDown() { }
};

TEST_F(ATcell, HasDefaultStateNAIVE)
{
  ASSERT_THAT(_p_tcell->getState(), Eq(ENISI::AgentState::NAIVE));
}

TEST_F(ATcell, SuccessfullyAddsCytoLayer)
{
  std::string name = "ValueLayer";
  bool dense = true;
  repast::DiscreteValueLayer<double, repast::StickyBorders>
    valueLayer(name, _dimensions, dense);

  _p_tcell->addCytoLayer("test", &valueLayer);
}
