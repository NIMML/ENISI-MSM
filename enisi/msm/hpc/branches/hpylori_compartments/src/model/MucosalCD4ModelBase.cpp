#include "MucosalCD4ModelBase.h"

void MucosalCD4ModelBase::setUpCytokines()
{
  double evaporation = 0.98,
	 diffusion = 0.6;
  bool toroidal = false;

  ENISI::Cytokines::CytoMap & cytomap = ENISI::Cytokines::instance().map();

  ENISI::DiffuserLayer * p_diffusionLayer = _p_compartment->newDiffuserLayer();

  cytomap["IL6"].first = new ENISI::Diffuser(
      p_diffusionLayer, 0.95, diffusion, toroidal);
  valueDiffusers.push_back(cytomap["IL6"].first);

  cytomap["TGFb"].first = new ENISI::Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  valueDiffusers.push_back(cytomap["TGFb"].first);

  cytomap["IL12"].first = new ENISI::Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  valueDiffusers.push_back(cytomap["IL12"].first);

  cytomap["IL17"].first = new ENISI::Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  valueDiffusers.push_back(cytomap["IL17"].first);

  cytomap["IL10"].first = new ENISI::Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  valueDiffusers.push_back(cytomap["IL10"].first);

  cytomap["IFNg"].first = new ENISI::Diffuser(
      p_diffusionLayer, evaporation, diffusion, toroidal);
  valueDiffusers.push_back(cytomap["IFNg"].first);

  setUpCytokineMultipliers();
  summation();
}

void MucosalCD4ModelBase::setUpCytokineMultipliers()
{
  /* Yongguo used these values to make the model fit the data. 
  * They don't have any inherent meaning otherwise */
  cytokineMultipliers["IL6"] = 10000;
  cytokineMultipliers["TGFb"] = 100;
  cytokineMultipliers["IL12"] = 1;
  cytokineMultipliers["IL10"] = 0;
  cytokineMultipliers["IL17"] = 0;
  cytokineMultipliers["IFNg"] = 0;
}

MucosalCD4ModelBase::~MucosalCD4ModelBase() 
{
  for (size_t i = 0; i < valueDiffusers.size(); ++i) 
  {
    delete valueDiffusers[i];
  }

  delete _p_compartment;
}

void MucosalCD4ModelBase::diffuse() 
{
  for (size_t i = 0; i < valueDiffusers.size(); ++i) 
  {
    valueDiffusers[i]->diffuse();
  }
}

void MucosalCD4ModelBase::summation() 
{
 for (int x = 0; x < width; ++x) 
 {
    for (int y = 0; y < height; ++y) 
    {
      double value = 0.0f;
      for(std::map<std::string, ValueLayer*>::iterator it = cytokines.begin(); 
	  it != cytokines.end(); it++) 
      {
	std::string cytokineName = it->first;
	ValueLayer* cytokineValueLayer = it->second;

	int currentVal = cytokineValueLayer->get(Point<int>(x, y));
	int multiplier = cytokineMultipliers[cytokineName];
	value += currentVal * multiplier;
      }
      vl->set(value, Point<int>(x, y));
    }
  }
}

void MucosalCD4ModelBase::recordResults()
{
 if(repast::RepastProcess::instance()->rank() == 0){
    props->putProperty("Result","Passed");
    std::vector<std::string> keyOrder;
    keyOrder.push_back("RunNumber");
    keyOrder.push_back("stop.at");
    keyOrder.push_back("Result");
    props->writeToSVFile("./output/results.csv", keyOrder);
  }
}

void MucosalCD4ModelBase::createBacteria(int count)
{
  ENISI::AgentFactory factory;

  for (int i = 0; i < count; i++) 
  {
    //TODO deal with raw pointer
    Bacteria * b = (Bacteria *) factory.create("Bacteria", _p_compartment);
    /* 1/2 of bacteria created should be infectious (the default) while the
     * other 1/2 should be tolerogenic */
    if (i >= count/2) { b->setState(ENISI::AgentState::TOLEGENIC); }
  }
}

void MucosalCD4ModelBase::createTcells(int count)
{
  ENISI::AgentFactory factory;

  for (int i = 0; i < count; i++) 
  {
    Tcell * t = (Tcell *) factory.create("Tcell", _p_compartment); //TODO deal with raw pointer

    t->addCytoLayer("IL6", cytokines["IL6"]);
    t->addCytoLayer("IL12", cytokines["IL12"]);
    t->addCytoLayer("TGFb", cytokines["TGFb"]);
    t->addCytoLayer("IL17", cytokines["IL17"]);
    t->addCytoLayer("IL10", cytokines["IL10"]);
    t->addCytoLayer("IFNg", cytokines["IFNg"]);
  }
}

void MucosalCD4ModelBase::createDendritics(int count)
{
  ENISI::AgentFactory factory;

  for (int i = 0; i < count; i++) 
  {
    //TODO deal with raw pointer
    Dendritics * d = (Dendritics *) factory.create("Dendritics", _p_compartment);
    d->addCytoLayer("IL6",  cytokines["IL6"]);
    d->addCytoLayer("IL12", cytokines["IL12"]);
    d->addCytoLayer("TGFb", cytokines["TGFb"]);
  }

}

