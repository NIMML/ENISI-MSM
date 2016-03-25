/*
 * Borders.cpp
 *
 *  Created on: Mar 18, 2016
 *      Author: shoops
 */

#include "Borders.h"

using namespace ENISI;

// static
const char* Borders::TypeNames[] = {"REFLECT", "WRAP", "STICKY", "PERMIABLE", NULL};

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

int Borders::distanceFromBorder(const std::vector<int>& pt,
                                const Borders::Coodinate &coordinate,
                                const Borders::Side & side)
{
  int border = _dimensions.origin()[coordinate] + (side == LOW) ? 0 : _dimensions.extents()[coordinate];
  return abs(border - pt[coordinate]);
}

double Borders::distanceFromBorder(const std::vector<double>& pt,
                                   const Borders::Coodinate & coordinate,
                                   const Borders::Side & side)
{
  double border = _dimensions.origin()[coordinate] + (side == LOW) ? 0 : _dimensions.extents()[coordinate];
  return abs(border - pt[coordinate]);
}

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
            *itState = OUT_LOW;
            inBounds = false;
          }
        else
          {
            *itState = INBOUND;
          }
      else if (*itPt >= *itOrigin + *itExtend)
        if (*itTypeRight == PERMIABLE || *itTypeLeft == STICKY)
          {
            *itState = OUT_HIGH;
            inBounds = false;
          }
        else
          {
            *itState = INBOUND;
          }
      else
        {
          *itState = INBOUND;
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
            *itState = OUT_LOW;
            inBounds = false;
          }
        else
          {
            *itState = INBOUND;
          }
      else if (*itPt >= *itOrigin + *itExtend)
        if (*itTypeRight == PERMIABLE || *itTypeLeft == STICKY)
          {
            *itState = OUT_HIGH;
            inBounds = false;
          }
        else
          {
            *itState = INBOUND;
          }
      else
        {
          *itState = INBOUND;
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
              *itOut = *itOrigin;
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
  std::vector<int>::const_iterator itMove = move.begin();
  std::vector<int>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itMove)
    {
      *itOut = *itIn + *itMove;
    }
}


void Borders::translate(const std::vector<double>& in, std::vector<double>& out, const std::vector<double>& move) const
{
  std::vector<double>::const_iterator itIn = in.begin();
  std::vector<double>::const_iterator endIn = in.end();
  std::vector<double>::const_iterator itMove = move.begin();
  std::vector<double>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itMove)
    {
      *itOut = *itIn + *itMove;
    }
}

void Borders::setBorderType(const Borders::Coodinate &coordinate, const Borders::Side & side, const Borders::Type & type)
{
  switch (side)
  {
    case LOW:
      mBorderTypeLeft[coordinate] = type;
      break;

    case HIGH:
      mBorderTypeRight[coordinate] = type;
      break;
  }
}

const Borders::Type & Borders::getBorderType(const Borders::Coodinate &coordinate, const Borders::Side & side) const
{
  switch (side)
  {
    case LOW:
      return mBorderTypeLeft[coordinate];
      break;

    case HIGH:
      return mBorderTypeRight[coordinate];
      break;
  }
}

