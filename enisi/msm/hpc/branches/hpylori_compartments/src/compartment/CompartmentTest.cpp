#include "../InitSharedContextTestFixture.h"
#include "agent/AgentFactory.h"

using namespace testing;

class MockAgentGroup: public CellGroup
{		  
  public:
  MockAgentGroup(ENISI::Compartment * p_cmp) 
    : CellGroup(p_cmp->cellLayer()) { }
  virtual Color getColor() { return black; }
  virtual void act() { }
  virtual std::string classname() { return "MockAgentGroup"; }
};

class AnENISICompartment: public InitSharedContext 
{ 
public:
  ENISI::Compartment * _p_compartment;

  void SetUp() 
  {
    InitSharedContext::SetUp(); 

    const repast::Point<double> origin(0, 0);
    const repast::Point<double> extents(100, 100);

    const std::string name = "compartment";
    const repast::GridDimensions dimensions(origin, extents);

    _p_compartment = new ENISI::Compartment(_dimensions);
  }

  void TearDown()
  {
    delete _p_compartment;
  }

private:
};

TEST_F(AnENISICompartment, CanFindItsAgent)
{
  CellGroup * p_agent = 
    AgentGroupFactory::create("TcellGroup", _p_compartment, 0);

  std::vector<double> loc;
  _p_compartment->cellLayer()->getLocation(p_agent->getId(), loc);

  ASSERT_THAT(loc.size(), Eq(2));
}
