#ifndef DIFFUSER_TEST_DIFFUSERTEST_H_
#define DIFFUSER_TEST_DIFFUSERTEST_H_

#include "InitSharedContextTestFixture.h"
#include "diffuser/Diffuser.h" /* should use local modified ValueLayer.h */

extern const int DIFFUSION_TEST_START_VALUE;
extern const repast::Point<int> DIFFUSION_TEST_CENTER_PT;

extern repast::Point<int> northWestPt;
extern repast::Point<int> northEastPt;

extern repast::Point<int> southWestPt;
extern repast::Point<int> southEastPt;
       
extern repast::Point<int> northPt;
extern repast::Point<int> southPt;
extern repast::Point<int> eastPt;
extern repast::Point<int> westPt;
       
extern repast::Point<int> doubleWestPt;

void assertStepZeroDiffusionValuesAtCoord(ENISI::Diffuser & d);
void assertStepOneDiffusionValuesAtCoord(ENISI::Diffuser & d);
void assertStepTwoDiffusionValuesAtCoord(ENISI::Diffuser & d);

#endif
