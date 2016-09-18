#include "Cytokine.h"
#include "grid/Properties.h"

using namespace ENISI;

Cytokine::Cytokine(const std::string & name):
  mName(name),
  mInitialValue(0.0),
  mDiffusion(0.0),
  mDegradation(0.0),
  mIndex((size_t) - 1)
{
  const Properties * pProperties = Properties::instance(Properties::model);

  pProperties->getValue(mName + ".initialValue", mInitialValue);
  pProperties->getValue(mName + ".diffusion", mDiffusion);
  pProperties->getValue(mName + ".degradation", mDegradation);
}

Cytokine::~Cytokine()
{}

const std::string & Cytokine::getName() const
{
  return mName;
}

const double & Cytokine::getInitialValue() const
{
  return mInitialValue;
}

const double & Cytokine::getDiffusion() const
{
  return mDiffusion;
}

const double & Cytokine::getDegradation() const
{
  return mDegradation;
}

const size_t & Cytokine::getIndex() const
{
  return mIndex;
}

void Cytokine::setIndex(const size_t & index)
{
  mIndex = index;
}
