#include "../InitSharedContextTestFixture.h"
#include "ENISIAgent.h"

using namespace testing;

const std::string ENISIAgentClassName = "MockENISIAgent";

class MockENISIAgent: public ENISIAgent
{		  
  public:
  MockENISIAgent() { } 

  virtual Color getColor() { return black; }
  virtual void act() { }
  virtual std::string classname() { return ENISIAgentClassName; }
};

class AnENISIAgent: public InitSharedContext 
{ 
public:
  MockENISIAgent * _p_agent1;
  void SetUp() 
  {
    _p_agent1 = new MockENISIAgent;
  }
  void TearDown() {
    delete _p_agent1;
  }	
};

TEST_F(AnENISIAgent, HasUniqueID) 
{
  MockENISIAgent agent2;

  ASSERT_THAT(_p_agent1->getId(), Ne(agent2.getId()) );
}

TEST_F(AnENISIAgent, ReturnsClassName) 
{
  ASSERT_THAT(_p_agent1->classname(), Eq(ENISIAgentClassName) );
}

TEST_F(AnENISIAgent, SuccessfullySetsId) 
{
  repast::AgentId id(0, 0, 0);
  ASSERT_THAT(_p_agent1->getId(), Ne(id));

  _p_agent1->setId(id);
  ASSERT_THAT(_p_agent1->getId(), Eq(id));
}

TEST_F(AnENISIAgent, SuccessfullySetsState) 
{
  _p_agent1->setState(AgentState::DEAD);
  ASSERT_THAT(_p_agent1->getState(), Eq(AgentState::DEAD));
}

TEST_F(AnENISIAgent, AgentIdRankMatchesRepastProcessInstanceRank)
{
  ASSERT_THAT(_p_agent1->getId().currentRank(), Eq(repast::RepastProcess::instance()->rank()));
}
