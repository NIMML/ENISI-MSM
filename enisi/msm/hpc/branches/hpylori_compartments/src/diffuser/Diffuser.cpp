#include "compartment/DiffuserLayer.h"
#include "DiffuserImpl.h"
#include "Diffuser.h"

Diffuser::~Diffuser() 
{ 
  delete p_impl; 
}

Diffuser::Diffuser(DiffuserLayer * p_cl, double e, double d, bool t)
  : p_impl(new DiffuserImpl(p_cl->dimensions(), e, d, t)), _p_layer(p_cl)
  { }

void Diffuser::act() { p_impl->diffuse(); }
std::string Diffuser::classname() { return "Diffuser"; }
void Diffuser::diffuse() { p_impl->diffuse(); }

double Diffuser::getDiffusionConst() { return p_impl->getDiffusionConst(); }
void   Diffuser::setDiffusionConst(double d) { p_impl->setDiffusionConst(d); }

double Diffuser::getEvaporationConst() { return p_impl->getEvaporationConst(); }
void   Diffuser::setEvaporationConst(double e) { p_impl->setEvaporationConst(e); }

const repast::GridDimensions & Diffuser::getDimensions() const 
  { return p_impl->getDimensions(); }

void Diffuser::setDimensions(const repast::GridDimensions & d) 
  { p_impl->setDimensions(d); }

void Diffuser::setGridPointsToCalculate(const std::vector<repast::Point<int> > & p)
  { p_impl->setGridPointsToCalculate(p); }

void Diffuser::setValueAtCoord(double d, const DiffuserImpl::Coords & c) 
  { p_impl->setValueAtCoord(d, c); }

std::vector<repast::Point<int> > Diffuser::getGridCoordsAssignedToRank()
{ 
  int rank = this->getId().currentRank();
  return p_impl->getGridCoordsAssignedToRank(rank);
}

double Diffuser::getCoordValue(const DiffuserImpl::Coords & c) 
  { return p_impl->getCoordValue(c); }

void Diffuser::setValuesAtCoords(
    std::vector<double> & values, std::vector<repast::Point<int> > coords)
  { return p_impl->setValuesAtCoords(values, coords); }

std::vector<double> Diffuser::getAssignedGridValues() { return p_impl->getAssignedGridValues(); }

double ** Diffuser::getGrid() { return p_impl->getGrid(); }
void Diffuser::setGrid(double ** newGrid) { p_impl->setGrid(newGrid); }

/* DiffuserImpl */
/* static public variables */
const double DiffuserImpl::DEFAULT_MAX = 0x7FFF;
const double DiffuserImpl::DEFAULT_MIN = -DiffuserImpl::DEFAULT_MAX;
const double DiffuserImpl::DEFAULT_EVAP_CONST = 1.0;
const double DiffuserImpl::DEFAULT_DIFF_CONST = 1.0;

/* static private variables */
const long DiffuserImpl::serialVersionUID = 1L;

DiffuserImpl::~DiffuserImpl()
{
  _p_computed1dVals = new double[0];
  delete _p_computed1dVals;

  _p_temp2dVals = new double*[0];
  delete _p_temp2dVals;

  _p_computed2dVals = new double*[0];
  delete _p_computed2dVals;
}

DiffuserImpl::DiffuserImpl(
  const repast::GridDimensions dims, double e, double d, bool t) 
: maxValue(DEFAULT_MAX), _minValue(DEFAULT_MIN),
  evaporationConst(e), diffusionConst(d), toroidal(t), 
  _dimensions(dims), 
  _width(_dimensions.extents().getX() + 1), 
  _height(_dimensions.extents().getY() + 1), 
  _borders(_dimensions)
{
  setDimensions(_dimensions);
}

void DiffuserImpl::setDimensions(const repast::GridDimensions & dims)
{
  if (dims.dimensionCount() < 1 || dims.dimensionCount() > 3) {
    std::string msg = 
      "Value layer diffuser only works for 1d, 2d or 3d value layers.";
    throw std::runtime_error(msg);
  } 
  else 
  {
    int size = dims.dimensionCount();
    if (size == 1) 
    {
      int x = dims.extents().getX();
      _p_computed1dVals = new double[x];
    }
    else if (size == 2) 
    {
      _p_computed2dVals = new double*[_width];

      for (int x = 0; x < _width; ++x) 
      {
	_p_computed2dVals[x] = new double[_height]();
      }
    }
  }
  _dimensions = dims;
}

const repast::GridDimensions & DiffuserImpl::getDimensions() const { return _dimensions; }

void DiffuserImpl::setGridPointsToCalculate(
    const std::vector<repast::Point<int> > & points) 
{
  _gridPointsToDiffuse = points;
}

/**
  * Retrieves a value from the layer, taking into account the toroidal'ness.
  * 
  * @param coords
  *          the coordinates
  * @return the value at the specified coordinate
  */
std::vector<repast::Point<int> > 
DiffuserImpl::getGridCoordsAssignedToRank(int rank)
{
  int startX = _dimensions.origin().getX();
  int startY = _dimensions.origin().getY();

  int worldSize = repast::RepastProcess::instance()->worldSize();

  int startChunkX = startX + rank * (_width / worldSize);
  int startChunkY = startY + rank * (_height / worldSize);

  int chunkSize = _width * _height / worldSize;
  int remainder = _width * _height % worldSize;

  int buffer = ( remainder && (remainder > rank) ) ? 1 : 0;

  std::vector<repast::Point<int> > assignedCoords;

  for (int i = 0; i < chunkSize + buffer; ++i)
  {
    if (startChunkX >= startX + _width) { startChunkX = startX; startChunkY++; }
    assignedCoords.push_back(repast::Point<int>(startChunkX, startChunkY));
    startChunkX++;
  }
  return assignedCoords;
}

double DiffuserImpl::getCoordValue(const Coords& coords) 
{
  double value = 0.0;

  if (toroidal) 
  {
    /* repast::StickyBorders expects coordinates as vectors */
    std::vector<int> vectorCoords = coords.coords();
    std::vector<int> displacement;
    displacement.push_back(0); displacement.push_back(0);
    _borders.translate(vectorCoords, vectorCoords, displacement);

    /* valueLayer expects coordinates as repast::Point */
    //value = _p_valueLayer->get(vectorToPointCoordinates(vectorCoords));
    value = _p_computed2dVals[vectorCoords[0]][vectorCoords[1]];
  } 
  else if (inBounds(coords)) 
  { 
    value = _p_computed2dVals[coords.getX()][coords.getY()];
  }

  return value; 
}

void DiffuserImpl::setValuesAtCoords(
    std::vector<double> & values, std::vector<repast::Point<int> > coords)
{
  int coordSize = coords.size();

  for (int i = 0; i < coordSize; ++i)
  {
    int x = coords[i].getX(); int y = coords[i].getY();
    _p_computed2dVals[x][y] = values[i];
  }
}

std::vector<double> DiffuserImpl::getAssignedGridValues() 
{ 
  std::vector<double> values;

  std::vector<repast::Point<int> >::const_iterator it = _gridPointsToDiffuse.begin();

  while(it != _gridPointsToDiffuse.end())
  {
    values.push_back( getCoordValue( (*it) ) );
    it++;
  }

  return values;
}

repast::Point<int>
DiffuserImpl::vectorToPointCoordinates(const std::vector<int>& vCoords) {

  repast::Point<int> pointCoords(0);
  int size = _dimensions.dimensionCount();

  switch (size) {
  case 1:
    pointCoords = repast::Point<int>(vCoords[0]);
    break;
  case 2:
    pointCoords = repast::Point<int>(vCoords[0], vCoords[1]);
    break;
  case 3:
    pointCoords = repast::Point<int>(vCoords[0], vCoords[1], vCoords[2]);
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
bool DiffuserImpl::inBounds(Coords coords) {
  return toroidal ? true : _dimensions.contains(coords);
}

/**
  * Massages the value into the range specified by [_minValue, maxValue].
  * 
  * @param val
  *          the value to bring into range (if necessary)
  * @return the value
  */
double DiffuserImpl::constrainByMinMax(double val) {
 if (val > maxValue) {
    return maxValue;
  } else if (val < _minValue) {
    return _minValue;
  }
  return val;
}

/**
  * Computes all the values for the space.
  */
void DiffuserImpl::computeVals() {
  /* this is being based on
     http://www.mathcs.sjsu.edu/faculty/rucker/capow/santafe.html */
  int size = _dimensions.dimensionCount();

  if (size == 1) {

    double sum;
    for (int x = 0; x < _width; x++) {
      /* sum the cell to the left and the right of the given one */
      sum = getCoordValue(Coords(x - 1));
      sum += getCoordValue(Coords(x + 1));

      double weightedAvg = sum / 2.0;

      /* apply the diffusion and evaporation constants */
      double oldVal = getCoordValue(Coords(x));
      double delta = weightedAvg - oldVal;

      double newVal = (oldVal + delta * diffusionConst) * evaporationConst;
      /* bring the value into range [min, max] */
      _p_computed1dVals[x] = constrainByMinMax(newVal);
    }
  } 
  else if (size == 2) 
  {
    _p_computed2dVals = compute2dValues();

  } else if (size == 3) {
    int width = _dimensions.extents().getX();
    int height = _dimensions.extents().getY();
    int depth = _dimensions.extents().getZ();

    vec3d newVals(width, vec2d(depth, vec1d(height) ) );

    for (int z = 0; z < depth; z++) {
      for (int y = 0; y < height; y++) {
	for (int x = 0; x < width; x++) {
	  newVals[x][y][z] = compute3dVal(x, y, z);
	}
      }
    }
    _computed3dVals = newVals;
  }
}

double ** DiffuserImpl::compute2dValues()
{
  _p_temp2dVals = new double*[_width]();

  if ( _gridPointsToDiffuse.size() != 0 )
  {
    computeSpecific2dGridCoords();
  } 
  else { computeAll2dGridCoords(); }

  return _p_temp2dVals;
}

void DiffuserImpl::computeSpecific2dGridCoords()
{
  std::vector<repast::Point<int> >::const_iterator it = _gridPointsToDiffuse.begin();

  while(it != _gridPointsToDiffuse.end())
  {
    int x = it->getX(); int y = it->getY();

    if (! _p_temp2dVals[x]) _p_temp2dVals[x] = new double[_height]();
    _p_temp2dVals[x][y] = compute2dValueAtCoord(x, y);
    it++;
  }
}

void DiffuserImpl::computeAll2dGridCoords()
{
  for (int x = 0; x < _width; x++) 
  {
    _p_temp2dVals[x] = new double[_height]();

    for (int y = 0; y < _height; y++) 
    {
      _p_temp2dVals[x][y] = compute2dValueAtCoord(x, y);
    }
  }
}

double DiffuserImpl::compute2dValueAtCoord(int x, int y)
{
  /* these are the neighbors that are directly north/south/east/west to
      the given cell 4 times those that are diagonal to the cell */
  double uE = getCoordValue(Coords(x + 1, y));
  double uN = getCoordValue(Coords(x, y + 1));
  double uW = getCoordValue(Coords(x - 1, y));
  double uS = getCoordValue(Coords(x, y - 1));

  /* these are the neighbors that are diagonal to the given cell
      they are only weighted 1/4 of the ones that are
      north/south/east/west of the cell */
  double uNE = getCoordValue(Coords(x + 1, y + 1));
  double uNW = getCoordValue(Coords(x - 1, y + 1));
  double uSW = getCoordValue(Coords(x - 1, y - 1));
  double uSE = getCoordValue(Coords(x + 1, y - 1));

  /* compute the weighted avg, those directly north/south/east/west
      are given 4 times the weight of those on a diagonal */
  double weightedAvg = ((uE + uN + uW + uS) * 4 + (uNE + uNW + uSW + uSE)) / 20.0;

  /* apply the diffusion and evaporation constants */
  double oldVal = getCoordValue(Coords(x, y));
  double delta = weightedAvg - oldVal;

  double newVal = (oldVal + delta * diffusionConst) * evaporationConst;

  /* bring the value into [min, max] */
  return constrainByMinMax(newVal);
}

double DiffuserImpl::compute3dVal(int xCoord, int yCoord, int zCoord) {

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
void DiffuserImpl::diffuse() 
{
  computeVals();

  int size = _dimensions.dimensionCount();

  if (size == 1) {
    int xMax = _dimensions.extents().getX();
    for(int x = 0; x < xMax; ++x) {
      /* Setting the valueLayer one point at a time is extremely slow.
       * Refactor this when the need arises. Use computeVals() when size == 2
       * as an example for how to do this */
      //_p_valueLayer->set(_p_computed1dVals[x], Coords(x));
    }
  } else if (size == 2) {
/*    int xMax = _dimensions.extents().getX();*/
    //int yMax = _dimensions.extents().getY();
    //for(int x = 0; x < xMax; ++x) {
      //for(int y = 0; y < yMax; ++y) {
	//_p_valueLayer->set(_p_computed2dVals[x][y], Coords(x, y));
      //}
    /*}*/
  } else if (size == 3) {
    for (size_t x = 0; x < _computed3dVals.size(); ++x) {
      for (size_t y = 0; y < _computed3dVals[0].size(); ++y) {
	for (size_t z = 0; z < _computed3dVals[0][0].size(); ++z) {
	  /* Setting the valueLayer one point at a time is extremely slow.
	  * Refactor this when the need arises. Use computeVals() when size == 2
	  * as an example for how to do this */
	  //_p_valueLayer->set(_computed3dVals[x][y][z], Coords(x, y, z));
	}
      }
    }
  }
}

void DiffuserImpl::setValueAtCoord(double value, const Coords & coords)
{
  _p_computed2dVals[coords.getX()][coords.getY()] = value;
}
