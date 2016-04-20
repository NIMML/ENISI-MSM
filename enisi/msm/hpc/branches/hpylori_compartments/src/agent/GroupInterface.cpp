/*
 * GroupInterface.cpp
 *
 *  Created on: Apr 20, 2016
 *      Author: shoops
 */

#include "GroupInterface.h"
#include "compartment/Compartment.h"

using namespace ENISI;

GroupInterface::GroupInterface() :
  mpCompartment(NULL)
{}

GroupInterface::GroupInterface(Compartment * pCompartment):
  mpCompartment(pCompartment)
{
  assert (mpCompartment != NULL);

  mpCompartment->addGroup(this);
}

// virtual
GroupInterface::~GroupInterface()
{}
