#include <iostream>
#include <string>
#include <boost/mpi.hpp>
#include "model/HPyloriModel.h"
#include "repast_hpc/RepastProcess.h"
#include "grid/Properties.h"

// #define DEBUG_WAIT

int main(int argc, char** argv)
{
  int debugwait = 0;

#ifdef DEBUG_WAIT
  debugwait = 1;

  if(debugwait)
    {
      printf("PID %d\n", getpid());
    }
  while (debugwait) ;
#endif

  boost::mpi::environment env(argc, argv);
  boost::mpi::communicator world;

  std::string config = argv[1];
  size_t pos = config.find('=');
  config = config.substr(pos + 1);

  ENISI::Properties ConfigProperties(ENISI::Properties::config, config + "/config.props", argc, argv, &world);
  repast::RepastProcess::init(config + "/config.props", &world);

  ENISI::Properties RunProperties(ENISI::Properties::run, config + "/run.props", argc, argv, &world);

#ifndef DEBUG_WAIT
  if (!RunProperties.getValue("debug.wait", debugwait)) debugwait = 0;
#endif

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

  ENISI::Properties ModelProperties(ENISI::Properties::model, config + "/model.props", argc, argv, &world);

  ENISI::HPModel model;

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  model.initSchedule(runner);

  runner.run();

  repast::RepastProcess::instance()->done();

  return 0;
}
