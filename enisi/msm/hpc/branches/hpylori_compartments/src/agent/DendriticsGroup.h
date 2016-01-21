#ifndef ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H
#define ENISI_MSM_AGENT_DENDRITICS_COMPONENT_H

#include "CellGroup.h"
#include "BacteriaGroup.h"

class DendriticsGroup: public CellGroup
{
public:
  enum State { IMMATURE, EFFECTOR, TOLEROGENIC, DEAD, LAST_STATE_DO_NOT_MOVE};

  struct StateCount { unsigned int state[LAST_STATE_DO_NOT_MOVE]; };
  typedef std::map<repast::Point<int>, StateCount> CoordMap;

  DendriticsGroup(const boost::uintmax_t, CellLayer *);

  virtual void act();

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "DendriticsGroup"; }

protected:
  static std::vector<double> randomMove(const double &, const repast::Point<int> &);
private:
  void act(State, const repast::Point<int> &);

  const std::vector<BacteriaGroup::StateCount> 
    getBacteriaNeighbors(const repast::Point<int> &);

  CoordMap coordMap;
};

#endif
