#include "MucosalCD4ModelBase.h"

void MucosalCD4ModelBase::setUpCytokines()
{
  double evaporationConst = 0.95,
	 diffusionConst = 0.6;
  bool toroidal = false;

  cytokines["IL6"] = new ValueLayer("IL6", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytokines["IL6"], evaporationConst, diffusionConst, toroidal));

  cytokines["TGFb"] = new ValueLayer("TGFb", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytokines["TGFb"], 0.98, diffusionConst, toroidal));

  cytokines["IL12"] = new ValueLayer("IL12", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytokines["IL12"], 0.98, diffusionConst, toroidal));

  cytokines["IL17"] = new ValueLayer("IL17", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytokines["IL17"], 0.98, diffusionConst, toroidal));

  cytokines["IL10"] = new ValueLayer("IL10", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytokines["IL10"], 0.98, diffusionConst, toroidal));

  cytokines["IFNg"] = new ValueLayer("IFNg", gridDimensions, true);
  valueDiffusers.push_back(
    new Diffuser(cytokines["IFNg"], 0.98, diffusionConst, toroidal));

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

