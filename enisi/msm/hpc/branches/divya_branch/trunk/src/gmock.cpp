#include "gmock/gmock.h"
#include "RepastProcess.h" // repast::RepastProcess, repast::SharedContext

int main(int argc, char** argv) 
{
  boost::mpi::environment env(argc, argv);

  std::string configFile = "";
  repast::RepastProcess::init(configFile);
  repast::RepastProcess::instance()->done();

  testing::InitGoogleMock(&argc, argv);
  return RUN_ALL_TESTS();
}
