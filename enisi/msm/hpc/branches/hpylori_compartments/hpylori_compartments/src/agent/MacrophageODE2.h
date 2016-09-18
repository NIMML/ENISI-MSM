#ifndef ENISI_MSM_MacrophageODE2
#define ENISI_MSM_MacrophageODE2

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

class MacrophageODE2
{
public:
  typedef std::vector<CRegisteredObjectName>* ReportItemVector;

  MacrophageODE2();
  void setInitialConcentration(std::string, double);
  void runTimeCourse();
  double getConcentration(std::string);

  static MacrophageODE2& getInstance()
  {
    if (instance == NULL) instance = new MacrophageODE2();

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
  static MacrophageODE2 * instance;
  bool DEBUG;
};
} // name space ENISI

#endif // ENISI_MSM_MacrophageODE2
