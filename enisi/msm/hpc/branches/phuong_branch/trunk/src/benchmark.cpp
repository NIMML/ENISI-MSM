//#include "Benchmark.h"
#include <sys/time.h>  
#include <iostream>
#include <string>
#include <boost/mpi.hpp>
//#include "model/MucosalCD4ModelMultiCore.h"
#include "model/MucosalCD4ModelMultiCoreWithGroups.h"

void benchmarkModel(int &argc, char** argv) 
{

  std::string configFile = argv[1]; 
  std::string propsFile  = argv[2];

  repast::RepastProcess::init(configFile);
    
  boost::mpi::communicator world;

  repast::Properties* props =
    new repast::Properties(propsFile, argc, argv, &world);

  struct timeval timeStart,
		  timeEnd;
  gettimeofday(&timeStart, NULL);
  double t1=timeStart.tv_sec+(timeStart.tv_usec/1000000.0);  
 
// Slow as fuck code goes here
    //MucosalCD4ModelMultiCore* model = new MucosalCD4ModelMultiCore(props, &world);
    MucosalCD4ModelMultiCoreWithGroups* model = new MucosalCD4ModelMultiCoreWithGroups(props, &world);
      
    repast::ScheduleRunner& runner = 
      repast::RepastProcess::instance()->getScheduleRunner();
    
    model->init();
    model->initSchedule(runner);
    
    runner.run();
    
    repast::RepastProcess::instance()->done();

    //delete model;
// Slow as fuck code stops here

  gettimeofday(&timeEnd, NULL);
  double t2=timeEnd.tv_sec+(timeEnd.tv_usec/1000000.0);  
 
  if(repast::RepastProcess::instance()->rank() == 0) {
    std::string msg = props->getProperty("benchmark.msg");

    std::cout << msg << std::endl;
    std::printf("%.6lf seconds elapsed\n", t2-t1);
    //std::cout << "This effing slow piece of code took "
	      //<< ( (timeEnd.tv_sec - timeStart.tv_sec) * 1000000 + (timeEnd.tv_usec - timeStart.tv_usec) )
	      //<< " us to execute."
	      //<< std::endl;
  }

  delete props;
}

int main(int argc, char** argv)
{
  boost::mpi::environment env(argc, argv);

  benchmarkModel(argc, argv);

  return 0;
}
