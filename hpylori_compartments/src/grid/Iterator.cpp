/*
 * Iterator.cpp
 *
 *  Created on: Mar 30, 2016
 *      Author: shoops
 */

#include "Iterator.h"

using namespace ENISI;

Iterator::Iterator(const repast::GridDimensions & dimensions):
  mOrigin(dimensions.dimensionCount(), 0),
  mExtents(dimensions.dimensionCount(), 0),
  mCurrent(dimensions.dimensionCount(), 0)
{
  for (size_t i = 0; i < dimensions.dimensionCount(); ++i)
    {
      mOrigin[i] = floor(dimensions.origin(i));
      mExtents[i] = floor(dimensions.extents(i));
    }

  mCurrent = mOrigin;
}

Iterator::Iterator(const repast::Point< int > & origin, repast::Point< int > & extents):
  mOrigin(origin),
  mExtents(extents),
  mCurrent(origin)
{}

Iterator::~Iterator()
{}

bool Iterator::next(const size_t coodinate)
{
  size_t i, imax = mOrigin.dimensionCount();

  for (i = coodinate; i < imax; ++i)
    {
      mCurrent[i]++;

      if (mCurrent[i] < mOrigin[i] + mExtents[i])
        {
          return true;
        }

      if (i != imax - 1)
        {
          mCurrent[i] = round(mOrigin[i]);
        }
    }

  return false;
}

const repast::Point< int > & Iterator::operator *()
{
  return mCurrent;
}

const repast::Point< int > * Iterator::operator ->()
{
  return &mCurrent;
}

Iterator::operator bool()
{
  size_t i = mOrigin.dimensionCount() - 1;

  return mCurrent[i] < mOrigin[i] + mExtents[i];
}
