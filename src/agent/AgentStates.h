/*
 * AgentStates.h
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#ifndef AGENT_AGENTSTATES_H_
#define AGENT_AGENTSTATES_H_

namespace ENISI
{

class TcellState
{
public:
  enum State {NAIVE, TH1, TH17, iTREG, Tr, DEAD, KEEP_AT_END };
};

class DendriticState
{
public:
  enum State {IMMATURE, EFFECTOR, TOLEROGENIC, DEAD, KEEP_AT_END};
};

class BacteriaState
{
public:
  enum State {DEAD, INFECTIOUS, TOLEROGENIC, KEEP_AT_END};
};

class MacrophageState
{
public:
  enum State {MONOCYTE/*base state*/, REGULATORY, INFLAMMATORY, DEAD, KEEP_AT_END};
};

class HPyloriState
{
public:
  enum State {NAIVE, DEAD, KEEP_AT_END};
};

class EpithelialCellState
{
public:
  enum State {HEALTHY, DAMAGED, DEAD, KEEP_AT_END};
};
} // namespace ENISI

#endif /* AGENT_AGENTSTATES_H_ */
