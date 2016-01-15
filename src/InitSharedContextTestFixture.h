#ifndef ENISI_MSM_INIT_SHARED_CONTEXT_TEST_FIXTURE_H
#define ENISI_MSM_INIT_SHARED_CONTEXT_TEST_FIXTURE_H

#include "gmock/gmock.h"
#include "agent/AgentFactory.h"

using namespace testing;

class InitSharedContext: public Test 
{
public:
  const int _height;
  const int _width;
  repast::GridDimensions _dimensions;
  ENISI::Compartment _compartment;
  AgentFactory _factory;

  InitSharedContext() : _height(100), _width(100),
    _dimensions(repast::Point<double>(0, 0), 
	        repast::Point<double>(_width, _height)),
    _compartment(_dimensions)
    { }
  void SetUp() { }
  void TearDown() { }
};

#endif
