#include "../ValueLayer.h"
#include "InitSharedContextTestFixture.h"
#include "ImmuneCell.h"

class MockImmuneCell: public ImmuneCell
{
public:
  MockImmuneCell(ENISI::CellLayer * p_layer)
    : ImmuneCell(p_layer) {}

  virtual Color getColor() {return black;}
  virtual void act() {}
  virtual std::string classname() {return "MockImmuneCell";}
  CytoMap getCytoMap() const {return cytoMap;}
};

class AnImmuneCell: public InitSharedContext
{
public:
  MockImmuneCell * _p_immuneCell1;
  MockImmuneCell * _p_immuneCell2;

  typedef repast::DiscreteValueLayer<double, repast::StickyBorders> ValueLayer;
  ValueLayer * pValueLayer;

  void SetUp()
  {
    InitSharedContext::SetUp();

    _p_immuneCell1 = new MockImmuneCell(_compartment.cellLayer());
    _p_immuneCell2 = new MockImmuneCell(_compartment.cellLayer());

    addValueLayer();
  }
  void TearDown()
  {
    delete pValueLayer;
    delete _p_immuneCell2;
    delete _p_immuneCell1;
  }
private:
  void addValueLayer();
};

repast::Point<int> pt(5, 5);

void AnImmuneCell::addValueLayer()
{
  std::string name = "ValueLayer";
  bool isDense = true;
  pValueLayer = new ValueLayer(name, _dimensions, isDense);

  pValueLayer->set(70, pt);
  _p_immuneCell1->addCytoLayer("test", pValueLayer);
  _p_immuneCell2->addCytoLayer("test", pValueLayer);
}

TEST_F(AnImmuneCell, RetrievesValueLayer)
{
  ASSERT_THAT(_p_immuneCell1->getCytoMap()["test"]->get(pt), Eq(70));
  ASSERT_THAT(_p_immuneCell2->getCytoMap()["test"]->get(pt), Eq(70));
}

TEST_F(AnImmuneCell, ChangesToValueLayerAffectAllSharedObjects)
{
  pValueLayer->set(41, pt);

  ASSERT_THAT(_p_immuneCell1->getCytoMap()["test"]->get(pt), Eq(41));
  ASSERT_THAT(_p_immuneCell2->getCytoMap()["test"]->get(pt), Eq(41));
}
