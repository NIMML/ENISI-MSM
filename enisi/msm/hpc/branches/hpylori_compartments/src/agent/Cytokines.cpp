#include "Cytokines.h"

using namespace ENISI;

void Cytokines::addCytoLayer(const std::string & name, GridValueLayer* gvl)
{
  cytoMap[name].first = gvl;
}

double Cytokines::get(const std::string & name, const repast::Point<int> & loc)
{
  return cytoMap[name].first->getCoordValue(loc);
}

Cytokines::CytoMap & Cytokines::map() {return cytoMap;}
