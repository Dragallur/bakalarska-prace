# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vojta/Desktop/mffuk/bakalarka/build

# Include any dependencies generated for this target.
include fortran/CMakeFiles/grib_types.dir/depend.make

# Include the progress variables for this target.
include fortran/CMakeFiles/grib_types.dir/progress.make

# Include the compile flags for this target's objects.
include fortran/CMakeFiles/grib_types.dir/flags.make

fortran/CMakeFiles/grib_types.dir/grib_types.f90.o: fortran/CMakeFiles/grib_types.dir/flags.make
fortran/CMakeFiles/grib_types.dir/grib_types.f90.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_types.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object fortran/CMakeFiles/grib_types.dir/grib_types.f90.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_types.f90 -o CMakeFiles/grib_types.dir/grib_types.f90.o

fortran/CMakeFiles/grib_types.dir/grib_types.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/grib_types.dir/grib_types.f90.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_types.f90 > CMakeFiles/grib_types.dir/grib_types.f90.i

fortran/CMakeFiles/grib_types.dir/grib_types.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/grib_types.dir/grib_types.f90.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_types.f90 -o CMakeFiles/grib_types.dir/grib_types.f90.s

fortran/CMakeFiles/grib_types.dir/grib_fortran_kinds.c.o: fortran/CMakeFiles/grib_types.dir/flags.make
fortran/CMakeFiles/grib_types.dir/grib_fortran_kinds.c.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran_kinds.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object fortran/CMakeFiles/grib_types.dir/grib_fortran_kinds.c.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/grib_types.dir/grib_fortran_kinds.c.o   -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran_kinds.c

fortran/CMakeFiles/grib_types.dir/grib_fortran_kinds.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/grib_types.dir/grib_fortran_kinds.c.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran_kinds.c > CMakeFiles/grib_types.dir/grib_fortran_kinds.c.i

fortran/CMakeFiles/grib_types.dir/grib_fortran_kinds.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/grib_types.dir/grib_fortran_kinds.c.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran_kinds.c -o CMakeFiles/grib_types.dir/grib_fortran_kinds.c.s

# Object files for target grib_types
grib_types_OBJECTS = \
"CMakeFiles/grib_types.dir/grib_types.f90.o" \
"CMakeFiles/grib_types.dir/grib_fortran_kinds.c.o"

# External object files for target grib_types
grib_types_EXTERNAL_OBJECTS =

fortran/grib_types: fortran/CMakeFiles/grib_types.dir/grib_types.f90.o
fortran/grib_types: fortran/CMakeFiles/grib_types.dir/grib_fortran_kinds.c.o
fortran/grib_types: fortran/CMakeFiles/grib_types.dir/build.make
fortran/grib_types: fortran/CMakeFiles/grib_types.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking Fortran executable grib_types"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/fortran/grib_types
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/grib_types.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
fortran/CMakeFiles/grib_types.dir/build: fortran/grib_types

.PHONY : fortran/CMakeFiles/grib_types.dir/build

fortran/CMakeFiles/grib_types.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && $(CMAKE_COMMAND) -P CMakeFiles/grib_types.dir/cmake_clean.cmake
.PHONY : fortran/CMakeFiles/grib_types.dir/clean

fortran/CMakeFiles/grib_types.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/fortran /home/vojta/Desktop/mffuk/bakalarka/build/fortran/CMakeFiles/grib_types.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : fortran/CMakeFiles/grib_types.dir/depend

