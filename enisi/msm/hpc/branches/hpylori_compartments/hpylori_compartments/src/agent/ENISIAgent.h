#ifndef ENISI_MSM_ENISIAGENT_H
#define ENISI_MSM_ENISIAGENT_H

#include "repast_hpc/AgentId.h" //repast::Agent, repast::AgentId

//TODO reconcile TOLEROGENIC and TOLEROGENIC
namespace ENISI
{

class Compartment;

class Agent: public repast::Agent
{
private:
  Agent();

public:
  enum Type
  {
    Bacteria = 0x01,
    Dentritics = 0x02,
    EpithelialCell = 0x04,
    HPylori = 0x08,
    ImmuneCell = 0x10,
    Macrophage = 0x20,
    Tcell = 0x40,
    DiffuserValues = 0x80
  };

  enum Color {pink, red, blue, green, black, cyan };

  Agent(const Type & type, const int & state);
  Agent(const int & id, const int & startProc, const int & agentType, const int & currentProc, const int & state);
  // virtual void act() = 0;

  virtual ~Agent();

  /* Required Getters */
  virtual repast::AgentId & getId();
  virtual const repast::AgentId& getId() const;
  virtual void setId(repast::AgentId i);

  Type getType() const;

  void setState(const int & st);
  int getState() const;

  /* Used by AgentPackageReceiver to create/sync agents across processes
     Ensure the return string matches the corresponding code in AgentFactory */
  virtual std::string classname();

  virtual void write(std::ostream & o, const std::string & separator, Compartment * pCompartment = NULL);
protected:

private:
  static const char * Names[];
  static int agentCount;
  repast::AgentId id;
  int _state;

};

} // namespace ENISI

#endif
