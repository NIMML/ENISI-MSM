#include "../InitSharedContextTestFixture.h"

using namespace testing;

const std::string ENISIAgentClassName = "MockENISIAgent";

class MockENISIAgent: public ENISIAgent
{		  
  public:
  MockENISIAgent(repast::SharedContext<ENISIAgent>* ctx) 
    : ENISIAgent(ctx) { }
  virtual Color getColor() { return black; }
  virtual std::string classname() { return ENISIAgentClassName; }
};

class AnENISIAgent: public InitSharedContext 
{ 
public:
  MockENISIAgent * agent1;
  void SetUp() 
  {
    InitSharedContext::SetUp(); 
    agent1 = new MockENISIAgent(global_context);
  }
  void TearDown() {
    delete agent1;
  }	
};

TEST_F(AnENISIAgent, HasUniqueID) 
{
  MockENISIAgent agent2(global_context);

  ASSERT_THAT(agent1->getId(), Ne(agent2.getId()) );
}

TEST_F(AnENISIAgent, ReturnsClassName) 
{
  ASSERT_THAT(agent1->classname(), Eq(ENISIAgentClassName) );
}

TEST_F(AnENISIAgent, SuccessfullySetsId) 
{
  repast::AgentId id(0, 0, 0);
  ASSERT_THAT(agent1->getId(), Ne(id));

  agent1->setId(id);
  ASSERT_THAT(agent1->getId(), Eq(id));
}

TEST_F(AnENISIAgent, SuccessfullySetsState) 
{
  agent1->setState(AgentState::DEAD);
  ASSERT_THAT(agent1->getState(), Eq(AgentState::DEAD));
}

TEST_F(AnENISIAgent, AgentIdRankMatchesRepastProcessInstanceRank)
{
  ASSERT_THAT(agent1->getId().currentRank(), Eq(repast::RepastProcess::instance()->rank()));
}
