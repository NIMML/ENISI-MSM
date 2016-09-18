/*
 * COPASI.cpp
 *
 *  Created on: Mar 15, 2016
 *      Author: shoops
 */

#define COPASI_MAIN

#include "COPASI.h"

namespace ENISI
{

// static
bool COPASI::initialized = false;

// static
CCopasiDataModel * COPASI::loadDataModel(const std::string &fileName)
{
  if (!initialized)
    {
      CCopasiRootContainer::init(0, NULL);
      initialized = true;
    }

  CCopasiDataModel * pDataModel = CCopasiRootContainer::addDatamodel();
  bool success = true;

  try
    {
      // load the model without progress report
      success = pDataModel->loadModel(fileName, NULL);
    }

  catch (...)
    {
      success = false;
    }

  if (!success)
    {
      std::cerr << "Error while loading the model from file named: \"" << fileName << "\"." << std::endl;

      pdelete(pDataModel);
    }

  return pDataModel;
}

COPASI::COPASI()
{}

COPASI::~COPASI()
{}
} /* namespace ENISI */
