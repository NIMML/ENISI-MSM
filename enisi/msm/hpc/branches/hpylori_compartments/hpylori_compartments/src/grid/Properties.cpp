/*
 * Properties.cpp
 *
 *  Created on: Mar 23, 2016
 *      Author: shoops
 */

#include <sstream>

#include "Properties.h"

using namespace ENISI;

// static
std::map< Properties::Type, Properties * > Properties::INSTANCES;

// static
const Properties * Properties::instance(const Properties::Type & type)
{
  std::map< Type, Properties * >::iterator found = INSTANCES.find(type);

  if (found == INSTANCES.end())
    {
      throw std::runtime_error("Unknown property: " + (char) type);
    }

  return found->second;
}

Properties::Properties():
  repast::Properties()
{}

Properties::Properties(const Type & type,
                       const std::string & name,
                       int argc, char** argv,
                       boost::mpi::communicator* comm,
                       int maxPropFileSize):
  repast::Properties(name, argc, argv, comm, maxPropFileSize)
{
  std::map< Type, Properties * >::iterator found = INSTANCES.find(type);

  if (found != INSTANCES.end())
    {
      throw std::runtime_error("Property already exist: " + (char) type);
    }

  INSTANCES.insert(std::make_pair(type, this));
}

Properties::~Properties()
{
  std::map< Type, Properties * >::iterator it = INSTANCES.begin();
  std::map< Type, Properties * >::iterator end = INSTANCES.end();

  for (; it != end; ++it)
    {
      if (it->second == this)
        {
          INSTANCES.erase(it);
          break;
        }
    }
}

std::string Properties::getValue(const std::string & name) const
{
  return getProperty(name);
}

