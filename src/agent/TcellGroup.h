#ifndef ENISI_MSM_AGENT_TCELLGROUP_H
#define ENISI_MSM_AGENT_TCELLGROUP_H

#include "TcellODE.h"
#include "Cytokines.h"
#include "CoordMap.h"

namespace ENISI
{

class TcellState
{
public:
  enum State { NAIVE, TH1, TH17, TREG, Tr, DEAD, KEEP_AT_END };
};

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

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "TcellGroup"; }
  //Added the declaration of getTcellNeighbors function here
  std::vector< const TcellGroup::StateCount *>
  getMacrophageNeighbors(const repast::Point<int> &);
protected:
private:

  void act(TcellState::State, const repast::Point<int> &);
  void init(const boost::uintmax_t);
};

} // namespace ENISI

#endif
