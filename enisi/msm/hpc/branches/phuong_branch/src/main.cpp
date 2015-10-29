#include <iostream>
#include <string>
#include <boost/mpi.hpp>
#include "model/MucosalCD4ModelSingleCore.h"
#include "model/MucosalCD4ModelMultiCore.h"
#include "model/MucosalCD4ModelMultiCoreWithGroups.h"
#include "RepastProcess.h"

int main(int argc, char** argv)
{
  std::string configFile = argv[1]; 
  std::string propsFile  = argv[2];
  
  boost::mpi::environment env(argc, argv);
  boost::mpi::communicator world;

  repast::RepastProcess::init(configFile);

  repast::Properties* props =
    new repast::Properties(propsFile, argc, argv, &world);

  //MucosalCD4ModelSingleCore* model = 
    //new MucosalCD4ModelSingleCore(props, &world);
   //MucosalCD4ModelMultiCore* model = 
    //new MucosalCD4ModelMultiCore(props, &world);
   MucosalCD4ModelMultiCore* model = 
    new MucosalCD4ModelMultiCoreWithGroups(props, &world);

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();
  
  model->init();
  model->initSchedule(runner);
  
  runner.run();
  
  repast::RepastProcess::instance()->done();

  //Deleting model causes a segfault. Kept for reference
  //delete model; 
  delete props;

  return 0;
}
