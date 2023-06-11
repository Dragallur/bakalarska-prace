# Install script for directory: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/ifs_samples/grib1_mlgrib2_ccsds

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/eccodes/ifs_samples/grib1_mlgrib2_ccsds" TYPE FILE PERMISSIONS OWNER_WRITE OWNER_READ GROUP_READ WORLD_READ FILES
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/ifs_samples/grib1_mlgrib2_ccsds/gg_ml.tmpl"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/ifs_samples/grib1_mlgrib2_ccsds/gg_sfc_grib2.tmpl"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/ifs_samples/grib1_mlgrib2_ccsds/gg_sfc.tmpl"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/ifs_samples/grib1_mlgrib2_ccsds/sh_ml.tmpl"
    "/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/ifs_samples/grib1_mlgrib2_ccsds/sh_sfc.tmpl"
    )
endif()

