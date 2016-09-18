# Install script for directory: /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-build/copasi_install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/copasi/doc/html" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/TutWiz-Step4.html"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/TutWiz-Step5.html"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/TutWiz-Step1.html"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/TutWiz-Step3.html"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/TutWiz-Step2.html"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/TutWiz-Step6.html"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/copasi/doc/html/figures" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ModelSettingsDialog.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/TimeCourseDialog.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/OutputAssistant.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/PlotCurveSelectionDialog.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ReactionDialog.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ObjectBrowserSelection.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/NewPlotAdded.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ReactionOverviewEmpty.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ReactionOverview.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ObjectBrowserTree.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/ReportDefinitionDialog.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/PlotDefinition.png"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/wizard/help_html/figures/PlotWindow.png"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/copasi/examples" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/brusselator.sedml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/Olsen2003_peroxidase.cps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/Metabolism-2000Poo.xml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/scan.sedml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/MAPK-HF96-layout.cps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/DimericMWC-stiff.cps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/YeastGlycolysis.gps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/brusselator.cps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/NF-kappaB.sedml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/NF-kappaB.cps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/NF-kappaB-model.xml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/brusselator-model.xml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/CircadianClock.cps"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/Genetic-2000Elo.xml"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/TestSuite/distribution/oscli.xml"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/copasi/icons" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/UI/icons/Copasi.ico"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/UI/icons/CopasiDoc.ico"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/copasi/config" TYPE FILE FILES "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi/copasi/MIRIAM/MIRIAMResources.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-build/copasi/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
