

set(command "/usr/bin/cmake;-Dmake=${make};-Dconfig=${config};-P;/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_visit-stamp/project_visit-download--impl.cmake")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_visit-stamp/project_visit-download-out.log"
  ERROR_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_visit-stamp/project_visit-download-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_visit-stamp/project_visit-download-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "project_visit download command succeeded.  See also /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_visit-stamp/project_visit-download-*.log")
  message(STATUS "${msg}")
endif()
