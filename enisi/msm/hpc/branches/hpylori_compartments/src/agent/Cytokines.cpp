#include "Cytokines.h"

void Cytokines::addCytoLayer(const std::string & name, GridValueLayer* gvl)
{
  cytoMap[name] = gvl;
}

double Cytokines::get(const std::string & name, const repast::Point<int> & loc) 
{
  return cytoMap[name]->getCoordValue(loc); 
}

Cytokines::CytoMap & Cytokines::map() { return cytoMap; }
