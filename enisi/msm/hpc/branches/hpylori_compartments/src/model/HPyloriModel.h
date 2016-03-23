#ifndef ENISI_MSM_H_PYLORI_MODEL_H
#define ENISI_MSM_H_PYLORI_MODEL_H

#include <repast_hpc/Properties.h>
#include "../ValueLayer.h"
#include "agent/AgentGroupPackage.h"
#include "agent/Cytokines.h"
#include "grid/Borders.h"

#include <boost/cstdint.hpp>

class HPModel
{ 
public:
  typedef ENISI::Borders Borders;
  typedef repast::DiscreteValueLayer<double, Borders> ValueLayer;


  HPModel(const repast::Properties *);
  ~HPModel();

  void initSchedule(repast::ScheduleRunner &); 

protected:
  void setUpValueLayer();
  void setUpCytokines();

  void createAgentGroup(const std::string & num, const std::string & grp);

  void requestAgents();
  void act();
  void syncAgents();

  void diffuse();
  void summation();

  void updateReferenceDiffuserGrid();

  void recordResults();
private:
  const repast::Properties * _p_props;

  const int _height;
  const int _width;

  repast::GridDimensions _dimensions;

  ValueLayer * _p_valueLayer;

  std::vector<ENISI::Diffuser *> _valueDiffusers;
};

boost::uintmax_t strToUIntMax(const std::string);

#endif
