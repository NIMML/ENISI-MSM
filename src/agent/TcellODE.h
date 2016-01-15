#ifndef ENISI_MSM_TCELLODE_H
#define ENISI_MSM_TCELLODE_H

#include <string>
#include <iostream>
#include <map>
#include <fstream> 


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

class TcellODE 
{
public:
  typedef std::vector<CRegisteredObjectName>* ReportItemVector;

  TcellODE();
  void setInitialConcentration(std::string, double);
  void runTimeCourse();
  double getConcentration(std::string);

  static TcellODE& getInstance() 
  {
    if (instance == NULL) instance = new TcellODE();
    return *instance;
  }
private:
  CReportDefinition* report;
  CCopasiDataModel* dataModel;
  CModel* model;
  CTrajectoryTask* trajectoryTask;
  std::map<std::string, CMetab*> nameMetabs;

  void setUpReport();
  void setUpTask();
  static TcellODE* instance;
  bool DEBUG;
};

#endif
