if("${BUILD_STEP}" STREQUAL "patch")
  set(BV_SUPPORT_DIR ${VISIT_SVN_BIN_DIR}/bv_support)
  set(BV_SILO_SCRIPT ${BV_SUPPORT_DIR}/bv_silo.sh)
  set(BV_HDF5_SCRIPT ${BV_SUPPORT_DIR}/bv_hdf5.sh)
  message(STATUS "Patching " ${BV_SILO_SCRIPT})
  message(STATUS "Patching " ${BV_HDF5_SCRIPT})
  execute_process(
    COMMAND patch ${BV_SILO_SCRIPT} -i bv_silo.patch
    COMMAND patch ${BV_HDF5_SCRIPT} -i bv_hdf5.patch
    WORKING_DIRECTORY ${PATCH_DIR}
    OUTPUT_FILE ${LOG_DIR}/visit_patch.log
    ERROR_FILE ${LOG_DIR}/visit_patch_errors.log
  )
endif()

if("${BUILD_STEP}" STREQUAL "build")
  message(STATUS "Building VisIt...")
  execute_process(
    COMMAND ./build_visit --no-thirdparty --console --no-visit --szip --hdf5 --zlib --silo
    WORKING_DIRECTORY ${VISIT_SVN_BIN_DIR}
    OUTPUT_FILE ${LOG_DIR}/visit_build.log
    ERROR_FILE ${LOG_DIR}/visit_build_errors.log
  )
endif()
