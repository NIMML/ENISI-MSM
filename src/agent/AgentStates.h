/*
 * AgentStates.h
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#ifndef AGENT_AGENTSTATES_H_
#define AGENT_AGENTSTATES_H_

#include <map>

#include "ENISIAgent.h"

namespace ENISI
{
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
  enum State {MONOCYTE/*base state*/, RESIDENT, REGULATORY, INFLAMMATORY, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

class HPyloriState
{
public:
  enum State {LIVE, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

class EpithelialCellState
{
public:
  enum State {HEALTHY, DAMAGED, DEAD, KEEP_AT_END};
  static Agent::Type Type;
};

typedef std::vector< double > Concentration;
typedef std::map< Agent::Type, Concentration > Concentrations;
void concentrations(const Agent::Type & type, std::vector< Agent * > agents, Concentration & concentration);
void concentrations(const int & types, std::vector< Agent * > agents, Concentrations & concentrations);

typedef std::vector< size_t > Number;
typedef std::map< Agent::Type, Number > Numbers;
void numbers(const Agent::Type & type, std::vector< Agent * > agents, Number & number);
void numbers(const int & types, std::vector< Agent * > agents, Numbers & numbers);

extern double Threshold;
extern double Distance;

void init();
} // namespace ENISI

#endif /* AGENT_AGENTSTATES_H_ */
