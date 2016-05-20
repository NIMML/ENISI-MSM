/*
 * GroupInterface.h
 *
 *  Created on: Apr 20, 2016
 *      Author: shoops
 */

#ifndef AGENT_GROUPINTERFACE_H_
#define AGENT_GROUPINTERFACE_H_

#include <string>

#include "repast_hpc/Point.h"

namespace ENISI
{

class Compartment;

class GroupInterface
{
private:
  GroupInterface();
public:
  GroupInterface(Compartment * pCompartment);

  virtual ~GroupInterface();

  void act();
  virtual std::string classname() const = 0;

protected:
  virtual void act(const repast::Point<int> & pt) = 0;
  Compartment * mpCompartment;
};

} /* namespace ENISI */

#endif /* AGENT_GROUPINTERFACE_H_ */
