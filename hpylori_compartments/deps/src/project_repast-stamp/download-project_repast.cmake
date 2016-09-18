message(STATUS "downloading...
     src='https://sourceforge.net/projects/repast/files/Repast%20HPC/Repast%20HPC%202.0/RHPC_2.0.tar.gz/download'
     dst='/home/ariana/workspace/enisi/hpylori_compartments/deps/RHPC_2.0.tar.gz'
     timeout='none'")




file(DOWNLOAD
  "https://sourceforge.net/projects/repast/files/Repast%20HPC/Repast%20HPC%202.0/RHPC_2.0.tar.gz/download"
  "/home/ariana/workspace/enisi/hpylori_compartments/deps/RHPC_2.0.tar.gz"
  SHOW_PROGRESS
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'https://sourceforge.net/projects/repast/files/Repast%20HPC/Repast%20HPC%202.0/RHPC_2.0.tar.gz/download' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
