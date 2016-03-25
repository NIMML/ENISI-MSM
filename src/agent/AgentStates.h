/*
 * AgentStates.h
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#ifndef AGENT_AGENTSTATES_H_
#define AGENT_AGENTSTATES_H_

#include "ENISIAgent.h"

namespace ENISI
{

class Space2Grid
{
public:
  double grid;
  double space;
  double scale;
};

class TcellState
{
public:
  enum State {NAIVE, TH1, TH17, iTREG, Tr, DEAD, KEEP_AT_END };
  static Agent::Type Type;
};

class DendriticState
{
public:
  enum State {IMMATURE, EFFECTOR, TOLEROGENIC, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

class BacteriaState
{
public:
  enum State {DEAD, INFECTIOUS, TOLEROGENIC, KEEP_AT_END};
  static Agent::Type Type;
};

class MacrophageState
{
public:
  enum State {MONOCYTE/*base state*/, REGULATORY, INFLAMMATORY, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

class HPyloriState
{
public:
  enum State {NAIVE, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

class EpithelialCellState
{
public:
  enum State {HEALTHY, DAMAGED, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

typedef std::vector< size_t > StateCount;

typedef std::map< Agent::Type, StateCount > StateCounts;

void CountStates(const Agent::Type & type, std::vector< Agent * > agents, StateCount & stateCount);
void CountStates(const int & types, std::vector< Agent * > agents, StateCounts & stateCounts);

} // namespace ENISI

#endif /* AGENT_AGENTSTATES_H_ */
