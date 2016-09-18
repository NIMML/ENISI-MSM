file(REMOVE_RECURSE
  "libCOPASISE.pdb"
  "libCOPASISE.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libCOPASISE-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
