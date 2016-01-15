project(ENISI_MSM)
cmake_minimum_required(VERSION 2.8.8)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin )


set(DEPS_DIR ${PROJECT_SOURCE_DIR}/deps)

set(REPAST_DIR ${DEPS_DIR}/src/project_repast)
set(REPAST_EXT_DIR ${REPAST_DIR}/ext)
set(MPI_BIN_DIR ${REPAST_EXT_DIR}/MPICH/bin)

set(VISIT_DIR ${DEPS_DIR}/src/project_visit)
set(VISIT_SVN_BIN_DIR ${VISIT_DIR}/src/svn_bin) 

add_subdirectory(./deps)

execute_process(
  COMMAND bash ./scripts/get_visit_platform.sh 
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  OUTPUT_VARIABLE PLATFORM)

add_subdirectory(./src)

enable_testing()
add_test(
  NAME googlemock
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  COMMAND bash ${PROJECT_SOURCE_DIR}/gmock.sh
)
