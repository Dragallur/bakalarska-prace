
file(READ /home/vojta/Desktop/mffuk/bakalarka/build/eccodes_f90.pc.tmp _content)

string(REPLACE "/home/vojta/Desktop/mffuk/bakalarka/build/lib" "\${libdir}" _content "${_content}")
if(NOT "lib" STREQUAL "lib")
  string(REPLACE "/home/vojta/Desktop/mffuk/bakalarka/build/lib" "\${libdir}" _content "${_content}")
endif()
string(REPLACE "/home/vota/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/lib" "\${libdir}" _content "${_content}")

string(REGEX REPLACE "%SHORTEN:lib" "%SHORTEN:" _content "${_content}")
string(REGEX REPLACE "\\.(a|so|dylib|dll|lib)(\\.[0-9]+)*%" "%" _content "${_content}")
string(REGEX REPLACE "%SHORTEN:([^%]+)%" "\\1" _content "${_content}")

file(WRITE /home/vojta/Desktop/mffuk/bakalarka/build/lib/pkgconfig/eccodes_f90.pc "${_content}")
