#include "ImmuneCell.h"

void ImmuneCell::addCytoLayer(std::string name, GridValueLayer* gvl)
{
  cytoMap[name] = gvl;
}

