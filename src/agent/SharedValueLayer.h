/*
 * SharedValueLayer.h
 *
 *  Created on: Mar 28, 2016
 *      Author: shoops
 */

#ifndef AGENT_SHAREDVALUELAYER_H_
#define AGENT_SHAREDVALUELAYER_H_

#include "ENISIAgent.h"

#include "grid/ValueLayer.h"
#include "grid/Borders.h"
#include "grid/matrix.h"

namespace ENISI
{

class Compartment;

class SharedValueLayer : public Agent
{
private:
  SharedValueLayer();

public:
  typedef repast::DiscreteValueLayer< std::vector< double >, SimpleBorders > LocalValues;

  /**
   * @param const Type & type (Valid values: Agent::DiffuserValues)
   * @param const int & compartmentType (Valid values: Compartment::Type)
   */
  SharedValueLayer(const Type & type, const int & compartmentType, const size_t & valueSize);

  virtual ~SharedValueLayer();

  void getBufferValues(repast::Point< int > & origin, SparseMatrix< std::vector< double > > & bufferValues);
  void setBufferValues(const repast::Point< int > & origin, const SparseMatrix< std::vector< double > > & bufferValues);

  std::vector< double > & operator[](const repast::Point< int > location);

protected:
  Compartment * mpCompartment;
  size_t mValueSize;
  repast::Point< int > mOrigin;

  LocalValues * mpLocalValues;
};


} /* namespace ENISI */

#endif /* AGENT_SHAREDVALUELAYER_H_ */
