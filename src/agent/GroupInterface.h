/*
 * GroupInterface.h
 *
 *  Created on: Apr 20, 2016
 *      Author: shoops
 */

#ifndef AGENT_GROUPINTERFACE_H_
#define AGENT_GROUPINTERFACE_H_

#include <string>

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

  virtual void act() = 0;
  virtual std::string classname() const = 0;

protected:
  Compartment * mpCompartment;
};

} /* namespace ENISI */

#endif /* AGENT_GROUPINTERFACE_H_ */
