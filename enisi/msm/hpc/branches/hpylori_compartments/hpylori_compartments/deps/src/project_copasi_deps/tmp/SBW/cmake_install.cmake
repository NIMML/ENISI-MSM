# Install script for directory: /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SBW" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/MethodInline.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/DataBlockType.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ImplDataBlockReader.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ServiceImpl.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWOSMutexLock.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/DataBlockWriterClass.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ModuleImpl.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/Service.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWIncompatibleMethodSignatureException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/sbwdefs.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ImplDataBlockWriter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBW.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWOSEvent.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWListener.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/Handler.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWBrokerStartException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWTypeMismatchException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWUnsupportedObjectTypeException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ImplDataBlockReaderClass.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWMethodAmbiguousException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/sbwbasictypes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/Signature.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/DataBlockReader.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWRawException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ImplModuleDescriptor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWC.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWHandle.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWHighLevel.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWModuleRPC.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/sbwSignatureVoid.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWCommunicationException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureBoolean.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWRPCListener.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/DataBlockWriter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ImplDataBlockWriterClass.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/sbwenums.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWRPC.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/MethodTable.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/RPCOutCall.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/DoNothingReceiver.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWListenerForC.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/config.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWModuleStartException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureElement.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWApplicationException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/sbwSignatureByte.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWListenerConsolidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/RPCInCall.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/HandlerForC.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/portableOS.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/MethodImpl.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ModuleInline.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/RuntimeProperties.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWModuleDefinitionException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureList.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureArray.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/DataBlockReaderClass.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWIncorrectCategorySyntaxException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ModuleDescriptor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureType.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/stdafx.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ServiceInline.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/sbwplusbasictypes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/Method.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWLowLevel.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWModuleNotFoundException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWModuleIdSyntaxException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/Module.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/Receiver.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureListContents.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWThread.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWMethodTypeNotBlockTypeException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWServiceNotFoundException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWMethodNotFoundException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWConfig.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/ServiceDescriptor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWOSMutex.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWOSSocket.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SignatureScalar.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SessionKey.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWSignatureSyntaxException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/core/include/SBW/SBWObject.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/SBW/SBWCore/cmake_install.cmake")
  include("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/SBW/SBWBroker/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/SBW/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
