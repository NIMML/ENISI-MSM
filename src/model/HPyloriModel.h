#ifndef ENISI_MSM_H_PYLORI_MODEL_H
#define ENISI_MSM_H_PYLORI_MODEL_H

#include <Properties.h>
#include "../ValueLayer.h"
#include "agent/AgentGroupPackage.h"
#include "agent/Cytokines.h"
#include <boost/cstdint.hpp>

class HPModel
{ 
public:
  typedef repast::StickyBorders Borders;
  typedef repast::DiscreteValueLayer<double, Borders> ValueLayer;


  HPModel(const repast::Properties *);
  ~HPModel();

  void initSchedule(repast::ScheduleRunner &); 

protected:
  void setUpValueLayer();
  void setUpCytokines();
  void setUpCytokineMultipliers();

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

  ENISI::Compartment _lumen;
  ENISI::Compartment _epithelium;
  ENISI::Compartment _gastricLymphNode;
  ENISI::Compartment _laminaPropria;

  ENISIAgent::Context * _p_lumenCellContext;

  AgentGroupPackageProvider _provider;
  AgentGroupPackageReceiver _receiver;

  ValueLayer * _p_valueLayer;

  std::vector<Diffuser *> _valueDiffusers;

  std::map<std::string, int> _cytokineMultipliers; 
};

boost::uintmax_t strToUIntMax(const std::string);

#endif
