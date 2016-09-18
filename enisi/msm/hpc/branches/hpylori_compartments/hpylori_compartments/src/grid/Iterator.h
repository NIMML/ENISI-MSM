/*
 * Iterator.h
 *
 *  Created on: Mar 30, 2016
 *      Author: shoops
 */

#ifndef GRID_ITERATOR_H_
#define GRID_ITERATOR_H_

#include "repast_hpc/GridComponents.h"

namespace ENISI
{

class Iterator
{
private:
  Iterator();
public:
  Iterator(const repast::GridDimensions & dimensions);
  Iterator(const repast::Point< int > & origin, repast::Point< int > & extents);
  ~Iterator();
  bool next(const size_t coodinate = 0);
  const repast::Point< int > & operator *();
  const repast::Point< int > * operator ->();
  operator bool();

private:
  repast::Point< int > mOrigin;
  repast::Point< int > mExtents;
  repast::Point< int > mCurrent;
};

} /* namespace ENISI */

#endif /* GRID_ITERATOR_H_ */
