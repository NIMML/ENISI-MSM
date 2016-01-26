#include "InitSharedContextTestFixture.h"

class ScheduleTestFixture: public InitSharedContext 
{ 
public:
  int _rank, _worldSize;
  ScheduleTestFixture() : 
    _rank(repast::RepastProcess::instance()->rank()),
    _worldSize(repast::RepastProcess::instance()->worldSize())
  { 
    repast::RepastProcess::instance()->done();
    repast::RepastProcess::clearInstance();
    repast::RepastProcess::init("");
  }
};
