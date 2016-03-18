#ifndef ENISI_MSM_MacrophageODE1
#define ENISI_MSM_MacrophageODE1

#include <string>
#include <map>
#include <vector>

class CReportDefinition;
class CCopasiDataModel;
class CModel;
class CTrajectoryTask;
class CMetab;
class CRegisteredObjectName;

namespace ENISI
{

class MacrophageODE1
{
public:
  typedef std::vector<CRegisteredObjectName>* ReportItemVector;

  MacrophageODE1();
  void setInitialConcentration(std::string, double);
  void runTimeCourse();
  double getConcentration(std::string);

  static MacrophageODE1& getInstance()
  {
    if (instance == NULL) instance = new MacrophageODE1();

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
  static MacrophageODE1 * instance;
  bool DEBUG;
};
} // name space ENISI

#endif // ENISI_MSM_MacrophageODE1
