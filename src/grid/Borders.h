/*
 * Borders.h
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#ifndef GRID_BORDERS_H_
#define GRID_BORDERS_H_

#include "GridComponents.h"

namespace ENISI
{

class Borders : public repast::Borders
{
public:
  enum Type { REFLECT, WRAP, STICKY, PERMIABLE } ;
  enum BoundState { OUT_LEFT = -1, IN_BOUND = 0, OUT_RIGHT = 1};

private:
  Borders();

public:
  Borders(repast::GridDimensions d);
  virtual ~Borders();

  bool boundsCheck(const std::vector<int>& pt, std::vector<BoundState> * pBoundState = NULL) const;
  bool boundsCheck(const std::vector<double>& pt, std::vector<BoundState> * pBoundState = NULL) const;

  void transform(const std::vector<int>& in, std::vector<int>& out) const;
  void transform(const std::vector<double>& in, std::vector<double>& out) const;

  void translate(const std::vector<double>& oldPos, std::vector<double>& newPos, const std::vector<double>& displacement) const;
  void translate(const std::vector<int>& oldPos, std::vector<int>& newPos, const std::vector<int>& displacement) const;

  void setBorderTypeLeft(const size_t & i, const Type & type);
  const Type & getBorderTypeLeft(const size_t & i) const;

  void setBorderTypeRight(const size_t & i, const Type & type);
  const Type & getBorderTypeRight(const size_t & i) const;

protected:
  const size_t mDimension;

private:
  std::vector<Type> mBorderTypeLeft;
  std::vector<Type> mBorderTypeRight;
};

} /* namespace ENISI */

#endif /* GRID_BORDERS_H_ */
