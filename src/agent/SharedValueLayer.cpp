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
  mpCompartment(Compartment::instance((Compartment::Type) state)),
  mValueSize(valueSize),
  mOrigin(0, 0),
  mpLocalValues(NULL)
{
  assert (mpCompartment != NULL);

  const repast::GridDimensions & LocalCompartmentDimensions = mpCompartment->localGridDimensions();

  mOrigin[0] = round(LocalCompartmentDimensions.origin(0));
  mOrigin[1] = round(LocalCompartmentDimensions.origin(1));

  repast::GridDimensions ValueLayerDimensions(repast::Point< double >(LocalCompartmentDimensions.origin(0) - 1.0, LocalCompartmentDimensions.origin(1) - 1.0),
                                              repast::Point< double >(LocalCompartmentDimensions.extents(0) + 2.0, LocalCompartmentDimensions.extents(1) + 2.0));

  mpLocalValues = new LocalValues("DiffuserValues", ValueLayerDimensions, true, std::vector< double >(mValueSize, std::numeric_limits< double >::quiet_NaN()));
}

SharedValueLayer::~SharedValueLayer()
{}

std::vector< double > & SharedValueLayer::operator[](const repast::Point< int > location)
{
  return mpLocalValues->operator[](location);
}

void SharedValueLayer::getBufferValues(repast::Point< int > & origin,
                                       SparseMatrix< std::vector< double > > & bufferValues)
{
  origin = mOrigin;

  size_t xLow = mpLocalValues->dimensions().origin(0) + 1;
  size_t xMax = mpLocalValues->dimensions().extents(0) - 2;

  size_t yLow = mpLocalValues->dimensions().origin(1) + 1;
  size_t yMax = mpLocalValues->dimensions().extents(1) - 2;

  repast::Point< int > LocalIndex(xLow, yLow);
  repast::Point< int > RemoteIndex(0, 0);

  for (size_t i = 0; i < xMax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }

  LocalIndex = repast::Point< int >(xLow, yLow + yMax - 1);
  RemoteIndex = repast::Point< int >(0, yMax - 1);

  for (size_t i = 0; i < xMax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }

  LocalIndex = repast::Point< int >(xLow, yLow);
  RemoteIndex = repast::Point< int >(0, 0);

  for (size_t i = 0; i < yMax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }

  LocalIndex = repast::Point< int >(xLow + xMax - 1, yLow);
  RemoteIndex = repast::Point< int >(xMax - 1, 0);

  for (size_t i = 0; i < yMax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
    {
      bufferValues[RemoteIndex] = mpLocalValues->operator[](LocalIndex);
    }
}

void SharedValueLayer::setBufferValues(const repast::Point< int > & origin,
                                       const SparseMatrix< std::vector< double > > & bufferValues)
{
  std::vector<Borders::BoundState> BoundState(2, Borders::INBOUND);
  const Borders * pGlobalBorders = mpCompartment->gridBorders();

  std::vector< int > OutLow(2, 0);
  pGlobalBorders->transform(repast::Point< int >(mOrigin[0] - mpLocalValues->dimensions().extents(0) + 2,
                                                 mOrigin[1] - mpLocalValues->dimensions().extents(1) + 2).coords(), OutLow);
  std::vector< int > OutHigh(2, 0);
  pGlobalBorders->transform(repast::Point< int >(mOrigin[0] + mpLocalValues->dimensions().extents(0) - 2,
                                                 mOrigin[1] + mpLocalValues->dimensions().extents(1) - 2).coords(), OutHigh);

  for (int i = 0; i < 2; i++)
    {
      if (origin[i] == mOrigin[i])
        {
          BoundState[i] = Borders::INBOUND;
        }
      else if (origin[i] == mOrigin[i] - mpLocalValues->dimensions().extents(i) + 2 ||
               origin[i] == OutLow[i])
        {
          BoundState[i] = Borders::OUT_LOW;
        }
      else if (origin[i] == mOrigin[i] + mpLocalValues->dimensions().extents(i) - 2 ||
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

  size_t xMax = mpLocalValues->dimensions().extents(0) - 2;
  size_t yMax = mpLocalValues->dimensions().extents(1) - 2;

  repast::Point< int > LocalIndex(mOrigin);
  repast::Point< int > RemoteIndex(0, 0);

  if (BoundState[0] == Borders::OUT_LOW)
    {
      LocalIndex[0] -= 1;
      RemoteIndex[0] += xMax - 1;

      if (BoundState[1] == Borders::OUT_LOW)
        {
          LocalIndex[1] -= 1;
          RemoteIndex[1] += yMax - 1;

          mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          // LocalIndex[1] = mOrigin[0];
          // RemoteIndex[1] = 0;

          for (size_t i = 0; i < yMax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
            }
        }
      else if (BoundState[1] == Borders::OUT_HIGH)
        {
          LocalIndex[1] += yMax;
          RemoteIndex[1] = 0;

          mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
        }
    }
  else if (BoundState[0] == Borders::INBOUND)
    {
      // LocalIndex[0] = mOrigin[0];
      // RemoteIndex[0] = 0;

      if (BoundState[1] == Borders::OUT_LOW)
        {
          LocalIndex[1] -= 1;
          RemoteIndex[1] += yMax - 1;

          for (size_t i = 0; i < xMax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
            }
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          // Local information is never changed
          return;
        }
      else if (BoundState[1] == Borders::OUT_HIGH)
        {
          LocalIndex[1] += yMax;
          RemoteIndex[1] = 0;

          for (size_t i = 0; i < xMax; ++i, LocalIndex[0]++, RemoteIndex[0]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
            }
        }
    }
  else if (BoundState[0] == Borders::OUT_HIGH)
    {
      LocalIndex[0] += xMax;
      RemoteIndex[0] = 0;

      if (BoundState[1] == Borders::OUT_LOW)
        {
          LocalIndex[1] -= 1;
          RemoteIndex[1] += yMax - 1;

          mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
        }
      else if (BoundState[1] == Borders::INBOUND)
        {
          // LocalIndex[1] = mOrigin[0];
          // RemoteIndex[1] = 0;

          for (size_t i = 0; i < yMax; ++i, LocalIndex[1]++, RemoteIndex[1]++)
            {
              mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
            }
          return;
        }
      else if (BoundState[1] == Borders::OUT_HIGH)
        {
          LocalIndex[1] += yMax;
          RemoteIndex[1] = 0;

          mpLocalValues->operator[](LocalIndex) = bufferValues[RemoteIndex];
        }
    }
}

