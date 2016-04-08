/*
 * SharedValueLayer.cpp
 *
 *  Created on: Mar 28, 2016
 *      Author: shoops
 */

#include <limits>

#include "SharedValueLayer.h"

#include "compartment/Compartment.h"

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

std::vector< double > & SharedValueLayer::operator[](const repast::Point< int > location)
{

  if (mpLocalValues != NULL)
    {
      return mpLocalValues->operator[](repast::Point< int >(location[0] - mOrigin[0] + 1, location[1] - mOrigin[1] + 1));
    }

  throw std::runtime_error("cytokine value not found");

  static std::vector< double > NaN(mShape.dimensionCount(), std::numeric_limits< double >::quiet_NaN());
  return NaN;
}

std::vector< double > * SharedValueLayer::tryLocation(const repast::Point< int > location)
{

  BufferValues::iterator found = mBufferValues.find(repast::Point< int >(location[0] - mOrigin[0] + 1, location[1] - mOrigin[1] + 1).coords());

  if (found != mBufferValues.end())
    {
      return &found->second;
    }

  return NULL;
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
      else if (origin[i] == mOrigin[i] - mShape[i] ||
               origin[i] == OutLow[i])
        {
          BoundState[i] = Borders::OUT_LOW;
        }
      else if (origin[i] == mOrigin[i] + mShape[i] ||
               origin[i] == OutHigh[i])
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

  if (BoundState[0] == Borders::OUT_LOW)
    {
      LocalIndex[0] -= 1;
      RemoteIndex[0] += mShape[0] - 1;

      if (BoundState[1] == Borders::OUT_LOW)
        {
          LocalIndex[1] -= 1;
          RemoteIndex[1] += mShape[1] - 1;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          // LocalIndex[1] = 1;
          // RemoteIndex[1] = 0;

          for (size_t i = 0, imax = mShape[1]; i < imax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
        }
      else if (BoundState[1] == Borders::OUT_HIGH)
        {
          LocalIndex[1] += mShape[1];
          RemoteIndex[1] = 0;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
    }
  else if (BoundState[0] == Borders::INBOUND)
    {
      // LocalIndex[0] = 1;
      // RemoteIndex[0] = 0;

      if (BoundState[1] == Borders::OUT_LOW)
        {
          LocalIndex[1] -= 1;
          RemoteIndex[1] += mShape[1] - 1;

          for (size_t i = 0, imax = mShape[0]; i < imax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          // Local information is never changed
          return;
        }
      else if (BoundState[1] == Borders::OUT_HIGH)
        {
          LocalIndex[1] += mShape[1];
          RemoteIndex[1] = 0;

          for (size_t i = 0, imax = mShape[0]; i < imax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
        }
    }
  else if (BoundState[0] == Borders::OUT_HIGH)
    {
      LocalIndex[0] += mShape[0];
      RemoteIndex[0] = 0;

      if (BoundState[1] == Borders::OUT_LOW)
        {
          LocalIndex[1] -= 1;
          RemoteIndex[1] += mShape[1] - 1;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          // LocalIndex[1] = 1;
          // RemoteIndex[1] = 0;

          for (size_t i = 0, imax = mShape[1]; i < imax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
            }
          return;
        }
      else if (BoundState[1] == Borders::OUT_HIGH)
        {
          LocalIndex[1] += mShape[1];
          RemoteIndex[1] = 0;

          mpLocalValues->operator[](LocalIndex) = bufferValues.find(RemoteIndex)->second;
        }
    }
}

void SharedValueLayer::setBufferValues(const repast::Point< int > & origin,
                                       const BufferValues & bufferValues)
{
  assert (mOrigin == origin);

  mBufferValues = bufferValues;
}

