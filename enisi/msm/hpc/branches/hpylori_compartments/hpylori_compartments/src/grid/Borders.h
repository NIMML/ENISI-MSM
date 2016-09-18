/*
 * Borders.h
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#ifndef GRID_BORDERS_H_
#define GRID_BORDERS_H_

#include "repast_hpc/GridComponents.h"

namespace ENISI
{

class Borders : public repast::Borders
{
public:
  static const char* TypeNames[];

  enum Type { REFLECT, WRAP, STICKY, PERMIABLE};
  enum BoundState { OUT_LOW = -1, INBOUND = 0, OUT_HIGH = 1, OUT_BOTH };
  enum Coodinate { X = 0, Y = 1, Z = 2 };
  enum Side { LOW, HIGH };

private:
  Borders();

public:
  Borders(repast::GridDimensions d);
  virtual ~Borders();

  int distanceFromBorder(const std::vector<int>& pt, const Coodinate &coordinate, const Side & side) const;
  double distanceFromBorder(const std::vector<double>& pt, const Coodinate & coordinate, const Side & side) const;

  bool boundsCheck(const std::vector<int>& pt, std::vector<BoundState> * pBoundState = NULL) const;
  bool boundsCheck(const std::vector<double>& pt, std::vector<BoundState> * pBoundState = NULL) const;

  void transform(const std::vector<int>& in, std::vector<int>& out) const;
  void transform(const std::vector<double>& in, std::vector<double>& out) const;

  void transform(std::vector<int>& pt) const;
  void transform(std::vector<double>& pt) const;

  void translate(const std::vector<double>& oldPos, std::vector<double>& newPos, const std::vector<double>& displacement) const;
  void translate(const std::vector<int>& oldPos, std::vector<int>& newPos, const std::vector<int>& displacement) const;

  void setBorderType(const Coodinate &coordinate, const Side & side, const Type & type);
  const Type & getBorderType(const Coodinate &coordinate, const Side & side) const;

  bool isPeriodic() const;

protected:
  size_t mDimension;

private:
  std::vector< std::vector< Type > > mBorderType;
};

class SimpleBorders  : public repast::Borders
{
  public:
    SimpleBorders();

    SimpleBorders(repast::GridDimensions d);
    virtual ~SimpleBorders();

    void transform(const std::vector<int>& in, std::vector<int>& out) const;
    void transform(const std::vector<double>& in, std::vector<double>& out) const;

    void translate(const std::vector<double>& oldPos, std::vector<double>& newPos, const std::vector<double>& displacement) const;
    void translate(const std::vector<int>& oldPos, std::vector<int>& newPos, const std::vector<int>& displacement) const;

    bool isPeriodic() const;
};

} /* namespace ENISI */

#endif /* GRID_BORDERS_H_ */
