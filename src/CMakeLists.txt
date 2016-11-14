SET( OSX_LINK_FLAGS "-framework Cocoa")

if (APPLE)
  set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${OSX_LINK_FLAGS}")
endif(APPLE)

set(CMAKE_CXX_COMPILER "${MPI_CXX_COMPILER}")


# SYSTEM option allows compiler to skip warnings for includes
# (necessary when using -Wall compiler flag with 3rd-party libs)

include_directories(BEFORE "${PROJECT_SOURCE_DIR}/src" "${ENISI_MSM_DEPENDENCY_DIR}/include" "${ENISI_MSM_DEPENDENCY_DIR}/include/copasi")

link_directories(BEFORE "${ENISI_MSM_DEPENDENCY_DIR}/lib")
 
file(GLOB_RECURSE ALL_SRCS "*.h" "*.cpp")

foreach(f "main" "benchmark" "test")  
  list(REMOVE_ITEM ALL_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/${f}.cpp") 
endforeach() 

# Add shared object directory so cmake doesn't keep duplicating the build
# process in each *main.dir/ subdirectory
add_library(ENISI OBJECT ${ALL_SRCS})

set(COPASI_DEP_LIBS raptor sbml-static lapack blas sedml-static expat)

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
  set(COPASI_DEP_LIBS  "${COPASI_DEP_LIBS} -lf2c")
endif()

set(COPASI_LIBS COPASISE ${COPASI_DEP_LIBS})
set(REPAST_LIBS repast_hpc-2.0)
set(BOOST_LIBS boost_mpi-mt-s boost_serialization-mt-s boost_system-mt-s boost_filesystem-mt-s)

set(ALL_LIBS ${COPASI_LIBS} ${REPAST_LIBS} ${BOOST_LIBS})

add_executable(ENISI-MSM "main.cpp" $<TARGET_OBJECTS:ENISI>)
target_link_libraries(ENISI-MSM ${COPASI_LIBS} ${REPAST_LIBS} ${BOOST_LIBS})
