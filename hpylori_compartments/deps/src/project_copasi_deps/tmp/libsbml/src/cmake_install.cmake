# Install script for directory: /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/layout/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/common/LayoutExtensionTypes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/common/layoutfwd.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/layout/extension" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/extension/LayoutSBMLDocumentPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/extension/LayoutModelPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/extension/LayoutExtension.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/extension/LayoutSpeciesReferencePlugin.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/layout/sbml" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/BoundingBox.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/SpeciesGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/GraphicalObject.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/ReactionGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/LineSegment.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/CompartmentGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/ReferenceGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/TextGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/SpeciesReferenceGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/CubicBezier.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/Layout.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/Dimensions.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/SpeciesReferenceRole.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/Curve.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/GeneralGlyph.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/sbml/Point.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/layout/util" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/util/LayoutAnnotation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/util/LayoutUtilities.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/layout/validator" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/validator/LayoutConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/validator/LayoutValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/validator/LayoutSBMLErrorTable.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/validator/LayoutSBMLError.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/validator/LayoutIdentifierConsistencyValidator.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/layout/validator/constraints" TYPE FILE FILES "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/layout/validator/constraints/UniqueIdsLayout.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/render/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/common/renderfwd.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/common/RenderExtensionTypes.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/render/extension" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/extension/RenderExtension.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/extension/RenderGraphicalObjectPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/extension/RenderListOfLayoutsPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/extension/RenderSBMLDocumentPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/extension/RenderLayoutPlugin.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/render/sbml" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Ellipse.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RadialGradient.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RenderCubicBezier.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RelAbsVector.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RenderGroup.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RenderPoint.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/GlobalRenderInformation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Style.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/GradientStop.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Transformation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/ListOfCurveElements.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/LineEnding.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/LocalRenderInformation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/GradientBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Text.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/ColorDefinition.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RenderInformationBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/LinearGradient.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Image.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Rectangle.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/LocalStyle.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/GraphicalPrimitive2D.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/GraphicalPrimitive1D.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/GlobalStyle.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Polygon.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/Transformation2D.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/sbml/RenderCurve.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/render/util" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/util/RenderLayoutConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/render/util/RenderUtilities.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/comp/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/common/compfwd.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/common/CompExtensionTypes.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/comp/extension" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/extension/CompSBMLDocumentPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/extension/CompModelPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/extension/CompExtension.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/extension/CompSBasePlugin.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/comp/sbml" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/Deletion.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ListOfDeletions.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/SBaseRef.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ListOfExternalModelDefinitions.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ReplacedElement.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/Submodel.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ListOfPorts.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/Port.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ListOfReplacedElements.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/Replacing.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ExternalModelDefinition.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ReplacedBy.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ListOfSubmodels.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ModelDefinition.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/ListOfModelDefinitions.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/sbml/CompBase.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/comp/util" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/util/SBMLResolverRegistry.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/util/SBMLResolver.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/util/SBMLFileResolver.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/util/CompFlatteningConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/util/SBMLUri.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/comp/validator" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/CompSBMLErrorTable.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/CompIdentifierConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/CompConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/CompUnitConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/CompValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/CompSBMLError.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/packages/comp/validator/constraints" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UniquePortReferences.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UnitReplacementCheck.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/PackageIdReplacementCheck.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UniquePortIds.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/ExtModelReferenceCycles.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UniqueModelIds.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/ClassReplacements.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/SubmodelReferenceCycles.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UniqueReplacedReferences.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UniqueCompIdBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/CompIdBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/packages/comp/validator/constraints/UniqueComponentIds.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/annotation" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/annotation/Date.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/annotation/RDFAnnotation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/annotation/CVTerm.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/annotation/ModelCreator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/annotation/RDFAnnotationParser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/annotation/ModelHistory.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/common-sbmlerror-codes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/libsbml-version.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/common-documentation.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/operationReturnValues.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/libsbml-config.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/common.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/sbmlfwd.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/common/extern.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/compress" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/OutputCompressor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/iowin32.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/bzfstream.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/zfstream.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/zip.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/unzip.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/InputDecompressor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/zipfstream.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/crypt.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/CompressCommon.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/compress/ioapi.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/conversion" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLConverterRegister.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLLevel1Version1Converter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLRuleConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLLevelVersionConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLIdConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLStripPackageConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLReactionConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/ConversionOption.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/ConversionProperties.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLInitialAssignmentConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLUnitsConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLConverterRegistry.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLInferUnitsConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLLocalParameterConverter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/conversion/SBMLFunctionDefinitionConverter.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/extension" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLExtensionNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLExtensionRegistry.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLExtensionRegister.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLExtension.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBasePlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLExtensionException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLDocumentPluginNotRequired.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBMLDocumentPlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/ASTBasePlugin.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBaseExtensionPoint.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBasePluginCreatorBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/ISBMLExtensionNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/extension/SBasePluginCreator.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/units" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/units/UnitFormulaFormatter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/units/UnitKindList.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/units/FormulaUnitsData.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/util" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/IdList.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/StringBuffer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/ElementFilter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/IdentifierTransformer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/List.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/util.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/PrefixTransformer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/memory.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/MetaIdFilter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/IdFilter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/util/Stack.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/validator" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/IdentifierConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/MathMLConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/SBMLExternalValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/InternalConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/VConstraint.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/L2v2CompatibilityValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/L3v1CompatibilityValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/StrictUnitConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/SBMLValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/ConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/L2v3CompatibilityValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/UnitConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/SBOConsistencyValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/OverdeterminedValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/Validator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/L1CompatibilityValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/L2v1CompatibilityValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/SBMLInternalValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/ConstraintMacros.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/L2v4CompatibilityValidator.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/validator/ModelingPracticeValidator.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/xml" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLTokenizer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLAttributes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLFileBuffer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XercesAttributes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XercesHandler.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLExtern.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/ExpatHandler.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLOutputStream.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/LibXMLNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLNode.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XercesParser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/ExpatParser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLParser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/ExpatAttributes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLConstructorException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/LibXMLAttributes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLInputStream.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLToken.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/LibXMLParser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLMemoryBuffer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLBuffer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/LibXMLHandler.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLHandler.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XercesNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLLogOverride.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XercesTranscode.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLErrorLog.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLTriple.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/XMLError.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/xml/LibXMLTranscode.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/InitialAssignment.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/EventAssignment.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Reaction.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Species.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLNamespaces.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/AssignmentRule.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLError.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Rule.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Parameter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLWriter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLErrorTable.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLReader.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/ListOf.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/RateRule.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLTransforms.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Constraint.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLConstructorException.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Unit.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/ModifierSpeciesReference.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/AlgebraicRule.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBO.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SpeciesReference.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/LocalParameter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLVisitor.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SimpleSpeciesReference.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/KineticLaw.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Trigger.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Delay.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Model.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/FunctionDefinition.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLErrorLog.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/StoichiometryMath.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Compartment.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SpeciesType.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/ExpectedAttributes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBase.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/CompartmentType.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLDocument.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Priority.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLTypeCodes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/UnitKind.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/UnitDefinition.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/Event.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SBMLTypes.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/SyntaxChecker.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/common" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/common/libsbml-package.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/common/libsbml-config-common.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/common/libsbml-version.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/common/libsbml-namespace.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/common/libsbml-config-packages.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/extension" TYPE FILE FILES "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/extension/RegisterExtensions.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sbml/math" TYPE FILE FILES
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/MathML.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/L3Parser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/L3FormulaFormatter.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/ASTNode.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/L3ParserSettings.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/FormulaTokenizer.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/FormulaParser.h"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/src/libSBML/src/sbml/math-legacy/FormulaFormatter.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/libsbml-static.a")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/sbml/cmake_install.cmake")
  include("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps/tmp/libsbml/src/bindings/cmake_install.cmake")

endif()

