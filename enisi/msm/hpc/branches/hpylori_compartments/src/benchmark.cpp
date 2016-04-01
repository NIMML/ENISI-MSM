#include <sys/time.h>  
#include <iostream>
#include <string>
#include <boost/mpi.hpp>
#include "model/HPyloriModel.h"
#include "repast_hpc/RepastProcess.h"

void benchmarkModel(int &argc, char** argv) 
{

  std::string configFile = argv[1]; 
  std::string propsFile  = argv[2];

  repast::RepastProcess::init(configFile);
    
  boost::mpi::communicator world;

  repast::Properties props(propsFile, argc, argv, &world);

  struct timeval timeStart,
		  timeEnd;
  gettimeofday(&timeStart, NULL);
  double t1=timeStart.tv_sec+(timeStart.tv_usec/1000000.0);  
 
// Code to benchmark starts here
  ENISI::HPModel model;

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  model.initSchedule(runner);

  runner.run();
  repast::RepastProcess::instance()->done();

// Code to benchmark stops here

  gettimeofday(&timeEnd, NULL);
  double t2=timeEnd.tv_sec+(timeEnd.tv_usec/1000000.0);  
 
  if(repast::RepastProcess::instance()->rank() == 0) {
    std::string msg = props.getProperty("benchmark.msg");

    std::cout << msg << std::endl;
    std::printf("%.6lf seconds elapsed\n", t2-t1);
  }
}

int main(int argc, char** argv)
{
  boost::mpi::environment env(argc, argv);

  benchmarkModel(argc, argv);

  return 0;
}
