#ifndef ENISI_MSM_INIT_SHARED_CONTEXT_TEST_FIXTURE_H
#define ENISI_MSM_INIT_SHARED_CONTEXT_TEST_FIXTURE_H

#include "gmock/gmock.h"
#include "ValueLayer.h"
#include "GridComponents.h" // repast::StickyBorders repast::SimpleAdder
#include "agent/ENISIAgent.h"

using namespace testing;

class InitSharedContext: public Test 
{
public:
  repast::SharedContext<ENISIAgent> *global_context;
  repast::GridDimensions global_gridDims;

  void SetUp() 
  {
    const int height = 100;
    const int width = 100;

    global_gridDims = repast::GridDimensions(
      repast::Point<double>(0, 0), repast::Point<double>(width, height)
    );

    boost::mpi::communicator* world 
      = repast::RepastProcess::instance()->getCommunicator();
    global_context = new repast::SharedContext<ENISIAgent>(world);

    int buffer = 1; // how much one grid overlaps into another
    std::vector<int> processDims;
    processDims.push_back(1);
    processDims.push_back(1);

    repast::GridDimensions global_gridDims(
      repast::Point<double>(0, 0), repast::Point<double>(width, height)
    );

    const std::string spaceName = "space";
    ENISIAgent::Space* space = 
      new ENISIAgent::Space(spaceName,global_gridDims, processDims, buffer, world);

    const std::string gridName = "grid";
    ENISIAgent::Grid* grid = 
      new ENISIAgent::Grid(gridName,global_gridDims, processDims, buffer, world);

    global_context->addProjection(space);
    global_context->addProjection(grid);
  }
  void TearDown() { }
};

#endif
