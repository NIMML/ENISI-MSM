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
  enum BoundState { OUT_LOW = -1, INBOUND = 0, OUT_HIGH = 1};
  enum Coodinate { X = 0, Y = 1, Z = 2 };
  enum Side { LOW = 0, HIGH };

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

  void translate(const std::vector<double>& oldPos, std::vector<double>& newPos, const std::vector<double>& displacement) const;
  void translate(const std::vector<int>& oldPos, std::vector<int>& newPos, const std::vector<int>& displacement) const;

  void setBorderType(const Coodinate &coordinate, const Side & side, const Type & type);
  const Type & getBorderType(const Coodinate &coordinate, const Side & side) const;

protected:
  size_t mDimension;

private:
  std::vector<Type> mBorderTypeLeft;
  std::vector<Type> mBorderTypeRight;
};

class SimpleBorders  : public repast::Borders
{
  private:
    SimpleBorders();

  public:
    SimpleBorders(repast::GridDimensions d);
    virtual ~SimpleBorders();

    void transform(const std::vector<int>& in, std::vector<int>& out) const;
    void transform(const std::vector<double>& in, std::vector<double>& out) const;

    void translate(const std::vector<double>& oldPos, std::vector<double>& newPos, const std::vector<double>& displacement) const;
    void translate(const std::vector<int>& oldPos, std::vector<int>& newPos, const std::vector<int>& displacement) const;
};

} /* namespace ENISI */

#endif /* GRID_BORDERS_H_ */