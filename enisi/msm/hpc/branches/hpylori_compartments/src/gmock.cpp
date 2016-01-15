#include "gmock/gmock.h"
#include "RepastProcess.h" // repast::RepastProcess, repast::SharedContext
#include "Properties.h" // repast::RepastProcess, repast::SharedContext

int main(int argc, char** argv) 
{
  boost::mpi::environment env(argc, argv);
  boost::mpi::communicator world;

  std::string configFile = argv[1];
  std::string propsFile  = argv[2];

  repast::Properties props(propsFile, argc, argv, &world);

  repast::RepastProcess::init(configFile);

  std::string debugWaitString = props.getProperty("debug.wait");
  bool debugwait = 0;
  if (! debugWaitString.empty()) debugwait = repast::strToInt(debugWaitString);

  if(debugwait)
  {
    printf("%d ", getpid());
  }
  while (debugwait) ;

  repast::RepastProcess::instance()->done();

  testing::InitGoogleMock(&argc, argv);
  return RUN_ALL_TESTS();
}
