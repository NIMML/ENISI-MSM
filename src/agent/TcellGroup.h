#ifndef ENISI_MSM_AGENT_TCELLGROUP_H
#define ENISI_MSM_AGENT_TCELLGROUP_H

#include "TcellODE.h"
#include "Cytokines.h"
#include "AgentStates.h"
#include "CoordMap.h"



namespace ENISI
{

class TcellGroup: public CoordinateMap<TcellState::KEEP_AT_END>
{
public:
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  TcellGroup(const boost::uintmax_t, Compartment * pCompartment);

  virtual void act();
  int count();
  StateCount countByState();

  void transferStateTo(TcellState::State, const repast::Point<int> &,
                       unsigned int = 1);

  virtual Color getColor() {return black;}
  virtual std::string classname() {return "TcellGroup";}

protected:
private:

  void act(TcellState::State, const repast::Point<int> &);
  //Added the declaration of getTcellNeighbors function here
  std::vector< const typename CoordinateMap<MacrophageState::KEEP_AT_END>::StateCount * >
  getMacrophageNeighbors(const repast::Point<int> &);
  std::vector< const typename CoordinateMap<TcellState::KEEP_AT_END>::StateCount * >
  getTcellNeighbors(const repast::Point<int> &);
  std::vector< const typename CoordinateMap<DendriticState::KEEP_AT_END>::StateCount * >
  getDendriticsNeighbors(const repast::Point<int> &);
  void init(const boost::uintmax_t);
};
} // namespace ENISI

#endif
