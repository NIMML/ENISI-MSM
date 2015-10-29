#ifndef ENISI_MSM_ENISIAGENT_H
#define ENISI_MSM_ENISIAGENT_H

#include "../SiloWriter.h"
#include <stdexcept>
#include <vector>
#include "AgentId.h" //repast::Agent, repast::AgentId
#include "SharedContinuousSpace.h" // repast::SharedContinuousSpace
#include "SharedDiscreteSpace.h" // repast::SharedDiscreteSpace
#include "Moore2DGridQuery.h"

//TODO reconcile TOLEGENIC and TOLEROGENIC
namespace AgentState {
  enum State { 
    DEAD, IMMATURE, EFFECTOR, INFECTIOUS, TOLEGENIC, TOLEROGENIC, 
    NAIVE, TH1, TH17, TREG
  };
};

class ENISIAgent: public repast::Agent 
{
public:
  enum Color { pink, red, blue, green, black };

  //TODO: java version uses wraparound borders. Is this what we want?
  //typedef repast::StickyBorders Borders;
  typedef repast::WrapAroundBorders Borders;
  //TODO: java version uses RandomCartesianAdder. Is there an equivalent?
  //TODO: Move space classes out of base agent and into ENISISpace equivalent
  typedef repast::SimpleAdder<ENISIAgent> Adder;
  typedef repast::SharedContinuousSpace<ENISIAgent, Borders, Adder> Space;
  typedef repast::SharedDiscreteSpace<ENISIAgent, Borders, Adder> Grid;

  ENISIAgent(repast::SharedContext<ENISIAgent>*);

  virtual void act() { }

  double getX() { return xCoord; }
  double getY() { return yCoord; }

  virtual ~ENISIAgent() { }

  /* Required Getters */
  virtual repast::AgentId& getId(){                   return id;    }
  virtual const repast::AgentId& getId() const {      return id;    }
  virtual void setId(repast::AgentId i) { id = i; }

  void setState(AgentState::State st) { _state = st; }
  AgentState::State getState() const { return _state; }

  repast::Point<int> getGridLocation() const;

  void moveTo(double, double);

  virtual Color getColor() =0;

  /* Used by AgentPackageReceiver to create/sync agents across processes 
     Ensure the return string matches the corresponding code in AgentFactory */
  virtual std::string classname() =0;

  static int getAgentCount() { return agentCount; }
  template<class T> std::vector<T*> getNeighbors();

protected:
  repast::SharedContext<ENISIAgent>* context;
  Space* space;
  Grid* grid; /* Keep track of agents in discrete grid to easily find neighbors */

  double randomMove() { return randomMove(1); }
  double randomMove(double);

  AgentState::State _state;
private:
  double xCoord, yCoord;
  static int agentCount;
  repast::AgentId id;

};

/*template<class Referrer> */
//std::vector<Referrer*> ENISIAgent::getNeighbors()
//{
  //std::vector<Referrer*> matchNeighbors;

  //std::vector<ENISIAgent*> allNeighbors;
  //grid->getObjectsAt(getGridLocation(), allNeighbors);

  //std::vector<ENISIAgent*>::const_iterator iter = allNeighbors.begin();
  //while(iter != allNeighbors.end()){
    //if( Referrer* ref = dynamic_cast< Referrer* >( *iter ) ){
      //matchNeighbors.push_back(ref);
    //}
    //++iter;
  //}

  //return matchNeighbors;
/*}*/

template<class Referrer> 
std::vector<Referrer*> ENISIAgent::getNeighbors()
{
  std::vector<ENISIAgent*> agentsToPlay;

  repast::Moore2DGridQuery<ENISIAgent> moore2DQuery(grid);
  int range = 0;
  bool includeCenter = true;
  moore2DQuery.query(getGridLocation(), range, includeCenter, agentsToPlay);

  std::vector<Referrer*> matchingNeighbors;

  /* Pulling agents across processes can result in duplicates. Check to make
  sure we aren't returning any */
  std::map<repast::AgentId, bool> seen;

  std::vector<ENISIAgent*>::iterator agentToPlay = agentsToPlay.begin();
  while (agentToPlay != agentsToPlay.end()) 
  {
    if ( Referrer* ref = dynamic_cast< Referrer* >( *agentToPlay ) )
    {
      bool isUnique = ( seen.find((*agentToPlay)->getId()) == seen.end() );
      if (isUnique) matchingNeighbors.push_back(ref);
    }
    seen[(*agentToPlay)->getId()] = true;
    ++agentToPlay;
  }

  return matchingNeighbors;
}

#endif
