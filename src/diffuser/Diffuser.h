#ifndef ENISI_MSM_DIFFUSER_H_
#define ENISI_MSM_DIFFUSER_H_

#include "agent/ENISIAgent.h" 

namespace ENISI {

class DiffuserLayer;
class DiffuserImpl;

class Diffuser : public Agent
{
public:
  Diffuser(DiffuserLayer * p_cl, 
	   double e = 1.0,
	   double d = 1.0,
	   bool t = true);
  virtual ~Diffuser();

  virtual void act();
  virtual std::string classname();
  void diffuse();

  double getDiffusionConst();
  void   setDiffusionConst(double d);

  double getEvaporationConst();
  void   setEvaporationConst(double e);

  void setDimensions(const repast::GridDimensions &);
  const repast::GridDimensions & getDimensions() const;

  typedef repast::Point<int> Coords;

  std::vector<Coords > getGridCoordsAssignedToRank();

  void setGridPointsToCalculate(const std::vector<Coords > & p);

  void setValueAtCoord(double d, const Coords & c);
  double getCoordValue(const Coords & c);

  void setValuesAtCoords(std::vector<double> &, std::vector<Coords >);

  std::vector<double> getAssignedGridValues();

  double ** getGrid();
  void setGrid(double **);

protected:  
  DiffuserLayer * layer() { return _p_layer; }

private:  
  DiffuserImpl * p_impl;
  DiffuserLayer * _p_layer;
};

} // namespace ENISI

#endif
