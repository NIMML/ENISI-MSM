/*
 * SharedValueLayer.h
 *
 *  Created on: Mar 28, 2016
 *      Author: shoops
 */

#ifndef AGENT_SHAREDVALUELAYER_H_
#define AGENT_SHAREDVALUELAYER_H_

#include <map>

#include "ENISIAgent.h"

#include "grid/ValueLayer.h"
#include "grid/Borders.h"
#include "grid/matrix.h"

namespace ENISI
{

class SharedValueLayer : public Agent
{
private:
  SharedValueLayer();

public:
  typedef DenseMatrix< std::vector< double > > LocalValues;
  typedef std::map< std::vector< int >, std::vector< double > > BufferValues;

  /**
   * @param const Type & type (Valid values: Agent::DiffuserValues)
   * @param const int & compartmentType (Valid values: Compartment::Type)
   */
  SharedValueLayer(const Type & type, const int & compartmentType, const size_t & valueSize);

  SharedValueLayer(const int & id, const int & startProc, const int & agentType, const int & currentProc, const int & state,
                   const repast::Point< int > & origin, const BufferValues & bufferValues);

  virtual ~SharedValueLayer();

  virtual void write(std::ostream & o, const std::string & separator, Compartment * pCompartment = NULL);

  void getBufferValues(repast::Point< int > & origin,
                       BufferValues & bufferValues) const;

  void setBufferValues(const repast::Point< int > & origin,
                       const BufferValues & bufferValues);

  void updateBufferValues(const SharedValueLayer & neighbor,
                          const Borders & globalBorders);

  void completeBufferValues(const Borders & globalBorders);

  LocalValues * getLocalValues();

  bool contains(const repast::Point< int > & pt) const;
  std::vector< double > & operator[](const repast::Point< int > location);
  std::vector< double > * tryLocation(const repast::Point< int > location);

  const repast::Point< int > & origin() const;
  const repast::Point< int > & shape() const;

protected:
  size_t mValueSize;
  repast::Point< int > mOrigin;
  repast::Point< int > mShape;

  LocalValues * mpLocalValues;
  BufferValues mBufferValues;
};


} /* namespace ENISI */

#endif /* AGENT_SHAREDVALUELAYER_H_ */
