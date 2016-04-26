/*
 * SharedValueLayer.cpp
 *
 *  Created on: Mar 28, 2016
 *      Author: shoops
 */

#include <limits>

#include "SharedValueLayer.h"

#include "compartment/Compartment.h"
#include "Cytokine.h"
#include "DataWriter/LocalFile.h"

// #define DEBUG_SHARED

using namespace ENISI;

SharedValueLayer::SharedValueLayer(const Type & type, const int & state, const size_t & valueSize):
  Agent(type, state),
  mValueSize(valueSize),
  mOrigin(0, 0),
  mShape(0, 0),
  mpLocalValues(NULL),
  mBufferValues()
{
  const repast::GridDimensions & GridDimensions = Compartment::instance((Compartment::Type) state)->localGridDimensions();

  mOrigin[0] = round(GridDimensions.origin(0));
  mOrigin[1] = round(GridDimensions.origin(1));
  mShape[0] = round(GridDimensions.extents(0));
  mShape[1] = round(GridDimensions.extents(1));

  mpLocalValues = new LocalValues(repast::Point< int >(mShape[0] + 2, mShape[1] + 2),
                                  std::vector< double >(mValueSize, std::numeric_limits< double >::quiet_NaN()));
}

SharedValueLayer::SharedValueLayer(const int & id, const int & startProc, const int & agentType, const int & currentProc, const int & state,
                                   const repast::Point< int > & origin, const SharedValueLayer::BufferValues & bufferValues):
  Agent(id, startProc, agentType, currentProc, state),
  mValueSize(bufferValues.find(std::vector< int>(2, 0))->second.size()),
  mOrigin(origin),
  mShape(0, 0),
  mpLocalValues(NULL),
  mBufferValues(bufferValues)
{
  const repast::GridDimensions & GridDimensions = Compartment::instance((Compartment::Type) state)->localGridDimensions();

  mShape[0] = round(GridDimensions.extents(0));
  mShape[1] = round(GridDimensions.extents(1));
}

SharedValueLayer::~SharedValueLayer()
{
  if (mpLocalValues != NULL) delete mpLocalValues;
}

// virtual
void SharedValueLayer::write(std::ostream & o, const std::string & separator, Compartment * pCompartment)
{
  const repast::GridDimensions Dimensions = pCompartment->localSpaceDimensions();
  double delta = Dimensions.extents(0) / mShape[0];

  std::vector< Cytokine * >::const_iterator itCytokine = pCompartment->getCytokines().begin();
  std::vector< Cytokine * >::const_iterator endCytokine = pCompartment->getCytokines().end();

  for (int k = 0; itCytokine != endCytokine; ++itCytokine, ++k)
    {
#ifdef DEBUG_SHARED
      repast::Point< int > Origin(0, 0);
      repast::Point< int > Shape(mShape[0] + 2, mShape[1] + 2);
#else
      repast::Point< int > Origin(1, 1);
      repast::Point< int > Shape(mShape[0], mShape[1]);
#endif

      o << (*itCytokine)->getName() << std::endl;

      for (int i = Origin[0], imax = Shape[0]; i < imax; ++i)
        {
          o << separator << Dimensions.origin(0) + (i - 1) * delta;
        }

      o << std::endl;

      Iterator itPoint(Origin, Shape);

      for (int j = Origin[1], jmax = Shape[1]; j < jmax; ++j)
        {
          o << Dimensions.origin(1) + (j - 1) * delta;

          for (int i = Origin[0], imax = Shape[0]; i < imax; ++i, itPoint.next())
            {
              o << separator << mpLocalValues->operator[](*itPoint)[k];
            }

          o << std::endl;
        }

      o << std::endl;
    }
}

bool SharedValueLayer::contains(const repast::Point< int > & pt) const
{
  return mOrigin[0] - 1 <= pt[0]
         && pt[0] < mOrigin[0] + mShape[0] + 1
         && mOrigin[1] - 1 <= pt[1]
         && pt[1] < mOrigin[1] + mShape[1] + 1;
}


std::vector< double > & SharedValueLayer::operator[](const repast::Point< int > location)
{

  if (mpLocalValues != NULL)
    {
      return mpLocalValues->operator[](repast::Point< int >(location[0] - mOrigin[0] + 1, location[1] - mOrigin[1] + 1));
    }

  throw std::runtime_error("cytokine value not found: no local values defined");

  static std::vector< double > NaN(mShape.dimensionCount(), std::numeric_limits< double >::quiet_NaN());
  return NaN;
}

std::vector< double > * SharedValueLayer::tryLocation(const repast::Point< int > location)
{
  BufferValues::iterator found = mBufferValues.find(repast::Point< int >(location[0] - mOrigin[0], location[1] - mOrigin[1]).coords());

  if (found != mBufferValues.end())
    {
      return &found->second;
    }

  return NULL;
}

const repast::Point< int > & SharedValueLayer::origin() const
{
  return mOrigin;
}

const repast::Point< int > & SharedValueLayer::shape() const
{
  return mShape;
}

SharedValueLayer::LocalValues * SharedValueLayer::getLocalValues()
{
  return mpLocalValues;
}

void SharedValueLayer::getBufferValues(repast::Point< int > & origin,
                                       SharedValueLayer::BufferValues & bufferValues) const

{
  origin = mOrigin;

  // North border
  repast::Point< int > LocalIndex(1, 1);
  std::vector< int > RemoteIndex(2, 0);

  for (size_t i = 0, imax = mShape[0]; i < imax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }

  // South border
  LocalIndex = repast::Point< int >(1, mShape[1]);
  RemoteIndex = repast::Point< int >(0, mShape[1] - 1).coords();

  for (size_t i = 0, imax = mShape[0]; i < imax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }

  // East border
  LocalIndex = repast::Point< int >(1, 1);
  RemoteIndex = repast::Point< int >(0, 0).coords();

  for (size_t i = 0, imax = mShape[1]; i < imax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }

  // West border
  LocalIndex = repast::Point< int >(mShape[0], 1);
  RemoteIndex = repast::Point< int >(mShape[0] - 1, 0).coords();

  for (size_t i = 0, imax = mShape[1]; i < imax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }
}

void SharedValueLayer::updateBufferValues(const SharedValueLayer & neighbor,
    const Borders & globalBorders)
{

  const repast::Point< int > & origin = neighbor.mOrigin;
  const BufferValues & bufferValues = neighbor.mBufferValues;

  // LocalFile::debug() << "receiving: " << origin << std::endl;
  BufferValues::const_iterator it = bufferValues.begin();
  BufferValues::const_iterator end = bufferValues.end();

  for (; it != end; ++it)
    {
       // LocalFile::debug() << origin[0] + it->first[0] << ", " << origin[1] + it->first[1] << std::endl;
    }

  // Currently only 2D
  std::vector<Borders::BoundState> BoundState(2, Borders::INBOUND);

  std::vector< int > OutLow(2, 0);
  std::vector< int > OutHigh(2, 0);
  globalBorders.transform(repast::Point< int >(mOrigin[0] - mShape[0], mOrigin[1] - mShape[1]).coords(), OutLow);
  globalBorders.transform(repast::Point< int >(mOrigin[0] + mShape[0], mOrigin[1] + mShape[1]).coords(), OutHigh);

  for (int i = 0; i < 2; i++)
    {
      if (origin[i] == mOrigin[i])
        {
          BoundState[i] = Borders::INBOUND;
        }
      else if (origin[i] == OutLow[i] &&
               origin[i] == OutHigh[i])
        {
          BoundState[i] = Borders::OUT_BOTH;
        }
      else if (origin[i] == OutLow[i])
        {
          BoundState[i] = Borders::OUT_LOW;
        }
      else if (origin[i] == OutHigh[i])
        {
          BoundState[i] = Borders::OUT_HIGH;
        }
      else
        {
          // The provided information is not needed!
          return;
        }
    }

  repast::Point< int > LocalIndex(1, 1);
  std::vector< int > RemoteIndex(2, 0);

  if (BoundState[0] == Borders::OUT_LOW ||
      BoundState[0] == Borders::OUT_BOTH)
    {
      LocalIndex[0] = 0;
      RemoteIndex[0] = mShape[0] - 1;

      if (BoundState[1] == Borders::OUT_LOW ||
          BoundState[1] == Borders::OUT_BOTH)
        {
          LocalIndex[1] = 0;
          RemoteIndex[1] = mShape[1] - 1;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }

      if (BoundState[1] == Borders::INBOUND)
        {
          LocalIndex[1] = 1;
          RemoteIndex[1] = 0;

          for (size_t i = 0, imax = mShape[1]; i < imax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
        }

      if (BoundState[1] == Borders::OUT_HIGH ||
          BoundState[1] == Borders::OUT_BOTH)
        {
          LocalIndex[1] = mShape[1] + 1;
          RemoteIndex[1] = 0;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
    }

  if (BoundState[0] == Borders::INBOUND)
    {
      LocalIndex[0] = 1;
      RemoteIndex[0] = 0;

      if (BoundState[1] == Borders::OUT_LOW ||
          BoundState[1] == Borders::OUT_BOTH)
        {
          LocalIndex[1] = 0;
          RemoteIndex[1] = mShape[1] - 1;

          for (size_t i = 0, imax = mShape[0]; i < imax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
        }

      if (BoundState[1] == Borders::INBOUND)
        {
          // Local information is never changed
          return;
        }

      if (BoundState[1] == Borders::OUT_HIGH ||
          BoundState[1] == Borders::OUT_BOTH)
        {
          LocalIndex[1] = mShape[1] + 1;
          RemoteIndex[1] = 0;

          for (size_t i = 0, imax = mShape[0]; i < imax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
        }
    }

  if (BoundState[0] == Borders::OUT_HIGH ||
      BoundState[0] == Borders::OUT_BOTH)
    {
      LocalIndex[0] = mShape[0] + 1;
      RemoteIndex[0] = 0;

      if (BoundState[1] == Borders::OUT_LOW ||
          BoundState[1] == Borders::OUT_BOTH)
        {
          LocalIndex[1] = 0;
          RemoteIndex[1] = mShape[1] - 1;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          LocalIndex[1] = 1;
          RemoteIndex[1] = 0;

          for (size_t i = 0, imax = mShape[1]; i < imax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }

          return;
        }
      else if (BoundState[1] == Borders::OUT_HIGH ||
               BoundState[1] == Borders::OUT_BOTH)
        {
          LocalIndex[1] = mShape[1] + 1;
          RemoteIndex[1] = 0;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
    }
}

void SharedValueLayer::completeBufferValues(const Borders & globalBorders)
{
  // Currently only 2D
  repast::Point< int > Origin(0, 0);
  repast::Point< int > Shape(mShape[0] + 2, mShape[1] + 2);

  std::vector< int > Low(2, 0);
  Low[Borders::X] = mOrigin[Borders::X];
  Low[Borders::Y] = mOrigin[Borders::Y];

  std::vector< int > High(2, 0);
  High[Borders::X] = mOrigin[Borders::X] + mShape[Borders::X] - 1;
  High[Borders::Y] = mOrigin[Borders::Y] + mShape[Borders::Y] - 1;

  // TODO CRITICAL It is possible that we have WRAP and we are our own neighbor.

  if (globalBorders.getBorderType(Borders::X, Borders::LOW) != Borders::WRAP &&
      globalBorders.distanceFromBorder(Low, Borders::X, Borders::LOW) < 0.5)
    {
      std::vector< int > Boundary(2, 0);
      Boundary[Borders::X] = 0;
      Boundary[Borders::Y] = 0;

      std::vector< int > Value(2, 0);
      Value[Borders::X] = 1;
      Value[Borders::Y] = 0;

      size_t i = 0, imax = Shape[Borders::Y];

      for (; i < imax; i++, Boundary[Borders::Y]++, Value[Borders::Y]++)
        {
          mpLocalValues->operator [](Boundary) = mpLocalValues->operator [](Value);
        }
    }

  if (globalBorders.getBorderType(Borders::X, Borders::HIGH) != Borders::WRAP &&
      globalBorders.distanceFromBorder(High, Borders::X, Borders::HIGH) < 1.5)
    {
      std::vector< int > Boundary(2, 0);
      Boundary[Borders::X] = Shape[Borders::X] - 1;
      Boundary[Borders::Y] = 0;

      std::vector< int > Value(2, 0);
      Value[Borders::X] =  Shape[Borders::X] - 2;
      Value[Borders::Y] = 0;

      size_t i = 0, imax = Shape[Borders::Y];

      for (; i < imax; i++, Boundary[Borders::Y]++, Value[Borders::Y]++)
        {
          mpLocalValues->operator [](Boundary) = mpLocalValues->operator [](Value);
        }
    }

  if (globalBorders.getBorderType(Borders::Y, Borders::LOW) != Borders::WRAP &&
      globalBorders.distanceFromBorder(Low, Borders::Y, Borders::LOW) < 0.5)
    {
      std::vector< int > Boundary(2, 0);
      Boundary[Borders::X] = 0;
      Boundary[Borders::Y] = 0;

      std::vector< int > Value(2, 0);
      Value[Borders::X] = 0;
      Value[Borders::Y] = 1;

      size_t i = 0, imax = Shape[Borders::X];

      for (; i < imax; i++, Boundary[Borders::X]++, Value[Borders::X]++)
        {
          mpLocalValues->operator [](Boundary) = mpLocalValues->operator [](Value);
        }
    }

  if (globalBorders.getBorderType(Borders::Y, Borders::HIGH) != Borders::WRAP &&
      globalBorders.distanceFromBorder(High, Borders::Y, Borders::HIGH) < 1.5)
    {
      std::vector< int > Boundary(2, 0);
      Boundary[Borders::X] = 0;
      Boundary[Borders::Y] = Shape[Borders::Y] - 1;

      std::vector< int > Value(2, 0);
      Value[Borders::X] = 0;
      Value[Borders::Y] = Shape[Borders::Y] - 2;

      size_t i = 0, imax = Shape[Borders::X];

      for (; i < imax; i++, Boundary[Borders::X]++, Value[Borders::X]++)
        {
          mpLocalValues->operator [](Boundary) = mpLocalValues->operator [](Value);
        }
    }
}

void SharedValueLayer::setBufferValues(const repast::Point< int > & origin,
                                       const BufferValues & bufferValues)
{
  assert(mOrigin == origin);

  mBufferValues = bufferValues;
}
