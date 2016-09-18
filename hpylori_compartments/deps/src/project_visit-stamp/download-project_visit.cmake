message(STATUS "downloading...
     src='http://portal.nersc.gov/project/visit/releases/2.9.2/visit2.9.2.tar.gz'
     dst='/home/ariana/workspace/enisi/hpylori_compartments/deps/visit2.9.2.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "http://portal.nersc.gov/project/visit/releases/2.9.2/visit2.9.2.tar.gz"
  "/home/ariana/workspace/enisi/hpylori_compartments/deps/visit2.9.2.tar.gz"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://portal.nersc.gov/project/visit/releases/2.9.2/visit2.9.2.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
