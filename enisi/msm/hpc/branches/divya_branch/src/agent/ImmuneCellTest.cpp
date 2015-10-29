#include "../InitSharedContextTestFixture.h"
#include "ImmuneCell.h"
#include "../ValueLayer.h"

class MockImmuneCell: public ImmuneCell
{		  
  public:
  MockImmuneCell(repast::SharedContext<ENISIAgent>* ctx) 
    : ImmuneCell(ctx) { }
  virtual Color getColor() { return black; }
  virtual std::string classname() { return "MockImmuneCell"; }
  CytoMap getCytoMap() const { return cytoMap; }
};

class AnImmuneCell: public InitSharedContext 
{ 
public:
  MockImmuneCell * pImmuneCell1;
  MockImmuneCell * pImmuneCell2;

  typedef repast::DiscreteValueLayer<double, repast::WrapAroundBorders> ValueLayer;
  ValueLayer * pValueLayer;

  void SetUp() 
  {
    InitSharedContext::SetUp(); 

    pImmuneCell1 = new MockImmuneCell(global_context);
    pImmuneCell2 = new MockImmuneCell(global_context);

    addValueLayer();
  }
  void TearDown() {
    delete pValueLayer;
    delete pImmuneCell2;
    delete pImmuneCell1;
  }	
private:
  void addValueLayer();
};

repast::Point<int> pt(5, 5); 

void AnImmuneCell::addValueLayer()
{
  std::string name = "ValueLayer";
  bool isDense = true;
  pValueLayer = new ValueLayer(name, global_gridDims, isDense);

  pValueLayer->set(70, pt);
  pImmuneCell1->addCytoLayer("test", pValueLayer);
  pImmuneCell2->addCytoLayer("test", pValueLayer);
}

TEST_F(AnImmuneCell, RetrievesValueLayer)
{
  ASSERT_THAT(pImmuneCell1->getCytoMap()["test"]->get(pt), Eq(70));
  ASSERT_THAT(pImmuneCell2->getCytoMap()["test"]->get(pt), Eq(70));
}

TEST_F(AnImmuneCell, ChangesToValueLayerAffectAllSharedObjects)
{
  pValueLayer->set(41, pt);

  ASSERT_THAT(pImmuneCell1->getCytoMap()["test"]->get(pt), Eq(41));
  ASSERT_THAT(pImmuneCell2->getCytoMap()["test"]->get(pt), Eq(41));
}
