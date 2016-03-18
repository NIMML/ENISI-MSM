#ifndef ENISI_MSM_MOBILEAGENT_H
#define ENISI_MSM_MOBILEAGENT_H

#include "agent/ENISIAgent.h"
#include "compartment/CellLayer.h"

template <class A, class P, class PP, class PR>
class MobileAgent : public ENISIAgent
{
public:
  MobileAgent(ICompartmentLayer<A, P, PP, PR> * p_layer) : _p_layer(p_layer) {}
  virtual ~MobileAgent() {}

  virtual void act() = 0;
  virtual std::string classname() = 0;

  void move(double x, double y);
  double randomMove(double = 1);

  std::vector<double> getLocation();
  std::vector<A*> getNeighbors(const std::string);

protected:
  ICompartmentLayer<A, P, PP, PR> * layer() const {return _p_layer;}
private:
  ICompartmentLayer<A, P, PP, PR> * _p_layer;
};

template <class A, class P, class PP, class PR>
std::vector<double> MobileAgent<A, P, PP, PR>::getLocation()
{
  std::vector<double> loc;
  _p_layer->getLocation(getId(), loc);
  return loc;
}

template <class A, class P, class PP, class PR>
void MobileAgent<A, P, PP, PR>::move(double x, double y)
{
  _p_layer->moveAgentTo(this, repast::Point<double>(x, y));
}

template <class A, class P, class PP, class PR>
double MobileAgent<A, P, PP, PR>::randomMove(double speed)
{
  double fullCircle = 2 * 3.14; // in radians
  double angle =
    repast::Random::instance()->createUniDoubleGenerator(0, fullCircle).next();
  double radius =
    repast::Random::instance()->createUniDoubleGenerator(0, speed).next();

  std::vector<double> loc = getLocation();
  double x = loc[0] + radius * cos(angle);
  double y = loc[1] + radius * sin(angle);

  move(x, y);

  return radius;
}

template <class A, class P, class PP, class PR>
std::vector<A*> MobileAgent<A, P, PP, PR>::getNeighbors(const std::string name)
{
  std::vector<double> loc = getLocation();
  repast::Point<int> pt(loc[0], loc[1]);
  return _p_layer->getNeighborsAt(name, pt);
}
#endif
