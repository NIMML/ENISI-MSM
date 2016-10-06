#include "DiffuserImpl.h"
#include "compartment/Compartment.h"
#include "agent/Cytokine.h"
#include "DataWriter/LocalFile.h"

using namespace ENISI;

/* DiffuserImpl */
/* static public variables */
const double DiffuserImpl::DEFAULT_MAX = 0x7FFF;
const double DiffuserImpl::DEFAULT_MIN = -DiffuserImpl::DEFAULT_MAX;

/* static private variables */

DiffuserImpl::~DiffuserImpl()
{}

DiffuserImpl::DiffuserImpl(Compartment * pCompartment) :
  mpCompartment(pCompartment),
  mCytokines(pCompartment->getCytokines()),
  mDeltaT(1.0),
  mShape(std::vector< int >(mpCompartment->spaceDimensions().dimensionCount(), 2)),
  mpNewValues(NULL),
  mpCurrentValues(NULL),
  mpDiffuserData(mpCompartment->getDiffuserData())
{
  mShape = mpDiffuserData->getLocalValues()->shape();

  mpCurrentValues = mpDiffuserData->getLocalValues();
  mpNewValues = new DenseMatrix< std::vector< double > >(mShape, std::vector< double >(pCompartment->getCytokines().size(), 0.0));

  // Calculate the maximal time step (mDeltaT)
  std::vector< Cytokine * >::const_iterator it = mCytokines.begin();
  std::vector< Cytokine * >::const_iterator end = mCytokines.end();

  for (; it != end; ++it)
    {
      double tmp = 1.0/((*it)->getDegradation() + 2.0 * (*it)->getDiffusion() * mShape.dimensionCount());

      if (tmp < mDeltaT)
        {
          mDeltaT = tmp;
        }
    }
}

void DiffuserImpl::computeVals1D(const double & deltaT)
{
  Iterator itPoint(repast::Point< int >(std::vector< int >(mShape.dimensionCount(), 0)), mShape);

  std::vector< double > * pOldValueE = &mpCurrentValues->operator [](*itPoint);
  itPoint.next();
  std::vector< double > * pOldValue = &mpCurrentValues->operator [](*itPoint);
  std::vector< double > * pNewValue = &mpNewValues->operator [](*itPoint);
  itPoint.next();
  std::vector< double > * pOldValueW = &mpCurrentValues->operator [](*itPoint);

  while (itPoint)
    {
      std::vector< Cytokine * >::const_iterator it = mCytokines.begin();
      std::vector< Cytokine * >::const_iterator end = mCytokines.end();

      std::vector< double >::const_iterator itOldValueE = pOldValueE->begin();
      std::vector< double >::const_iterator itOldValue = pOldValue->begin();
      std::vector< double >::const_iterator itOldValueW = pOldValueW->begin();
      std::vector< double >::iterator itNewValue = pNewValue->begin();

      // Boundaries are marked by NaN values;
      if (std::isnan(*itOldValueE)) itOldValueE = itOldValue;
      if (std::isnan(*itOldValueW)) itOldValueW = itOldValue;

      for (; it != end; ++it, ++itOldValueE, ++itOldValue, ++itOldValueW, ++itNewValue)
        {
          *itNewValue = deltaT * (*it)->getDiffusion() * (*itOldValueE + *itOldValueW) + (1.0 - deltaT * ((*it)->getDegradation() + 2.0 * (*it)->getDiffusion())) * *itOldValue;
        }

      pNewValue = &mpNewValues->operator [](*itPoint);

      itPoint.next();

      pOldValueE = pOldValue;
      pOldValue = pOldValueW;
      pOldValueW = &mpCurrentValues->operator [](*itPoint);
    }

  // Swap current and new values
  DenseMatrix< std::vector< double > > * pTmp = mpCurrentValues;
  mpCurrentValues = mpNewValues;
  mpNewValues = pTmp;
}

void DiffuserImpl::computeVals2D(const double & deltaT)
{
  *mpNewValues = *mpCurrentValues;

  Iterator itNorth(repast::Point< int >(std::vector< int >(mShape.dimensionCount(), 0)), mShape);

  std::vector< double > * pOldValueNE = &mpCurrentValues->operator [](*itNorth);
  itNorth.next();
  std::vector< double > * pOldValueN = &mpCurrentValues->operator [](*itNorth);
  itNorth.next();
  std::vector< double > * pOldValueNW = &mpCurrentValues->operator [](*itNorth);

  Iterator itPoint(repast::Point< int >(std::vector< int >(mShape.dimensionCount(), 0)), mShape);
  itPoint.next(1); // Move 1 row down

  std::vector< double > * pOldValueE = &mpCurrentValues->operator [](*itPoint);
  itPoint.next();
  std::vector< double > * pOldValue = &mpCurrentValues->operator [](*itPoint);
  std::vector< double > * pNewValue = &mpNewValues->operator [](*itPoint);
  itPoint.next();
  std::vector< double > * pOldValueW = &mpCurrentValues->operator [](*itPoint);

  Iterator itSouth(repast::Point< int >(std::vector< int >(mShape.dimensionCount(), 0)), mShape);
  itSouth.next(1); itSouth.next(1); // Move 2 rows down

  std::vector< double > * pOldValueSE = &mpCurrentValues->operator [](*itSouth);
  itSouth.next();
  std::vector< double > * pOldValueS = &mpCurrentValues->operator [](*itSouth);
  itSouth.next();
  std::vector< double > * pOldValueSW = &mpCurrentValues->operator [](*itSouth);

  while (itSouth)
    {
      std::vector< Cytokine * >::const_iterator it = mCytokines.begin();
      std::vector< Cytokine * >::const_iterator end = mCytokines.end();

      std::vector< double >::const_iterator itOldValueE = pOldValueE->begin();
      std::vector< double >::const_iterator itOldValue = pOldValue->begin();
      std::vector< double >::const_iterator itOldValueW = pOldValueW->begin();
      std::vector< double >::iterator itNewValue = pNewValue->begin();

      // Boundaries are marked by NaN values;
      if (std::isnan(*itOldValueE)) itOldValueE = itOldValue;
      if (std::isnan(*itOldValueW)) itOldValueW = itOldValue;


      std::vector< double >::const_iterator itOldValueNE = pOldValueNE->begin();
      std::vector< double >::const_iterator itOldValueN = pOldValueN->begin();
      std::vector< double >::const_iterator itOldValueNW = pOldValueNW->begin();

      // Boundaries are marked by NaN values;
      if (std::isnan(*itOldValueN)) itOldValueN = itOldValue;
      if (std::isnan(*itOldValueNE)) itOldValueNE = itOldValueE;
      if (std::isnan(*itOldValueNE)) itOldValueNE = itOldValueN;
      if (std::isnan(*itOldValueNW)) itOldValueNW = itOldValueW;
      if (std::isnan(*itOldValueNW)) itOldValueNW = itOldValueN;

      std::vector< double >::const_iterator itOldValueSE = pOldValueSE->begin();
      std::vector< double >::const_iterator itOldValueS = pOldValueS->begin();
      std::vector< double >::const_iterator itOldValueSW = pOldValueSW->begin();

      for (; it != end; ++it, ++itOldValueNE, ++itOldValueN, ++itOldValueNW, ++itOldValueE, ++itOldValue, ++itOldValueW, ++itOldValueSE, ++itOldValueS, ++itOldValueSW, ++itNewValue)
        {
          double Average = (*itOldValueNE + *itOldValueNW + *itOldValueSE + *itOldValueSW + 4.0 * (*itOldValueN + *itOldValueE + *itOldValueW  + *itOldValueS)) * 0.3;
          *itNewValue = deltaT * (*it)->getDiffusion() * Average + (1.0 - deltaT * ((*it)->getDegradation() + 6.0 * (*it)->getDiffusion())) * *itOldValue;
        }

      do
        {
          pNewValue = &mpNewValues->operator [](*itPoint);

          itPoint.next();

          pOldValueE = pOldValue;
          pOldValue = pOldValueW;
          pOldValueW = &mpCurrentValues->operator [](*itPoint);

          itNorth.next();

          pOldValueNE = pOldValueN;
          pOldValueN = pOldValueNW;
          pOldValueNW = &mpCurrentValues->operator [](*itNorth);

          itSouth.next();

          if (!itSouth)
            {
              break;
            }

          pOldValueSE = pOldValueS;
          pOldValueS = pOldValueSW;
          pOldValueSW = &mpCurrentValues->operator [](*itSouth);
        }
      while(itPoint->getX() == 0 || itPoint->getX() == 1);
    }

  *mpCurrentValues = *mpNewValues;
}

void DiffuserImpl::computeVals3D(const double & /* deltaT */)
{
  // TODO Implement me
}

/**
 * Computes all the values for the space.
 */
void DiffuserImpl::computeVals(const double & deltaT)
{
  switch (mShape.dimensionCount())
  {
    case 1:
      computeVals1D(deltaT);
      break;

    case 2:
      computeVals2D(deltaT);
      break;

    case 3:
      computeVals3D(deltaT);
      break;
  }
}

void DiffuserImpl::diffuse(const double & deltaT)
{
  size_t steps = ceil(deltaT/mDeltaT);
  double DeltaT = deltaT/steps;

  // Do integration steps to reach deltaT
  for (size_t s = 0; s < steps; ++s)
    {
      computeVals(DeltaT);

      mpCompartment->synchronizeDiffuser();

      // mpDiffuserData->write(LocalFile::instance(mpCompartment->getName())->stream(), "\t", mpCompartment);
    }
}

#ifdef XXXX
  /* this is being based on
   http://www.mathcs.sjsu.edu/faculty/rucker/capow/santafe.html */
  int size = _dimensions.dimensionCount();

  if (size == 3)
    {
      int width = _dimensions.extents().getX();
      int height = _dimensions.extents().getY();
      int depth = _dimensions.extents().getZ();

      vec3d newVals(width, vec2d(depth, vec1d(height)));

      for (int z = 0; z < depth; z++)
        {
          for (int y = 0; y < height; y++)
            {
              for (int x = 0; x < width; x++)
                {
                  newVals[x][y][z] = compute3dVal(x, y, z);
                }
            }
        }
      _computed3dVals = newVals;
    }
}

double DiffuserImpl::compute3dVal(int xCoord, int yCoord, int zCoord)
{

  double weightedSum = 0;
  int numberEqual = 0;
  /* this is 4 if we're dealing with a direct (von-neuman) neighbor of the
   cell otherwise (we're on a diagonal) it's 1 */
  int multiplier = 1;
  /* this keeps the count of the number of neighbors we found that are valid.
   this also takes into account that some of the cells are weighted more
   than others and will have them counted accordingly (4 versus 1) */
  int count = 0;
  for (int z = zCoord - 1; z <= zCoord + 1; z++)
    {
      for (int y = yCoord - 1; y <= yCoord + 1; y++)
        {
          for (int x = xCoord - 1; x <= xCoord + 1; x++)
            {
              numberEqual = 0;
              /* find out if we're directly north/south/east/west/above/below the
               given cell (a von-neuman neighbor) */
              if (xCoord == x)
                {
                  numberEqual++;
                }
              if (yCoord == y)
                {
                  numberEqual++;
                }
              if (zCoord == z)
                {
                  numberEqual++;
                }
              if (numberEqual == 3)
                {
                  /* we're at the source */
                  continue;
                }
              else if (numberEqual == 2)
                {
                  /* we're a direct neighbor so we get weighted more */
                  multiplier = 4;
                }
              else
                {
                  multiplier = 1;
                }
              weightedSum += multiplier * getCoordValue(Coords(x, y, z));
              count += multiplier;
            }
        }
    }

  double weightedAvg = weightedSum / count;
  double oldVal = getCoordValue(Coords(xCoord, yCoord, zCoord));
  double delta = weightedAvg - oldVal;

  return constrainByMinMax((oldVal + delta * diffusionConst) * evaporationConst);
}

#endif // XXXX
