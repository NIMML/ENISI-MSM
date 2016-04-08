/*
 * DataSetBuilder.cpp
 *
 *  Created on: Apr 7, 2016
 *      Author: shoops
 */

#include "DataSetBuilder.h"

#include "repast_hpc/RepastProcess.h"

using namespace ENISI;

DataSetBuilder::DataSetBuilder(const std::string & file):
  SVDataSetBuilder(file, "\t", repast::RepastProcess::instance()->getScheduleRunner().schedule())
{}

DataSetBuilder::~DataSetBuilder()
{}


