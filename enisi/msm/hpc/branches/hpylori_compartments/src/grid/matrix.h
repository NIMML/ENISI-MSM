/* This is an almost exact copy of Repast's matrix.h except for specifically
 * addressing a fatal syntax bug in Repast_Error_47 that prevents the user
 * from creating matrix objects. This class can be eliminated once the Repast
 * version is fixed. */

#ifndef ENISI_MATRIX_H_
#define ENISI_MATRIX_H_

#include <vector>
#include <stdexcept>
#include <map>

#include "repast_hpc/Point.h"
#include "repast_hpc/RepastErrors.h"

using repast::Point;
using repast::err_msg;
using repast::Repast_Error_48;

/* Error 47 */
template <typename T>
class Repast_Error_47: public std::out_of_range{
public:
  Repast_Error_47(int matrixDimensions, int pointDimensions, T index): OUT_OF_RANGE(ERROR_NUMBER 47)
      THROWN_BY     "Matrix<T>::boundsCheck(const Point<int>& index)"
      REASON        "Number of dimensions in index point (" + make_str(index) + " = " + VAL(pointDimensions) + ") does not equal matrix dimensions (" + VAL(matrixDimensions) + ")"
      EXPLANATION   "The dimensions of the index point must match those of the matrix to check boundaries"
      CAUSE         "Unknown"
      RESOLUTION    "Unknown"
END_ERR

namespace ENISI {
/**
 * Base class for matrix implementations.
 */
template<typename T>
class Matrix {

protected:

	int* stride;
	T defValue;
	Point<int> _size;
	int dCount;

	int calcIndex(const Point<int>& index) const;
	void boundsCheck(const Point<int>& index) const;
	void create();

public:

	/**
	 * Creates a matrix of the specified size and with the specified default value.
	 *
	 * \param size the size of the matrix in each dimension
	 */
	explicit Matrix(const Point<int>& size, const T& defaultValue = T());
	virtual ~Matrix();

	/**
	 * Gets the value at the specified index.
	 */
	virtual T& get(const Point<int>& index) = 0;

  /**
   * Gets the value at the specified index.
   */
  virtual const T& get(const Point<int>& index) const = 0;

	/**
	 * Sets the value at the specified index.
	 */
	virtual void set(const T& value, const Point<int>& index) = 0;

	T& operator[](const Point<int>& index);
	const T& operator[](const Point<int>& index) const;

	/**
	 * Gets the default value of any unset matrix cell.
	 */
	const T& defaultValue() const {
		return defValue;
	}

	/**
	 * Gets the shape (i.e. the length of each dimensions) of the matrix.
	 */
	const Point<int> shape() const {
		return _size;
	}
};

template<typename T>
Matrix<T>::Matrix(const Point<int>& size, const T& defaultValue) :
	defValue(defaultValue), _size(size), dCount(size.dimensionCount()) {
	create();
}

template<typename T>
void Matrix<T>::create() {
	int tmpStride = 1;
	stride = new int[dCount];
	for (int i = dCount - 1; i >= 0; i--) {
		stride[i] = tmpStride;
		tmpStride *= _size.getCoordinate(i);
	}
}

template<typename T>
Matrix<T>::~Matrix() {
	delete[] stride;
}

template<typename T>
void Matrix<T>::boundsCheck(const Point<int>& index) const {
	if ((int) index.dimensionCount() != dCount)
		throw Repast_Error_47<Point<int> >(dCount, index.dimensionCount(), index); // Number of index dimensions != number of matrix dimensions
	for (int i = 0; i < dCount; i++) {
		if (index.getCoordinate(i) < 0 || index.getCoordinate(i) >= _size.getCoordinate(i))
			throw Repast_Error_48<Point<int> >(i, index.getCoordinate(i), index, _size.getCoordinate(i)); // Matrix Bounds Check: index is out of range
	}
}

template<typename T>
int Matrix<T>::calcIndex(const Point<int>& index) const {
	int vIndex = 0;
	for (size_t i = 0; i < index.dimensionCount(); i++) {
		vIndex = vIndex + index[i] * stride[i];
	}
	return vIndex;
}

template<typename T>
T& Matrix<T>::operator[](const Point<int>& index) {
	return get(index);
}

template<typename T>
const T& Matrix<T>::operator[](const Point<int>& index) const {
	return get(index);
}

/**
 * A dense matrix implementation that stores each cell individually.
 */
template<typename T>
class DenseMatrix: public Matrix<T> {

private:
	std::vector<T> values;

public:
	/**
	 * Creates a DenseMatrix as a copy of the specified DenseMatrix.
	 */
	DenseMatrix(const DenseMatrix<T>&);
	DenseMatrix<T>& operator=(const DenseMatrix<T>&);

	/**
	 * Creates a DenseMatrix of the specified shape and default value.
	 */
	explicit DenseMatrix(const Point<int>& shape, const T& defValue = T());

	~DenseMatrix() {
	}

	/**
	 * Gets the value at the specified index.
	 */
	T& get(const Point<int>& index);

  /**
   * Gets the value at the specified index.
   */
  const T& get(const Point<int>& index) const;

	/**
	 * Sets the value at the specified index.
	 */
	void set(const T& value, const Point<int>& index);

};

template<typename T>
DenseMatrix<T>::DenseMatrix(const DenseMatrix<T>& other) :
	Matrix<T> (other._size, other.defaultValue()), values(other.values) {

}

template<typename T>
DenseMatrix<T>& DenseMatrix<T>::operator=(const DenseMatrix<T>& rhs) {
	if (&rhs != this) {
		delete[] Matrix<T>::stride;
		Matrix<T>::_size = rhs._size;
		Matrix<T>::dCount = rhs.dCount;
		Matrix<T>::defValue = rhs.defaultValue();
		Matrix<T>::create();

		values = std::vector<T>(rhs.values.begin(), rhs.values.end());
	}
	return *this;
}

template<typename T>
DenseMatrix<T>::DenseMatrix(const Point<int>& size, const T& defValue) :
	Matrix<T> (size) {
	int _size = 1;
	for (int i = 0; i < Matrix<T>::dCount; i++) {
		_size *= size.getCoordinate(i);
	}
	values = std::vector<T>(_size, defValue);
}

template<typename T>
T& DenseMatrix<T>::get(const Point<int>& index) {
	Matrix<T>::boundsCheck(index);
	int vIndex = Matrix<T>::calcIndex(index);
	return values[vIndex];
}

template<typename T>
const T& DenseMatrix<T>::get(const Point<int>& index) const {
  Matrix<T>::boundsCheck(index);
  int vIndex = Matrix<T>::calcIndex(index);
  return values[vIndex];
}

template<typename T>
void DenseMatrix<T>::set(const T& value, const Point<int>& index) {
	Matrix<T>::boundsCheck(index);
	int vIndex = Matrix<T>::calcIndex(index);
	values[vIndex] = value;
}

/**
 * A sparse matrix implementation that stores values in a map. This should be used
 * when the majority of the matrix cells contain the default value.
 */
template<typename T>
class SparseMatrix: public Matrix<T> {

private:
	std::map<int, T> map;

	typedef typename std::map<int, T>::iterator map_iter;

public:
	SparseMatrix(const SparseMatrix<T>&);
	SparseMatrix<T>& operator=(const SparseMatrix<T>&);

	/**
	 * Creates a DenseMatrix of the specified shape and default value.
	 */
	explicit SparseMatrix(const Point<int>& size, const T& defValue = T());
	~SparseMatrix() {
	}

	/**
	 * Gets the value at the specified index.
	 */
	T& get(const Point<int>& index);

  /**
   * Gets the value at the specified index.
   */
  const T& get(const Point<int>& index) const;

	/**
	 * Sets the value at the specified index.
	 */
	void set(const T& value, const Point<int>& index);

  template<class Archive>
  void serialize(Archive &ar, unsigned int version);
};

template<typename T>
SparseMatrix<T>::SparseMatrix(const SparseMatrix<T>& other) :
	Matrix<T> (other._size, other.defaultValue()), map(other.map) {
}

template<typename T>
SparseMatrix<T>& SparseMatrix<T>::operator=(const SparseMatrix<T>& rhs) {
	if (&rhs != this) {
		delete[] Matrix<T>::stride;
		Matrix<T>::_size = rhs._size;
		Matrix<T>::dCount = rhs.dCount;
		Matrix<T>::defValue = rhs.defaultValue();
		Matrix<T>::create();

		map = std::map<int, T>(rhs.map.begin(), rhs.map.end());
	}
	return *this;
}

template<typename T>
SparseMatrix<T>::SparseMatrix(const Point<int>& size, const T& defValue) :
	Matrix<T> (size, defValue) {
}

template<typename T>
T& SparseMatrix<T>::get(const Point<int>& index) {
	Matrix<T>::boundsCheck(index);
	int vIndex = Matrix<T>::calcIndex(index);
	// need to insert do an insert and return reference to
	// result so that assignment via [] uses a reference in
	// the map. insert inserts the entry if it doesn't exist
	// and returns the entry or the existing entry
	std::pair<map_iter, bool> res = map.insert(std::make_pair(vIndex, Matrix<T>::defValue));
	return res.first->second;
}

template<typename T>
const T& SparseMatrix<T>::get(const Point<int>& index) const {
  Matrix<T>::boundsCheck(index);
  int vIndex = Matrix<T>::calcIndex(index);

  typename std::map<int, T>::const_iterator found = map.find(vIndex);

  if (found != map.end())
    {
      return found->second;
    }

  return Matrix<T>::defValue;
}

template<typename T>
void SparseMatrix<T>::set(const T& value, const Point<int>& index) {
	Matrix<T>::boundsCheck(index);
	int vIndex = Matrix<T>::calcIndex(index);
	map[vIndex] = value;
}

template<typename T> template< class Archive>
void SparseMatrix<T>::serialize(Archive &ar, unsigned int version)
{
  ar & Matrix<T>::defValue;
  ar & Matrix<T>::_size;
  ar & map;
}

} // namespace ENISI

#endif /* ENISI_MATRIX_H_ */
