#ifndef ENISI_MSM_AGENTFACTORY_H
#define ENISI_MSM_AGENTFACTORY_H

#include <string>

class Agent;
class CellGroup;
class Compartment;

namespace ENISI
{

class AgentFactory
{
public:
  static Agent * create(const std::string & name, Compartment * pCompartment);

private:
};

class AgentGroupFactory
{
public:
  static CellGroup * create(const std::string & name, Compartment * pCompartment, const size_t & count = 0);
};
} // namespace ENISI
#endif
