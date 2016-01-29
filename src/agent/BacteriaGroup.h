#ifndef ENISI_MSM_BACTERIA_COMPONENT_H
#define ENISI_MSM_BACTERIA_COMPONENT_H

#include "Bacteria.h"
#include "TcellGroup.h"
#include "Properties.h"

class BacteriaGroup: public CellGroup {
public:
  enum State { DEAD, INFECTIOUS, TOLEGENIC, LAST_STATE_DO_NOT_MOVE};

  struct StateCount { unsigned int state[LAST_STATE_DO_NOT_MOVE]; };
  typedef std::map<repast::Point<int>, StateCount> CoordMap;

  BacteriaGroup(const boost::uintmax_t, CellLayer * p_layer);

  virtual void act();

  const std::vector< const std::vector<int> *> 
    getTcellNeighbors(const repast::Point<int> &);

  static std::vector<BacteriaGroup *> & instances()
  {
    static std::vector<BacteriaGroup *> instances;
    return instances;
  }

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "BacteriaGroup"; }

private:
  void act(State, const repast::Point<int> &);
  void init(const boost::uintmax_t);
};

#endif
