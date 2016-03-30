SET( OSX_LINK_FLAGS "-framework Cocoa")

if (APPLE)
  set( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${OSX_LINK_FLAGS}" )
endif(APPLE)

set(CMAKE_CXX_COMPILER ${MPI_BIN_DIR}/mpicxx)

set(BOOST_DIR ${REPAST_DIR}/ext/Boost/Boost_1.54)
set(GMOCK_DIR ${DEPS_DIR}/src/project_googlemock)

set(VISIT_LIBS_DIR ${VISIT_SVN_BIN_DIR}/visit)

execute_process(
  COMMAND bash ./scripts/get_visit_platform.sh "${VISIT_DIR}"
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  OUTPUT_VARIABLE PLATFORM)

set(ZLIB_DIR ${VISIT_LIBS_DIR}/zlib/1.2.7/${PLATFORM})
set(SZIP_DIR ${VISIT_LIBS_DIR}/szip/2.1/${PLATFORM})
set(HDF5_DIR ${VISIT_LIBS_DIR}/hdf5/1.8.7/${PLATFORM})
set(SILO_DIR ${VISIT_LIBS_DIR}/silo/4.10.2/${PLATFORM})

# SYSTEM option allows compiler to skip warnings for includes
# (necessary when using -Wall compiler flag with 3rd-party libs)
include_directories(SYSTEM
  ${PROJECT_SOURCE_DIR}/src
  ${ZLIB_DIR}/include
  ${SZIP_DIR}/include
  ${HDF5_DIR}/include
  ${SILO_DIR}/include
  ${BOOST_DIR}/include
  ${REPAST_DIR}/include
  ${DEPS_DIR}/src/project_copasi
  ${DEPS_DIR}/src/project_copasi/copasi
  ${GMOCK_DIR}/include
  ${GMOCK_DIR}/gtest/include
)

link_directories(
  ${ZLIB_DIR}/lib
  ${SZIP_DIR}/lib
  ${HDF5_DIR}/lib
  ${SILO_DIR}/lib
  ${BOOST_DIR}/lib
  ${REPAST_DIR}/lib
  ${DEPS_DIR}/src/project_copasi-build/copasi
  ${DEPS_DIR}/src/project_copasi_deps/bin/lib
  ${GMOCK_DIR}/lib/.libs ${GMOCK_DIR}/gtest/lib/.libs
)

file(GLOB_RECURSE ALL_SRCS
    "*.h"
    "*.cpp"
)

list(REMOVE_ITEM ALL_SRCS 
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/DendriticsTest.cpp" 
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/Bacteria.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/ENISIAgentTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/AgentFactoryTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/Tcell.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/RepastHPCDemoAgentPackage.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/TcellTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/TcellGroupTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/AgentFactory.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/BacteriaTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/CellGroup.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/ImmuneCell.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/Dendritics.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/ImmuneCellTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/agent/AgentGroupPackage.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/model/HPyloriModelTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/model/MucosalCD4ModelMultiCoreWithGroups.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/model/ModelBuilderTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/model/MucosalCD4ModelMultiCore.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/model/MucosalCD4ModelBase.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/model/MucosalCD4ModelSingleCore.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/test/CellGroupCompartmentMovementTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/test/CellGroupSyncTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/compartment/CompartmentTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/diffuser/DiffuserPackage.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/diffuser/Diffuser.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/diffuser/ParallelDiffuser.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/diffuser/test/ParallelDiffuserTest.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/diffuser/test/DiffuserTest.cpp"
  )

set(MAINS "main" "benchmark" "gmock" "test")
foreach(f ${MAINS}) 
  list(REMOVE_ITEM ALL_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/${f}.cpp")
endforeach()

# Add shared object directory so cmake doesn't keep duplicating the build
# process in each *main.dir/ subdirectory
add_library(ENISI OBJECT ${ALL_SRCS})
add_dependencies(ENISI project_repast project_visit project_copasi)

set(COPASI_DEP_LIBS raptor sbml-static lapack blas sedml-static expat)
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
  set( COPASI_DEP_LIBS  "${COPASI_DEP_LIBS} -lf2c" )
endif()

set(COPASI_LIBS COPASISE ${COPASI_DEP_LIBS})

set(REPAST_LIBS repast_hpc-2.0)

set(SILO_DEP_LIBS sz hdf5 z m)
set(SILO_LIBS siloh5 ${SILO_DEP_LIBS})

set(BOOST_LIBS boost_mpi-mt-s boost_serialization-mt-s boost_system-mt-s
  boost_filesystem-mt-s
  )

set(GMOCK_LIBS gmock gtest)

set(ALL_LIBS ${COPASI_LIBS} ${REPAST_LIBS} ${SILO_LIBS} ${BOOST_LIBS}
  ${GMOCK_LIBS}
  )

add_executable(main "main.cpp" $<TARGET_OBJECTS:ENISI>)
target_link_libraries(main ${ALL_LIBS})

add_executable(testmain "gmock.cpp" $<TARGET_OBJECTS:ENISI>)
target_link_libraries(testmain ${ALL_LIBS})

add_executable(benchmark "benchmark.cpp" $<TARGET_OBJECTS:ENISI>)
target_link_libraries(benchmark ${ALL_LIBS})
