#ifndef ENISI_MSM_AGENT_TCELL_COMPONENT_H
#define ENISI_MSM_AGENT_TCELL_COMPONENT_H

#include "TcellODE.h"
#include "ENISIAgent.h"
#include "Cytokines.h"

class TcellGroup: public ENISIAgent 
{
public:
  enum State { NAIVE, TH1, TH17, TREG, DEAD, LAST_STATE_DO_NOT_MOVE};

  struct StateCount { 
    unsigned int state[LAST_STATE_DO_NOT_MOVE]; 
    StateCount() : state() { }
  };

  typedef std::map<repast::Point<int>, StateCount> CoordMap;
  typedef std::map<int, std::vector<std::pair<int, int> > > Transfers;

  TcellGroup(const unsigned int &, repast::SharedContext<ENISIAgent> *);

  virtual void act();
  int count();
  StateCount countByState();

  void addStateAt(State, const repast::Point<int> &);

  void transferStateTo(State, const repast::Point<int> &, unsigned int = 1);
  const Transfers & getTransfers() { return markedForTransfer; }
  void clearTransfers() { markedForTransfer = Transfers(); }
  void setTransfers(const Transfers & newTransfers) 
  { 
    markedForTransfer = newTransfers; 
  }

  const StateCount &
    getCellsAt(const repast::Point<int> & loc) { return coordMap[loc]; }

  const CoordMap & getCoordMap() { return coordMap; }

  void setCoordMap(const CoordMap & newCoordMap) { coordMap = newCoordMap; }

  static std::vector<TcellGroup *> & instances()
  {
    static std::vector<TcellGroup *> instances;
    return instances;
  }

  bool isPointInBounds(const repast::Point<int> &);

  virtual Color getColor() { return black; }
  virtual std::string classname() { return "TcellGroup"; }
protected:
  std::vector<double> randomMove(const double &, const repast::Point<int> &);
private:
  void act(State, const repast::Point<int> &);
  void init(const unsigned int & , repast::SharedContext<ENISIAgent> *);

  CoordMap coordMap;

  Transfers markedForTransfer;
};

#endif
