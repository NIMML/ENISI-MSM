#include <iostream>
#include <string>
#include <boost/mpi.hpp>
#include "model/HPyloriModel.h"
#include "repast_hpc/RepastProcess.h"
#include "grid/Properties.h"
#include <time.h>

#ifdef WIN32
# ifndef _USE_MATH_DEFINES
# define _USE_MATH_DEFINES 1
# endif // _USE_MATH_DEFINES
# ifndef WIN32_LEAN_AND_MEAN
# define WIN32_LEAN_AND_MEAN
# endif // WIN32_LEAN_AND_MEAN
# include <windows.h>
#else
# include <unistd.h>
# include <sys/syscall.h>
#endif // WIN32

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

  boost::uint32_t seed;
  if (!RunProperties.getValue("seed", seed))
    {
      boost::uint32_t ThreadId = 0;

#ifdef WIN32
      ThreadId = (boost::uint32_t)(GetCurrentThreadId() & 0xffffffffUL);
#elif defined(SYS_thread_selfid)
      ThreadId = (boost::uint32_t)(::syscall(SYS_thread_selfid) & 0xffffffffUL);
#elif defined(SYS_gettid)
      ThreadId = (boost::uint32_t)(::syscall(SYS_gettid) & 0xffffffffUL);
#elif defined(SYS_getthrid)
      ThreadId = (boost::uint32_t)(syscall(SYS_getthrid) & 0xffffffffUL);
#endif

      // Invert Byte order so that we do not have accidental cancellations since both time and thread id are incremented.
      ThreadId = (ThreadId & 0x000000ffUL) << 24 | (ThreadId & 0x0000ff00UL) << 8 |
        (ThreadId & 0x00ff0000UL) >> 8 | (ThreadId & 0xff000000UL) >> 24;

      time_t Seconds;
      time(&Seconds);

      boost::uint32_t Time = (boost::uint32_t)(Seconds & 0xffffffffUL);

      // We use XOR so that we do not favor set or unset bits.
      seed = ThreadId ^ Time;
    }
  
  
  repast::Random::initialize(seed * repast::RepastProcess::instance()->rank());
  
  ENISI::Properties ModelProperties(ENISI::Properties::model, config + "/model.props", argc, argv, &world);

  ENISI::HPModel model;

  repast::ScheduleRunner& runner = 
    repast::RepastProcess::instance()->getScheduleRunner();

  model.initSchedule(runner);

  runner.run();

  repast::RepastProcess::instance()->done();

  return 0;
}
