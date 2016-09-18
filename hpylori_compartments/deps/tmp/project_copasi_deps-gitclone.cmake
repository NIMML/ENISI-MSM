if("master" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-gitinfo.txt" IS_NEWER_THAN "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps'")
endif()

# try the clone 3 times incase there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" clone --origin "origin" "https://github.com/copasi/copasi-dependencies" "project_copasi_deps"
    WORKING_DIRECTORY "/home/ariana/workspace/enisi/hpylori_compartments/deps/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/copasi/copasi-dependencies'")
endif()

execute_process(
  COMMAND "/usr/bin/git" checkout master
  WORKING_DIRECTORY "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule init 
  WORKING_DIRECTORY "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive 
  WORKING_DIRECTORY "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-gitinfo.txt"
    "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-gitclone-lastrun.txt'")
endif()

