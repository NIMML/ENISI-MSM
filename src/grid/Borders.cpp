/*
 * Borders.cpp
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#include "Borders.h"

using namespace ENISI;


Borders::Borders(repast::GridDimensions d):
  repast::Borders(d),
  mDimension(d.dimensionCount()),
  mBorderTypeLeft(d.dimensionCount()),
  mBorderTypeRight(d.dimensionCount())
{
  std::vector<Type>::iterator it = mBorderTypeLeft.begin();
  std::vector<Type>::iterator end = mBorderTypeLeft.end();

  for (; it != end; ++it)
    {
      *it = WRAP;
    }

  it = mBorderTypeRight.begin();
  end = mBorderTypeRight.end();

  for (; it != end; ++it)
    {
      *it = WRAP;
    }
}

// virtual
Borders::~Borders()
{}

bool Borders::boundsCheck(const std::vector<int>& pt, std::vector<BoundState> * pBoundState) const
{
  static std::vector<BoundState> State(mDimension);

  bool inBounds = true;

  std::vector<BoundState>::iterator itState;
  std::vector<BoundState>::iterator endState;

  if (pBoundState != NULL)
    {
      itState = pBoundState->begin();
      endState = pBoundState->end();
    }
  else
    {
      itState = State.begin();
      endState = State.end();
    }

  std::vector<Type>::const_iterator itTypeLeft = mBorderTypeLeft.begin();
  std::vector<Type>::const_iterator itTypeRight = mBorderTypeRight.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<int>::const_iterator itPt = pt.begin();

  for (; itState != endState; ++itState, ++itTypeLeft, ++itTypeRight, ++itOrigin, ++itExtend)
    {
      if (*itPt < *itOrigin)
        if (*itTypeLeft == PERMIABLE || *itTypeLeft == STICKY)
          {
            *itState = OUT_LEFT;
            inBounds = false;
          }
        else
          {
            *itState = IN_BOUND;
          }
      else if (*itPt >= *itOrigin + *itExtend)
        if (*itTypeRight == PERMIABLE || *itTypeLeft == STICKY)
          {
            *itState = OUT_RIGHT;
            inBounds = false;
          }
        else
          {
            *itState = IN_BOUND;
          }
      else
        {
          *itState = IN_BOUND;
        }
    }

  return inBounds;
}

bool Borders::boundsCheck(const std::vector<double>& pt, std::vector<BoundState> * pBoundState) const
{
  static std::vector<BoundState> State(mDimension);

  bool inBounds = true;

  std::vector<BoundState>::iterator itState;
  std::vector<BoundState>::iterator endState;

  if (pBoundState != NULL)
    {
      itState = pBoundState->begin();
      endState = pBoundState->end();
    }
  else
    {
      itState = State.begin();
      endState = State.end();
    }

  std::vector<Type>::const_iterator itTypeLeft = mBorderTypeLeft.begin();
  std::vector<Type>::const_iterator itTypeRight = mBorderTypeRight.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<double>::const_iterator itPt = pt.begin();

  for (; itState != endState; ++itState, ++itTypeLeft, ++itTypeRight, ++itOrigin, ++itExtend)
    {
      if (*itPt < *itOrigin)
        if (*itTypeLeft == PERMIABLE || *itTypeLeft == STICKY)
          {
            *itState = OUT_LEFT;
            inBounds = false;
          }
        else
          {
            *itState = IN_BOUND;
          }
      else if (*itPt >= *itOrigin + *itExtend)
        if (*itTypeRight == PERMIABLE || *itTypeLeft == STICKY)
          {
            *itState = OUT_RIGHT;
            inBounds = false;
          }
        else
          {
            *itState = IN_BOUND;
          }
      else
        {
          *itState = IN_BOUND;
        }
    }

  return inBounds;
}

void Borders::transform(const std::vector<int>& in, std::vector<int>& out) const
{
  std::vector<Type>::const_iterator itTypeLeft = mBorderTypeLeft.begin();
  std::vector<Type>::const_iterator itTypeRight = mBorderTypeRight.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<int>::const_iterator itIn = in.begin();
  std::vector<int>::const_iterator endIn = in.end();
  std::vector<int>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itTypeLeft, ++itTypeRight, ++itOrigin, ++itExtend)
    {
      if (*itIn < *itOrigin)
        {
          switch (*itTypeLeft)
          {
            case REFLECT:
              *itOut = *itOrigin + *itOrigin - *itIn;
              break;

            case WRAP:
              *itOut = *itExtend + *itIn;
              break;

            case STICKY:
              *itOut = *itOrigin - 1;
              break;

            case PERMIABLE:
              *itOut = *itIn;
              break;
          }
        }
      else if (*itIn >= *itOrigin + *itExtend)
        {
          switch (*itTypeRight)
          {
            case REFLECT:
              *itOut = *itOrigin + *itOrigin + *itExtend + *itExtend - *itIn;
              break;

            case WRAP:
              *itOut = *itIn - *itExtend;
              break;

            case STICKY:
              *itOut = *itOrigin + *itExtend;
              break;

            case PERMIABLE:
              *itOut = *itIn;
              break;
          }
        }
      else
        {
          *itOut = *itIn;
        }
    }
}

void Borders::transform(const std::vector<double>& in, std::vector<double>& out) const
{
  std::vector<Type>::const_iterator itTypeLeft = mBorderTypeLeft.begin();
  std::vector<Type>::const_iterator itTypeRight = mBorderTypeRight.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<double>::const_iterator itIn = in.begin();
  std::vector<double>::const_iterator endIn = in.end();
  std::vector<double>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itTypeLeft, ++itTypeRight, ++itOrigin, ++itExtend)
    {
      if (*itIn < *itOrigin)
        {
          switch (*itTypeLeft)
          {
            case REFLECT:
              *itOut = *itOrigin + *itOrigin - *itIn;
              break;

            case WRAP:
              *itOut = *itExtend + *itIn;
              break;

            case STICKY:
              *itOut = *itOrigin -1;
              break;

            case PERMIABLE:
              *itOut = *itIn;
              break;
          }
        }
      else if (*itIn >= *itOrigin + *itExtend)
        {
          switch (*itTypeRight)
          {
            case REFLECT:
              *itOut = *itOrigin + *itOrigin + *itExtend + *itExtend - *itIn;
              break;

            case WRAP:
              *itOut = *itIn - *itExtend;
              break;

            case STICKY:
              *itOut = *itOrigin + *itExtend;
              break;

            case PERMIABLE:
              *itOut = *itIn;
              break;
          }
        }
      else
        {
          *itOut = *itIn;
        }
    }
}

void Borders::translate(const std::vector<int>& in, std::vector<int>& out, const std::vector<int>& move) const
{
  std::vector<int>::const_iterator itIn = in.begin();
  std::vector<int>::const_iterator endIn = in.end();
  std::vector<int>::const_iterator itShift = move.begin();
  std::vector<int>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itShift)
    {
      *itOut = *itIn * *itShift;
    }
}


void Borders::translate(const std::vector<double>& in, std::vector<double>& out, const std::vector<double>& move) const
{
  std::vector<double>::const_iterator itIn = in.begin();
  std::vector<double>::const_iterator endIn = in.end();
  std::vector<double>::const_iterator itShift = move.begin();
  std::vector<double>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itShift)
    {
      *itOut = *itIn * *itShift;
    }
}

void Borders::setBorderTypeLeft(const size_t & i, const Borders::Type & type)
{
  mBorderTypeLeft[i] = type;
}

const Borders::Type & Borders::getBorderTypeLeft(const size_t & i) const
{
  return mBorderTypeLeft[i];
}

void Borders::setBorderTypeRight(const size_t & i, const Borders::Type & type)
{
  mBorderTypeRight[i] = type;
}

const Borders::Type & Borders::getBorderTypeRight(const size_t & i) const
{
  return mBorderTypeRight[i];
}
