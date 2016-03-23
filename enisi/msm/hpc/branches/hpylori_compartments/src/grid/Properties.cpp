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
repast::Properties * Properties::pInstance;

// static
const repast::Properties * Properties::instance()
{
  return pInstance;
}

// static
std::string Properties::getValue(const std::string & name)
{
  if (pInstance == NULL) return "";

  return pInstance->getProperty(name);
}

Properties::Properties():
  repast::Properties()
{}

Properties::Properties(const std::string & file, int argc, char** argv, boost::mpi::communicator* comm, int maxPropFileSize):
  repast::Properties(file, argc, argv, comm, maxPropFileSize)
{
  if (pInstance == NULL)
    {
      pInstance = this;
    }
}

Properties::~Properties()
{
  if (pInstance == this)
    {
      pInstance = NULL;
    }
}

