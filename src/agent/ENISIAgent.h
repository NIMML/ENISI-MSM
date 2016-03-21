#ifndef ENISI_MSM_ENISIAGENT_H
#define ENISI_MSM_ENISIAGENT_H

#include <stdexcept>
#include "AgentId.h" //repast::Agent, repast::AgentId
#include "SharedContext.h"
#include "RepastProcess.h"

//TODO reconcile TOLEROGENIC and TOLEROGENIC
namespace ENISI
{

class AgentState
{
public:
  enum State
  {
    DEAD, IMMATURE, EFFECTOR, INFECTIOUS, TOLEROGENIC,
    NAIVE, TH1, TH17, TREG, Tr
  };
};

class Agent: public repast::Agent
{
public:
  typedef repast::SharedContext<Agent> Context;
  enum Color {pink, red, blue, green, black, cyan };

  Agent();

  virtual void act() = 0;

  virtual ~Agent() {}

  /* Required Getters */
  virtual repast::AgentId& getId() {return id;}
  virtual const repast::AgentId& getId() const {return id;}
  virtual void setId(repast::AgentId i) {id = i;}

  void setState(const AgentState::State & st) {_state = st;}
  AgentState::State getState() const {return _state;}

  virtual Color getColor() {return black;}

  /* Used by AgentPackageReceiver to create/sync agents across processes
     Ensure the return string matches the corresponding code in AgentFactory */
  virtual std::string classname() = 0;

protected:

private:
  AgentState::State _state;

  static int agentCount;
  repast::AgentId id;
};
} // namespace ENISI

#endif
