#ifndef ENISI_MSM_AGENT_CYTOKINES_H
#define ENISI_MSM_AGENT_CYTOKINES_H

#include "ENISIAgent.h"
#include "../ValueLayer.h" // repast::ValueLayer

class Cytokines 
{
public:
  typedef repast::DiscreteValueLayer<double, ENISIAgent::Borders> GridValueLayer;
  typedef std::map<std::string, GridValueLayer*> CytoMap;

  Cytokines() { }

  void addCytoLayer(const std::string &, GridValueLayer *);

  double & get(const std::string &, const repast::Point<int> &);

  static Cytokines & instance()
  {
    static Cytokines cytokines;
    return cytokines;
  }

  CytoMap & map();

protected:
private:
  CytoMap cytoMap;
};

#endif
