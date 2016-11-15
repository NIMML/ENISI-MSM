project(ENISI_MSM)
cmake_minimum_required(VERSION 2.8.8)

set(ENISI_MSM_DEPENDENCY_DIR "" CACHE PATH "Dependency Directory containing the required build dependencies" )
mark_as_advanced(ENISI_MSM_DEPENDENCY_DIR)

if ("${ENISI_MSM_DEPENDENCY_DIR}" STREQUAL "")
  message (FATAL_ERROR 
"--------------------------------------------------------------------------------
    Please specify the directory containing the required build dependecies with:
    -DENISI_MSM_DEPENDENCY_DIR=<...>
--------------------------------------------------------------------------------")
endif()

if(NOT EXISTS "${ENISI_MSM_DEPENDENCY_DIR}/include/copasi/copasi.h")
  message (FATAL_ERROR 
"--------------------------------------------------------------------------------
    The director ${ENISI_MSM_DEPENDENCY_DIR} does not contain the required files.
    Please specify the directory containing the required build dependecies with:
    -DENISI_MSM_DEPENDENCY_DIR=<...>
--------------------------------------------------------------------------------")
endif()

if (EXISTS "${ENISI_MSM_DEPENDENCY_DIR}/bin/mpicxx")
  set(MPI_CXX_COMPILER "${ENISI_MSM_DEPENDENCY_DIR}/bin/mpicxx")
  set(MPI_CXX_COMPILE_FLAGS "")
  set(MPI_CXX_INCLUDE_PATH "")
  set(MPI_CXX_LINK_FLAGS "-static")
  set(MPI_CXX_LIBRARIES "")
else()
  find_package(MPI REQUIRED)
endif()

message(STATUS 
"--------------------------------------------------------------------------------
  MPI_CXX_COMPILER        ${MPI_CXX_COMPILER}
  MPI_CXX_COMPILE_FLAGS   ${MPI_CXX_COMPILE_FLAGS}
  MPI_CXX_INCLUDE_PATH    ${MPI_CXX_INCLUDE_PATH}
  MPI_CXX_LINK_FLAGS      ${MPI_CXX_LINK_FLAGS}
  MPI_CXX_LIBRARIES       ${MPI_CXX_LIBRARIES}
--------------------------------------------------------------------------------")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin )

add_subdirectory(./src)

