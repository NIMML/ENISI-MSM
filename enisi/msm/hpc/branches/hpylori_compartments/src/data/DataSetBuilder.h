/*
 * DataSetBuilder.h
 *
 *  Created on: Apr 7, 2016
 *      Author: shoops
 */

#ifndef GRID_DATASETBUILDER_H_
#define GRID_DATASETBUILDER_H_

#include "repast_hpc/SVDataSetBuilder.h"

namespace ENISI
{

class DataSetBuilder : public repast::SVDataSetBuilder
{
public:
  DataSetBuilder(const std::string & file);

  virtual ~DataSetBuilder();
};

} /* namespace ENISI */

#endif /* GRID_DATASETBUILDER_H_ */
