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
include examples/C/CMakeFiles/c_grib_iterator.dir/depend.make

# Include the progress variables for this target.
include examples/C/CMakeFiles/c_grib_iterator.dir/progress.make

# Include the compile flags for this target's objects.
include examples/C/CMakeFiles/c_grib_iterator.dir/flags.make

examples/C/CMakeFiles/c_grib_iterator.dir/grib_iterator.c.o: examples/C/CMakeFiles/c_grib_iterator.dir/flags.make
examples/C/CMakeFiles/c_grib_iterator.dir/grib_iterator.c.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/grib_iterator.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/C/CMakeFiles/c_grib_iterator.dir/grib_iterator.c.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/c_grib_iterator.dir/grib_iterator.c.o   -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/grib_iterator.c

examples/C/CMakeFiles/c_grib_iterator.dir/grib_iterator.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/c_grib_iterator.dir/grib_iterator.c.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/grib_iterator.c > CMakeFiles/c_grib_iterator.dir/grib_iterator.c.i

examples/C/CMakeFiles/c_grib_iterator.dir/grib_iterator.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/c_grib_iterator.dir/grib_iterator.c.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/grib_iterator.c -o CMakeFiles/c_grib_iterator.dir/grib_iterator.c.s

# Object files for target c_grib_iterator
c_grib_iterator_OBJECTS = \
"CMakeFiles/c_grib_iterator.dir/grib_iterator.c.o"

# External object files for target c_grib_iterator
c_grib_iterator_EXTERNAL_OBJECTS =

examples/C/c_grib_iterator: examples/C/CMakeFiles/c_grib_iterator.dir/grib_iterator.c.o
examples/C/c_grib_iterator: examples/C/CMakeFiles/c_grib_iterator.dir/build.make
examples/C/c_grib_iterator: lib/libeccodes.so
examples/C/c_grib_iterator: /usr/lib/x86_64-linux-gnu/libm.so
examples/C/c_grib_iterator: examples/C/CMakeFiles/c_grib_iterator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable c_grib_iterator"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/examples/C/c_grib_iterator
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/c_grib_iterator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/C/CMakeFiles/c_grib_iterator.dir/build: examples/C/c_grib_iterator

.PHONY : examples/C/CMakeFiles/c_grib_iterator.dir/build

examples/C/CMakeFiles/c_grib_iterator.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && $(CMAKE_COMMAND) -P CMakeFiles/c_grib_iterator.dir/cmake_clean.cmake
.PHONY : examples/C/CMakeFiles/c_grib_iterator.dir/clean

examples/C/CMakeFiles/c_grib_iterator.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/examples/C /home/vojta/Desktop/mffuk/bakalarka/build/examples/C/CMakeFiles/c_grib_iterator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/C/CMakeFiles/c_grib_iterator.dir/depend

