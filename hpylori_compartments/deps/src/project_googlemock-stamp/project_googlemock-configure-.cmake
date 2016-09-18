

set(command "./configure")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_googlemock-stamp/project_googlemock-configure-out.log"
  ERROR_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_googlemock-stamp/project_googlemock-configure-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_googlemock-stamp/project_googlemock-configure-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "project_googlemock configure command succeeded.  See also /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_googlemock-stamp/project_googlemock-configure-*.log")
  message(STATUS "${msg}")
endif()
