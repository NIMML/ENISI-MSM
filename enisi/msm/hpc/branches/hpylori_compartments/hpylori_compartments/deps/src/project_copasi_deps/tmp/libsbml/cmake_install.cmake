# Install script for directory: /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/libsbml/." TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/COPYING.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/FUNDING.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/LICENSE.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/NEWS.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/OLD_NEWS.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/README.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/VERSION.txt"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/libsbml.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
