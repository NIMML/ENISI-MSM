

set(command "/usr/bin/cmake;-P;/home/ariana/workspace/enisi/hpylori_compartments/deps/tmp/project_copasi-gitclone.cmake")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-stamp/project_copasi-download-out.log"
  ERROR_FILE "/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-stamp/project_copasi-download-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-stamp/project_copasi-download-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "project_copasi download command succeeded.  See also /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_copasi-stamp/project_copasi-download-*.log")
  message(STATUS "${msg}")
endif()
