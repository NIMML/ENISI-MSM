#ifndef ENISI_MSM_INIT_SHARED_CONTEXT_TEST_FIXTURE_H
#define ENISI_MSM_INIT_SHARED_CONTEXT_TEST_FIXTURE_H

#include "gmock/gmock.h"
#include "agent/AgentFactory.h"

using namespace testing;

class InitSharedContext: public Test 
{
public:
  const int _oriX;
  const int _oriY;
  const int _extentX;
  const int _extentY;
  repast::GridDimensions _dimensions;
  ENISI::Compartment _compartment;
  AgentFactory _factory;

  InitSharedContext() : _oriX(0), _oriY(0), _extentX(100), _extentY(100),
    _dimensions(repast::Point<double>(_oriX, _oriY), 
	        repast::Point<double>(_extentX, _extentY)),
    _compartment(_dimensions)
    { }
  void SetUp() { }
  void TearDown() { }
};

#endif
