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
include fortran/CMakeFiles/eccodes_f90.dir/depend.make

# Include the progress variables for this target.
include fortran/CMakeFiles/eccodes_f90.dir/progress.make

# Include the compile flags for this target's objects.
include fortran/CMakeFiles/eccodes_f90.dir/flags.make

fortran/grib_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_head.f90
fortran/grib_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_tail.f90
fortran/grib_f90.f90: fortran/grib_kinds.h
fortran/grib_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_long_int.f90
fortran/grib_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_long_size_t.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating grib_f90.f90"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && cat /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_head.f90 /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_long_int.f90 /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_long_size_t.f90 /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_f90_tail.f90 > grib_f90.f90

fortran/eccodes_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_head.f90
fortran/eccodes_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_tail.f90
fortran/eccodes_f90.f90: fortran/grib_kinds.h
fortran/eccodes_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_long_int.f90
fortran/eccodes_f90.f90: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_long_size_t.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating eccodes_f90.f90"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && cat /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_head.f90 /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_long_int.f90 /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_long_size_t.f90 /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/eccodes_f90_tail.f90 > eccodes_f90.f90

fortran/grib_kinds.h: fortran/grib_types
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating grib_kinds.h"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && ./grib_types > grib_kinds.h

fortran/CMakeFiles/eccodes_f90.dir/grib_fortran.c.o: fortran/CMakeFiles/eccodes_f90.dir/flags.make
fortran/CMakeFiles/eccodes_f90.dir/grib_fortran.c.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object fortran/CMakeFiles/eccodes_f90.dir/grib_fortran.c.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/eccodes_f90.dir/grib_fortran.c.o   -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran.c

fortran/CMakeFiles/eccodes_f90.dir/grib_fortran.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/eccodes_f90.dir/grib_fortran.c.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran.c > CMakeFiles/eccodes_f90.dir/grib_fortran.c.i

fortran/CMakeFiles/eccodes_f90.dir/grib_fortran.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/eccodes_f90.dir/grib_fortran.c.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran/grib_fortran.c -o CMakeFiles/eccodes_f90.dir/grib_fortran.c.s

fortran/CMakeFiles/eccodes_f90.dir/grib_f90.f90.o: fortran/CMakeFiles/eccodes_f90.dir/flags.make
fortran/CMakeFiles/eccodes_f90.dir/grib_f90.f90.o: fortran/grib_f90.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building Fortran object fortran/CMakeFiles/eccodes_f90.dir/grib_f90.f90.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/vojta/Desktop/mffuk/bakalarka/build/fortran/grib_f90.f90 -o CMakeFiles/eccodes_f90.dir/grib_f90.f90.o

fortran/CMakeFiles/eccodes_f90.dir/grib_f90.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/eccodes_f90.dir/grib_f90.f90.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/build/fortran/grib_f90.f90 > CMakeFiles/eccodes_f90.dir/grib_f90.f90.i

fortran/CMakeFiles/eccodes_f90.dir/grib_f90.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/eccodes_f90.dir/grib_f90.f90.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/build/fortran/grib_f90.f90 -o CMakeFiles/eccodes_f90.dir/grib_f90.f90.s

fortran/CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.o: fortran/CMakeFiles/eccodes_f90.dir/flags.make
fortran/CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.o: fortran/eccodes_f90.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building Fortran object fortran/CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/vojta/Desktop/mffuk/bakalarka/build/fortran/eccodes_f90.f90 -o CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.o

fortran/CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/build/fortran/eccodes_f90.f90 > CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.i

fortran/CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/build/fortran/eccodes_f90.f90 -o CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.s

# Object files for target eccodes_f90
eccodes_f90_OBJECTS = \
"CMakeFiles/eccodes_f90.dir/grib_fortran.c.o" \
"CMakeFiles/eccodes_f90.dir/grib_f90.f90.o" \
"CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.o"

# External object files for target eccodes_f90
eccodes_f90_EXTERNAL_OBJECTS =

lib/libeccodes_f90.so: fortran/CMakeFiles/eccodes_f90.dir/grib_fortran.c.o
lib/libeccodes_f90.so: fortran/CMakeFiles/eccodes_f90.dir/grib_f90.f90.o
lib/libeccodes_f90.so: fortran/CMakeFiles/eccodes_f90.dir/eccodes_f90.f90.o
lib/libeccodes_f90.so: fortran/CMakeFiles/eccodes_f90.dir/build.make
lib/libeccodes_f90.so: lib/libeccodes.so
lib/libeccodes_f90.so: /usr/lib/x86_64-linux-gnu/libm.so
lib/libeccodes_f90.so: fortran/CMakeFiles/eccodes_f90.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking Fortran shared library ../lib/libeccodes_f90.so"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/lib/libeccodes_f90.so
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/eccodes_f90.dir/link.txt --verbose=$(VERBOSE)
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/cmake -E make_directory /home/vojta/Desktop/mffuk/bakalarka/build/include
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/cmake -E copy /home/vojta/Desktop/mffuk/bakalarka/build/fortran/modules/./eccodes.mod /home/vojta/Desktop/mffuk/bakalarka/build/include
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && /usr/bin/cmake -E copy /home/vojta/Desktop/mffuk/bakalarka/build/fortran/modules/./grib_api.mod /home/vojta/Desktop/mffuk/bakalarka/build/include

# Rule to build all files generated by this target.
fortran/CMakeFiles/eccodes_f90.dir/build: lib/libeccodes_f90.so

.PHONY : fortran/CMakeFiles/eccodes_f90.dir/build

fortran/CMakeFiles/eccodes_f90.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/fortran && $(CMAKE_COMMAND) -P CMakeFiles/eccodes_f90.dir/cmake_clean.cmake
.PHONY : fortran/CMakeFiles/eccodes_f90.dir/clean

fortran/CMakeFiles/eccodes_f90.dir/depend: fortran/grib_f90.f90
fortran/CMakeFiles/eccodes_f90.dir/depend: fortran/eccodes_f90.f90
fortran/CMakeFiles/eccodes_f90.dir/depend: fortran/grib_kinds.h
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/fortran /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/fortran /home/vojta/Desktop/mffuk/bakalarka/build/fortran/CMakeFiles/eccodes_f90.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : fortran/CMakeFiles/eccodes_f90.dir/depend

