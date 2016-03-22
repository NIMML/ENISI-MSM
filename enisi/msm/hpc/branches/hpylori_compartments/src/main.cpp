#include <iostream>
#include <string>
#include <boost/mpi.hpp>
#include "model/HPyloriModel.h"
#include "RepastProcess.h"

int main(int argc, char** argv)
{
  boost::mpi::environment env(argc, argv);
  boost::mpi::communicator world;

  std::string configFile = argv[1];
  std::string propsFile  = argv[2];

  repast::Properties props(propsFile, argc, argv, &world);

  repast::RepastProcess::init(configFile, &world);

  std::string debugWaitString = props.getProperty("debug.wait");
  bool debugwait = 0;
  if (! debugWaitString.empty()) debugwait = repast::strToInt(debugWaitString);

  if(debugwait)
  {
    int rank = repast::RepastProcess::instance()->rank() ;

    if (rank == 0) 
    {
      std::cout << "Waiting for GDB to connect\n";
      std::cout << "After connecting, run the following commands:\n";
      std::cout << "(gdb) set debugwait = 0\n";
      std::cout << "(gdb) continue\n";
      std::cout << "\nConnect to GDB on the PIDs listed below\n";
    }

    printf("RANK %d PID %d\n", rank, getpid());
  }
  while (debugwait) ;

  HPModel model(&props);

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  model.initSchedule(runner);

  runner.run();
  repast::RepastProcess::instance()->done();

  return 0;
}
