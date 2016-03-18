/*
 * COPASI.h
 *
 *  Created on: Mar 15, 2016
 *      Author: shoops
 */

#ifndef ENISI_COPASI
#define ENISI_COPASI

#include <copasi/copasi.h>
#include <copasi/model/CCompartment.h>
#include <copasi/CopasiDataModel/CCopasiDataModel.h>
#include <copasi/utilities/CCopasiMessage.h>
#include <copasi/utilities/CCopasiMethod.h>
#include <copasi/utilities/CCopasiParameter.h>
#include <copasi/report/CCopasiStaticString.h> // CCopasiReportSeparator
#include <copasi/report/CCopasiRootContainer.h>
#include <copasi/utilities/CCopasiTask.h>
#include <copasi/model/CMetab.h>
#include <copasi/model/CModel.h>
#include <copasi/model/CModelValue.h> //CModelEntity
#include <copasi/model/CReaction.h>
#include <copasi/report/CCopasiObjectName.h> // CRegisteredObjectName
#include <copasi/report/CReportDefinition.h>
#include <copasi/report/CReportDefinitionVector.h>
#include <copasi/trajectory/CTrajectoryMethod.h>
#include <copasi/trajectory/CTrajectoryProblem.h>
#include <copasi/trajectory/CTrajectoryTask.h>

namespace ENISI
{

class COPASI
{
public:
  COPASI();
  virtual ~COPASI();

  static CCopasiDataModel * loadDataModel(const std::string &fileName);

private:
  static bool initialized;
};
} // namespace ENISI

#endif // ENISI_COPASI
