# Install script for directory: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vota/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/eccodes/definitions" TYPE FILE PERMISSIONS OWNER_WRITE OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/boot.def"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/empty_template.def"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/param_limits.def"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/parameters_version.def"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/mars_param.table"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/param_id.table"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/stepUnits.table"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/CMakeLists.txt"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/eccodes/definitions" TYPE FILE FILES "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/installDefinitions.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/eccodes/definitions" TYPE DIRECTORY FILES
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/budg"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/bufr"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/cdf"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/common"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/diag"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/grib1"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/grib2"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/grib3"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/gts"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/hdf5"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/mars"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/metar"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/taf"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/tide"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/definitions/wrap"
    FILES_MATCHING REGEX "/[^/]*\\.def$" REGEX "/[^/]*\\.txt$" REGEX "/[^/]*\\.list$" REGEX "/[^/]*\\.table$" REGEX "/4\\.2\\.192\\.[^/]*\\.table$" EXCLUDE PERMISSIONS OWNER_WRITE OWNER_READ GROUP_READ WORLD_READ)
endif()

