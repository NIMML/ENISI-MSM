#ifndef ENISI_MSM_AGENT_TCELLGROUP_H
#define ENISI_MSM_AGENT_TCELLGROUP_H

#include "TcellODE.h"
#include "CellGroup.h"
#include "Cytokines.h"
#include "CoordMap.h"

class TcellGroup: public CellGroup, public CoordinateMap<5>
{
public:
  enum State { NAIVE, TH1, TH17, TREG, DEAD, LAST_STATE_DO_NOT_MOVE};

  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  TcellGroup(const boost::uintmax_t, CellLayer * p_layer);

  virtual void act();
  int count();
  StateCount countByState();

  void moveCellFromTo(State, const repast::Point<int> &, 
                             const repast::Point<int> &);
  void transferStateTo(State, const repast::Point<int> &, unsigned int = 1);

  static std::vector<TcellGroup *> & instances()
  {
    static std::vector<TcellGroup *> instances;
    return instances;
  }

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "TcellGroup"; }
protected:
private:
  void act(State, const repast::Point<int> &);
  void init(const boost::uintmax_t);
};

#endif
