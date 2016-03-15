#ifndef ENISI_MSM_AGENT_CYTOKINES_H
#define ENISI_MSM_AGENT_CYTOKINES_H

#include "ENISIAgent.h"
#include "../diffuser/Diffuser.h" // repast::ValueLayer
#include "../compartment/Compartment.h"

namespace ENISI {

class Cytokines 
{
public:
  //typedef repast::DiscreteValueLayer<double, ENISI::Compartment::Borders> GridValueLayer;
  typedef Diffuser GridValueLayer;
  typedef std::map< std::string, std::pair< GridValueLayer *, double > > CytoMap;

  Cytokines() { }

  void addCytoLayer(const std::string &, GridValueLayer *);

  double get(const std::string &, const repast::Point<int> &);

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

} // namespace ENISI


#endif
