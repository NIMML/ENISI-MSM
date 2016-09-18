

set(command "./createLinux.sh")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-build-out.log"
  ERROR_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-build-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-build-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "project_copasi_deps build command succeeded.  See also /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi_deps-stamp/project_copasi_deps-build-*.log")
  message(STATUS "${msg}")
endif()
