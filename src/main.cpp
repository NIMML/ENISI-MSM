#include <iostream>
#include <string>
#include <boost/mpi.hpp>
#include "model/HPyloriModel.h"
#include "repast_hpc/RepastProcess.h"
#include "grid/Properties.h"

int main(int argc, char** argv)
{
  boost::mpi::environment env(argc, argv);
  boost::mpi::communicator world;

  std::string configFile = argv[1];
  std::string propsFile  = argv[2];

  ENISI::Properties props(propsFile, argc, argv, &world);

  repast::RepastProcess::init(configFile, &world);

  int debugwait = 0;
  if (!ENISI::Properties::getValue("debug.wait", debugwait)) debugwait = 0;

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
      else
        {
          debugwait = 0;
        }

      printf("RANK %d PID %d\n", rank, getpid());
    }
  while (debugwait) ;

  ENISI::HPModel model;

  /*
  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  model.initSchedule(runner);

  runner.run();
  */

  repast::RepastProcess::instance()->done();

  return 0;
}
