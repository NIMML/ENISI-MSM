/*
 * LocalFile.cpp
 *
 *  Created on: Apr 8, 2016
 *      Author: shoops
 */

#include "LocalFile.h"
#include "repast_hpc/RepastProcess.h"
#include "grid/Properties.h"

#include <sstream>

using namespace ENISI;

// static
std::map< std::string, LocalFile * > LocalFile::INSTANCES;

// static
std::ofstream & LocalFile::debug()
{
  return LocalFile::instance("", "log")->stream();
}

// static
LocalFile * LocalFile::instance(const std::string & name,
                                const std::string extension)
{
  std::map< std::string, LocalFile * >::iterator found = INSTANCES.find(name);

  if (found == INSTANCES.end())
    {
      found = INSTANCES.insert(std::make_pair(name, new LocalFile(name, extension))).first;
    }

  return found->second;
}

// static
void LocalFile::close()
{
  std::map< std::string, LocalFile * >::iterator it = INSTANCES.begin();
  std::map< std::string, LocalFile * >::iterator end = INSTANCES.end();

  for (; it != end; ++it)
    {
      delete it->second;
    }
}

LocalFile::LocalFile(const std::string & name, const std::string extension):
  mOstream()
{
  std::string config;
  Properties::instance(Properties::model)->getValue("config", config);

  std::stringstream Name;
  Name << config << "/" << name << "_" << repast::RepastProcess::instance()->rank() << "." << extension;

  mOstream.open(Name.str().c_str());
}

// virtual
LocalFile::~LocalFile()
{
  mOstream.close();
}

std::ofstream & LocalFile::stream()
{
  return mOstream;
}
