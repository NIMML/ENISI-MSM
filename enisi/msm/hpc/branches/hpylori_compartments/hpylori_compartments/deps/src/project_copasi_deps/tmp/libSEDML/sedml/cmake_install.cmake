# Install script for directory: /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/bin")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sedml/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/common/sedmlfwd.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/common/operationReturnValues.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/common/common.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/common/libsedml-config.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/common/extern.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sedml" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedSimulation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedPlot3D.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedError.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedAlgorithm.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedVectorRange.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedComputeChange.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedFunctionalRange.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedDataSet.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedSubTask.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedUniformRange.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedChangeAttribute.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedConstructorException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedUniformTimeCourse.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedTypes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedAddXML.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedOutput.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedPlot2D.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedRemoveXML.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedVisitor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedOneStep.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedSurface.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedDataGenerator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedTask.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedReader.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedParameter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedErrorLog.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedChange.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedAlgorithmParameter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedRepeatedTask.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedErrorTable.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedSteadyState.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedReport.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedTypeCodes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedChangeXML.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedDocument.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedModel.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedSetValue.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedListOf.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedWriter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedVariable.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedRange.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSEDML/sedml/SedCurve.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sedml/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libSEDML/sedml/common/libsedml-version.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libSEDML/sedml/common/libsedml-config-common.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libSEDML/sedml/common/libsedml-namespace.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libSEDML/sedml/common/libsedml-package.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libSEDML/sedml/libsedml-static.a")
endif()

