cmake_minimum_required(VERSION 2.8.8)
include(ExternalProject)

set(REPAST_INSTALL_DIR ${REPAST_DIR}/INSTALLATION)
set(REPAST_SRC_DIR ${REPAST_DIR}/src/repast_hpc)

ExternalProject_Add(project_repast
  DOWNLOAD_DIR      ${DEPS_DIR}
  LOG_DOWNLOAD 1   # Wrap download in script to log output
  DOWNLOAD_COMMAND  tar -C src/project_repast -xvf RHPC_2.0.tar.gz --strip-components=2
  PREFIX ${DEPS_DIR}
  CONFIGURE_COMMAND ""

  PATCH_COMMAND ${CMAKE_COMMAND} -DBUILD_STEP=patch
    -DREPAST_SRC_DIR=${REPAST_SRC_DIR}
    -DPATCH_DIR=${PROJECT_SOURCE_DIR}/patches
    -DLOG_DIR=${CMAKE_BINARY_DIR}
    -P ${DEPS_DIR}/project_repast.cmake

  #--Build step-----------------
  BUILD_IN_SOURCE 1 # Use source dir for build dir
  BUILD_COMMAND ""

  INSTALL_COMMAND cmake -DBUILD_STEP=install -DWORK_DIR=${REPAST_INSTALL_DIR} 
    -DLOG_DIR=${CMAKE_BINARY_DIR}
    -DREPAST_EXT_DIR=${REPAST_EXT_DIR}
    -P ${DEPS_DIR}/project_repast.cmake
)

# ExternalProject_Add(project_visit
#   DOWNLOAD_DIR      ${DEPS_DIR}
#   LOG_DOWNLOAD 1   # Wrap download in script to log output
#   URL http://portal.nersc.gov/project/visit/releases/2.9.2/visit2.9.2.tar.gz
#   PREFIX ${DEPS_DIR}
#   CONFIGURE_COMMAND ""
# 
#   PATCH_COMMAND ${CMAKE_COMMAND} -DBUILD_STEP=patch
#     -DVISIT_SVN_BIN_DIR=${VISIT_SVN_BIN_DIR}
#     -DPATCH_DIR=${PROJECT_SOURCE_DIR}/patches
#     -DLOG_DIR=${CMAKE_BINARY_DIR}
#     -P ${DEPS_DIR}/project_visit.cmake
# 
#   #--Build step-----------------
#   BUILD_IN_SOURCE 1 # Use source dir for build dir
# 
#   BUILD_COMMAND cmake  -DBUILD_STEP=build
#     -DDEPS_DIR=${DEPS_DIR}
#     -DVISIT_DIR=${VISIT_DIR}
#     -DVISIT_SVN_BIN_DIR=${VISIT_SVN_BIN_DIR}
#     -DLOG_DIR=${CMAKE_BINAY_DIR}
#     -P ${DEPS_DIR}/project_visit.cmake
# 
#   INSTALL_COMMAND ""
# )

#ExternalProject_Add_Step(project_visit after_install
  #COMMAND cmake -DBUILD_STEP=get_visit_platform.sh -DVISIT_DIR=${VISIT_DIR}
  #DEPENDEES mkdir update patch download configure build install 
  #ALWAYS 1
  #)

if (APPLE)
  set(COPASI_DEPS_BUILD_SCRIPT ./createOSX.sh)
else()
  set(COPASI_DEPS_BUILD_SCRIPT ./createLinux.sh)
endif()

ExternalProject_Add(project_copasi_deps
  DOWNLOAD_DIR      ${DEPS_DIR}
  LOG_DOWNLOAD 1   # Wrap download in script to log output
  GIT_REPOSITORY https://github.com/copasi/copasi-dependencies
  PREFIX ${DEPS_DIR}

  UPDATE_COMMAND "" # Prevent a GIT PULL request
  CONFIGURE_COMMAND ""

  #--Build step-----------------
  LOG_BUILD 1       # Wrap build in script to log output
  BUILD_IN_SOURCE 1 # Use source dir for build dir
  BUILD_COMMAND ${COPASI_DEPS_BUILD_SCRIPT}

  INSTALL_COMMAND ""
)

ExternalProject_Add(project_copasi
  DOWNLOAD_DIR      ${DEPS_DIR}
  LOG_DOWNLOAD 1   # Wrap download in script to log output
  GIT_REPOSITORY https://github.com/copasi/COPASI
  GIT_TAG Build-104
  PREFIX ${DEPS_DIR}

  UPDATE_COMMAND "" # Prevent a GIT PULL request

  #--Configure step-----------------
  #!!DON'T UNCOMMENT LOG_CONFIGURE FOR THIS PROJECT!!!!!
  #--Doing so will break the configure step on Shadowfax--
  #LOG_CONFIGURE 1      # Wrap configure in script to log output

  CONFIGURE_COMMAND cmake -DBUILD_GUI=OFF
    -DCMAKE_INSTALL_PREFIX=./copasi_install
    -DCOPASI_DEPENDENCY_DIR=${DEPS_DIR}/src/project_copasi_deps/bin
    ../project_copasi &> ${CMAKE_BINARY_DIR}/project_copasi-configure.log


  #--Build step-----------------
  LOG_BUILD 1       # Wrap build in script to log output
  BUILD_COMMAND make

  #--Install step-----------------
  LOG_INSTALL 1       # Wrap install in script to log output
  INSTALL_COMMAND make install
)

add_dependencies(project_copasi project_copasi_deps)

