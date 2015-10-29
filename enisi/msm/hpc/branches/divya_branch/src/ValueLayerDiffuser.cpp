#include "ValueLayerDiffuser.h"

namespace repast {
/* static public variables */
const double ValueLayerDiffuser::DEFAULT_MAX = 0x7FFF;
const double ValueLayerDiffuser::DEFAULT_MIN = -ValueLayerDiffuser::DEFAULT_MAX;
const double ValueLayerDiffuser::DEFAULT_EVAP_CONST = 1.0;
const double ValueLayerDiffuser::DEFAULT_DIFF_CONST = 1.0;

/* static private variables */
const long ValueLayerDiffuser::serialVersionUID = 1L;

void ValueLayerDiffuser::setValueLayer(GridValueLayer valueLayer) {
  if (valueLayer && valueLayer->dimensions().dimensionCount() > 3) {
    std::string msg = 
      "Value layer diffuser only works for 1d, 2d or 3d value layers.";
    throw std::runtime_error(msg);
  }
  this->valueLayer = valueLayer;
}

/**
  * Retrieves a value from the layer, taking into account the toroidal'ness.
  * 
  * @param coords
  *          the coordinates
  * @return the value at the specified coordinate
  */
double ValueLayerDiffuser::getValue(const Coords& coords) {

  double value = 0.0;

  if (toroidal) {

    if (! borders) {
      borders.reset(new WrapAroundBorders(valueLayer->dimensions()));
    }
    /* WrapAroundBorders expects coordinates as vectors */
    std::vector<int> vectorCoords = pointToVectorCoordinates(coords);
    borders->transform(vectorCoords, vectorCoords);

    /* valueLayer expects coordinates as Point */
    value = valueLayer->get(vectorToPointCoordinates(vectorCoords));
  } 
  else if (inBounds(coords)) { value = valueLayer->get(coords); }

  return value; 
}

std::vector<int> 
ValueLayerDiffuser::pointToVectorCoordinates(const Coords& coords) {

  int size = valueLayer->dimensions().dimensionCount();

  std::vector<int> vectorCoords;
  vectorCoords.push_back(coords.getX());

  if (2 >= size) { vectorCoords.push_back(coords.getY()); }
  if (3 == size) { vectorCoords.push_back(coords.getZ()); }

  return vectorCoords;
}

Point<int>
ValueLayerDiffuser::vectorToPointCoordinates(const std::vector<int>& vCoords) {

  Point<int> pointCoords(0);
  int size = valueLayer->dimensions().dimensionCount();

  switch (size) {
  case 1:
    pointCoords = Point<int>(vCoords[0]);
    break;
  case 2:
    pointCoords = Point<int>(vCoords[0], vCoords[1]);
    break;
  case 3:
    pointCoords = Point<int>(vCoords[0], vCoords[1], vCoords[2]);
    break;
  default:
    std::string msg = 
      "Value layer diffuser only works for 1d, 2d or 3d value layers.";
    throw std::runtime_error(msg);
    break;
  }

  return pointCoords;
}

/**
  * Returns true if the coordinates are in the layer's bounds, otherwise 
  * returns false
  * 
  * @param coords
  *          the coordinates to check
  * @return true or false
  */
bool ValueLayerDiffuser::inBounds(Coords coords) {
  return toroidal ? true : valueLayer->dimensions().contains(coords);
}

/**
  * Massages the value into the range specified by [minValue, maxValue].
  * 
  * @param val
  *          the value to bring into range (if necessary)
  * @return the value
  */
double ValueLayerDiffuser::constrainByMinMax(double val) {
 if (val > maxValue) {
    return maxValue;
  } else if (val < minValue) {
    return minValue;
  }
  return val;
}

/**
  * Computes all the values for the space.
  */
void ValueLayerDiffuser::computeVals() {
  /* this is being based on
     http://www.mathcs.sjsu.edu/faculty/rucker/capow/santafe.html */
  GridDimensions dimensions = valueLayer->dimensions();
  int size = dimensions.dimensionCount();

  if (size == 1) {
    int width = dimensions.extents().getX();

    double sum;
    vec1d newVals(width);
    for (int x = 0; x < width; x++) {
      /* sum the cell to the left and the right of the given one */
      sum = getValue(Coords(x - 1));
      sum += getValue(Coords(x + 1));

      double weightedAvg = sum / 2.0;

      /* apply the diffusion and evaporation constants */
      double oldVal = getValue(Coords(x));
      double delta = weightedAvg - oldVal;

      double newVal = (oldVal + delta * diffusionConst) * evaporationConst;
      /* bring the value into range [min, max] */
      newVals[x] = constrainByMinMax(newVal);
    }
    computed1dVals = newVals;
  } else if (size == 2) {
    int width = dimensions.extents().getX();
    int height = dimensions.extents().getY();

    vec2d newVals(width, vec1d(height));

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
	/* these are the neighbors that are directly north/south/east/west to
	   the given cell 4 times those that are diagonal to the cell */
	double uE = getValue(Coords(x + 1, y));
	double uN = getValue(Coords(x, y + 1));
	double uW = getValue(Coords(x - 1, y));
	double uS = getValue(Coords(x, y - 1));

	/* these are the neighbors that are diagonal to the given cell
	   they are only weighted 1/4 of the ones that are
	   north/south/east/west of the cell */
	double uNE = getValue(Coords(x + 1, y + 1));
	double uNW = getValue(Coords(x - 1, y + 1));
	double uSW = getValue(Coords(x - 1, y - 1));
	double uSE = getValue(Coords(x + 1, y - 1));

	/* compute the weighted avg, those directly north/south/east/west
	   are given 4 times the weight of those on a diagonal */
	double weightedAvg = ((uE + uN + uW + uS) * 4 + (uNE + uNW + uSW + uSE)) / 20.0;

	/* apply the diffusion and evaporation constants */
	double oldVal = getValue(Coords(x, y));
	double delta = weightedAvg - oldVal;

	double newVal = (oldVal + delta * diffusionConst) * evaporationConst;

	/* bring the value into [min, max] */
	newVals[x][y] = constrainByMinMax(newVal);
      }
    }
    computed2dVals = newVals;
  } else if (size == 3) {
    int width = dimensions.extents().getX();
    int height = dimensions.extents().getY();
    int depth = dimensions.extents().getZ();

    vec3d newVals(width, vec2d(depth, vec1d(height) ) );

    for (int z = 0; z < depth; z++) {
      for (int y = 0; y < height; y++) {
	for (int x = 0; x < width; x++) {
	  newVals[x][y][z] = compute3dVal(x, y, z);
	}
      }
    }
    computed3dVals = newVals;
  }
}

double ValueLayerDiffuser::compute3dVal(int xCoord, int yCoord, int zCoord) {

  double weightedSum = 0;
  int numberEqual = 0;
  /* this is 4 if we're dealing with a direct (von-neuman) neighbor of the
     cell otherwise (we're on a diagonal) it's 1 */
  int multiplier = 1;
  /* this keeps the count of the number of neighbors we found that are valid.
     this also takes into account that some of the cells are weighted more
     than others and will have them counted accordingly (4 versus 1) */
  int count = 0;
  for (int z = zCoord - 1; z <= zCoord + 1; z++) {
    for (int y = yCoord - 1; y <= yCoord + 1; y++) {
      for (int x = xCoord - 1; x <= xCoord + 1; x++) {
	numberEqual = 0;
	/* find out if we're directly north/south/east/west/above/below the
	   given cell (a von-neuman neighbor) */
	if (xCoord == x) {
	  numberEqual++;
	}
	if (yCoord == y) {
	  numberEqual++;
	}
	if (zCoord == z) {
	  numberEqual++;
	}
	if (numberEqual == 3) {
	  /* we're at the source */
	  continue;
	} else if (numberEqual == 2) {
	  /* we're a direct neighbor so we get weighted more */
	  multiplier = 4;
	} else {
	  multiplier = 1;
	}
	weightedSum += multiplier * getValue(Coords(x, y, z));
	count += multiplier;
      }
    }
  }

  double weightedAvg = weightedSum / count;
  double oldVal = getValue(Coords(xCoord, yCoord, zCoord));
  double delta = weightedAvg - oldVal;

  return constrainByMinMax((oldVal + delta * diffusionConst) * evaporationConst);
}

/**
  * Runs the diffusion with the current rates and values. Following the Swarm
  * class, it is roughly newValue = evap(ownValue + diffusionConstant * (nghAvg
  * - ownValue)) where nghAvg is the weighted average of a cells neighbors, and
  * ownValue is the current value for the current cell.
  * <p>
  * 
  * Values from the value layer are used to calculate diffusion. This value is
  * then written to a buffer. When this has been done for every cell in the
  * grid, the buffer is copied to the value layer.
  */
void ValueLayerDiffuser::diffuse() {

  computeVals();
  int size = valueLayer->dimensions().dimensionCount();

  if (size == 1) {
    for(size_t x = 0; x < computed1dVals.size(); ++x) {
      valueLayer->set(computed1dVals[x], Coords(x));
    }
  } else if (size == 2) {
    for(size_t x = 0; x < computed2dVals.size(); ++x) {
      for(size_t y = 0; y < computed2dVals[0].size(); ++y) {
	valueLayer->set(computed2dVals[x][y], Coords(x, y));
      }
    }
  } else if (size == 3) {
    for (size_t x = 0; x < computed3dVals.size(); ++x) {
      for (size_t y = 0; y < computed3dVals[0].size(); ++y) {
	for (size_t z = 0; z < computed3dVals[0][0].size(); ++z) {
	  valueLayer->set(computed3dVals[x][y][z], Coords(x, y, z));
	}
      }
    }
  }
}

}

