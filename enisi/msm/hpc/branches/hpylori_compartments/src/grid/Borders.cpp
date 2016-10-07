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
  mBorderType(d.dimensionCount(), std::vector< Type >(2, WRAP))
{}

// virtual
Borders::~Borders()
{}

int Borders::distanceFromBorder(const std::vector<int>& pt,
                                const Borders::Coodinate &coordinate,
                                const Borders::Side & side) const
{
  if (mBorderType[coordinate][side] == WRAP) return std::numeric_limits< int >::infinity();

  int border = _dimensions.origin()[coordinate] + (side == LOW) ? 0 : _dimensions.extents()[coordinate];
  return (side == LOW) ? pt[coordinate] - border : border - pt[coordinate];
}

double Borders::distanceFromBorder(const std::vector<double> & pt,
                                   const Borders::Coodinate & coordinate,
                                   const Borders::Side & side) const
{
  if (mBorderType[coordinate][side] == WRAP) return std::numeric_limits< double >::infinity();

  double border = _dimensions.origin()[coordinate] + (side == LOW) ? 0 : _dimensions.extents()[coordinate];
  return (side == LOW) ? pt[coordinate] - border : border - pt[coordinate];
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

  std::vector< std::vector< Type > >::const_iterator itType = mBorderType.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<int>::const_iterator itPt = pt.begin();

  for (; itState != endState; ++itState, ++itType, ++itOrigin, ++itExtend, ++itPt)
    {
      const std::vector< Type > & Type = *itType;

      if (*itPt < *itOrigin)
        if (Type[LOW] == PERMIABLE || Type[LOW] == STICKY)
          {
            *itState = OUT_LOW;
            inBounds = false;
          }
        else
          {
            *itState = INBOUND;
          }
      else if (*itPt >= *itOrigin + *itExtend)
        if (Type[HIGH] == PERMIABLE || Type[HIGH] == STICKY)
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

  std::vector< std::vector< Type > >::const_iterator itType = mBorderType.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<double>::const_iterator itPt = pt.begin();

  for (; itState != endState; ++itState, ++itType, ++itOrigin, ++itExtend, ++itPt)
    {
      const std::vector< Type > & Type = *itType;

      if (*itPt < *itOrigin)
        if (Type[LOW] != WRAP)
          {
            *itState = OUT_LOW;
            inBounds = false;
          }
        else
          {
            *itState = INBOUND;
          }
      else if (*itPt >= *itOrigin + *itExtend)
        if (Type[HIGH] != WRAP)
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
  std::vector< std::vector< Type > >::const_iterator itType = mBorderType.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<int>::const_iterator itIn = in.begin();
  std::vector<int>::const_iterator endIn = in.end();
  std::vector<int>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itType, ++itOrigin, ++itExtend)
    {
      const std::vector< Type > & Type = *itType;

      if (*itIn < *itOrigin)
        {
          switch (Type[LOW])
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
          switch (Type[HIGH])
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
  std::vector< std::vector< Type > >::const_iterator itType = mBorderType.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<double>::const_iterator itIn = in.begin();
  std::vector<double>::const_iterator endIn = in.end();
  std::vector<double>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itType, ++itOrigin, ++itExtend)
    {
      const std::vector< Type > & Type = *itType;

      if (*itIn < *itOrigin)
        {
          switch (Type[LOW])
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
          switch (Type[HIGH])
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

void Borders::transform(std::vector<int>& pt) const
{
  std::vector< std::vector< Type > >::const_iterator itType = mBorderType.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<int>::iterator it = pt.begin();
  std::vector<int>::iterator end = pt.end();
  int tmp;

  for (; it != end; ++it, ++itType, ++itOrigin, ++itExtend)
    {
      const std::vector< Type > & Type = *itType;

      if (*it < *itOrigin)
        {
          switch (Type[LOW])
          {
            case REFLECT:
              tmp = fmod(*itOrigin - *it, 2.0 * *itExtend);

              if (tmp < *itExtend)
                *it = *itOrigin + tmp;
              else
                *it = *itOrigin + 2.0 * *itExtend - tmp;
              break;

            case WRAP:
              *it = *itOrigin + *itExtend - fmod(*itOrigin - *it, *itExtend);
              break;

            case STICKY:
              *it = *itOrigin;
              break;

            case PERMIABLE:
              break;
          }
        }
      else if (*it >= *itOrigin + *itExtend)
        {
          switch (Type[HIGH])
          {
            case REFLECT:
              tmp = fmod(*it - *itOrigin - *itExtend, 2.0 * *itExtend);

              if (tmp < *itExtend)
                *it = *itOrigin + *itExtend - tmp;
              else
                *it = *itOrigin + tmp - *itExtend;

              break;

            case WRAP:
              *it = *itOrigin + fmod(*it - *itOrigin - *itExtend, *itExtend);
              break;

            case STICKY:
              *it = *itOrigin + *itExtend;
              break;

            case PERMIABLE:
              break;
          }
        }
    }
}

void Borders::transform(std::vector<double>& pt) const
{
  std::vector< std::vector< Type > >::const_iterator itType = mBorderType.begin();

  std::vector<double>::const_iterator itOrigin = _dimensions.origin().begin();
  std::vector<double>::const_iterator itExtend = _dimensions.extents().begin();

  std::vector<double>::iterator it = pt.begin();
  std::vector<double>::iterator end = pt.end();
  double tmp;

  for (; it != end; ++it, ++itType, ++itOrigin, ++itExtend)
    {
      const std::vector< Type > & Type = *itType;

      if (*it < *itOrigin)
        {
          switch (Type[LOW])
          {
            case REFLECT:
              tmp = fmod(*itOrigin - *it, 2.0 * *itExtend);

              if (tmp < *itExtend)
                *it = *itOrigin + tmp;
              else
                *it = *itOrigin + 2.0 * *itExtend - tmp;

              break;

            case WRAP:
              *it = *itOrigin + *itExtend - fmod(*itOrigin - *it, *itExtend);
              break;

            case STICKY:
              *it = *itOrigin;
              break;

            case PERMIABLE:
              break;
          }
        }
      else if (*it >= *itOrigin + *itExtend)
        {
          switch (Type[HIGH])
          {
            case REFLECT:
              tmp = fmod(*it - *itOrigin - *itExtend, 2.0 * *itExtend);

              if (tmp < *itExtend)
                *it = *itOrigin + *itExtend - tmp;
              else
                *it = *itOrigin + tmp - *itExtend;

              break;

            case WRAP:
              *it = *itOrigin + fmod(*it - *itOrigin - *itExtend, *itExtend);
              break;

            case STICKY:
              *it = *itOrigin + *itExtend;
              break;

            case PERMIABLE:
              break;
          }
        }
    }
}

void Borders::translate(const std::vector<int>& in, std::vector<int>& out, const std::vector<int>& move) const
{
  assert(in.size() == move.size());

  if (out.size() != in.size())
    {
      out.resize(in.size());
    }

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
  assert(in.size() == move.size());

  if (out.size() != in.size())
    {
      out.resize(in.size());
    }

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
  mBorderType[coordinate][side] = type;
}

const Borders::Type & Borders::getBorderType(const Borders::Coodinate &coordinate, const Borders::Side & side) const
{
  return mBorderType[coordinate][side];
}

bool Borders::isPeriodic() const
{
  return true;
}

SimpleBorders::SimpleBorders():
  repast::Borders(repast::GridDimensions())
{}

SimpleBorders::SimpleBorders(repast::GridDimensions d):
  repast::Borders(d)
{}
// virtual
SimpleBorders::~SimpleBorders()
{}

void SimpleBorders::transform(const std::vector<int>& in, std::vector<int>& out) const
{
  out = in;
}

void SimpleBorders::transform(const std::vector<double>& in, std::vector<double>& out) const
{
  out = in;
}

void SimpleBorders::translate(const std::vector<double>& in, std::vector<double>& out, const std::vector<double>& move) const
{
  assert(in.size() == move.size());

  if (out.size() != in.size())
    {
      out.resize(in.size());
    }

  std::vector<double>::const_iterator itIn = in.begin();
  std::vector<double>::const_iterator endIn = in.end();
  std::vector<double>::const_iterator itMove = move.begin();
  std::vector<double>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itMove)
    {
      *itOut = *itIn + *itMove;
    }
}

void SimpleBorders::translate(const std::vector<int>& in, std::vector<int>& out, const std::vector<int>& move) const
{
  assert(in.size() == move.size());

  if (out.size() != in.size())
    {
      out.resize(in.size());
    }

  std::vector<int>::const_iterator itIn = in.begin();
  std::vector<int>::const_iterator endIn = in.end();
  std::vector<int>::const_iterator itMove = move.begin();
  std::vector<int>::iterator itOut = out.begin();

  for (; itIn != endIn; ++itIn, ++itOut, ++itMove)
    {
      *itOut = *itIn + *itMove;
    }
}

bool SimpleBorders::isPeriodic() const
{
  return true;
}
