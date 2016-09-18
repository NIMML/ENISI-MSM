# CMake generated Testfile for 
# Source directory: /home/ariana/workspace/enisi/hpylori_compartments
# Build directory: /home/ariana/workspace/enisi/hpylori_compartments/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(googlemock "bash" "/home/ariana/workspace/enisi/hpylori_compartments/gmock.sh")
set_tests_properties(googlemock PROPERTIES  WORKING_DIRECTORY "/home/ariana/workspace/enisi/hpylori_compartments")
subdirs(deps)
subdirs(src)
