#ifndef ENISI_MSM_TCELLODE_H
#define ENISI_MSM_TCELLODE_H

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

class TcellODE
{
public:
  typedef std::vector< CRegisteredObjectName > * ReportItemVector;

  TcellODE();
  void setInitialConcentration(std::string, double);
  bool runTimeCourse();
  double getConcentration(std::string);

  static TcellODE& getInstance()
  {
    if (instance == NULL) instance = new TcellODE();

    return *instance;
  }

private:
  CReportDefinition * report;
  CCopasiDataModel * mpDataModel;
  CModel * mpModel;
  CTrajectoryTask * trajectoryTask;
  std::map<std::string, CMetab*> nameMetabs;

  void setUpReport();
  void setUpTask();
  static TcellODE * instance;
  bool DEBUG;
};
} // namespace ENISI

#endif
