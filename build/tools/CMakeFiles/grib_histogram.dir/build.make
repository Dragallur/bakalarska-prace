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
include tools/CMakeFiles/grib_histogram.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/grib_histogram.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/grib_histogram.dir/flags.make

tools/CMakeFiles/grib_histogram.dir/grib_histogram.cc.o: tools/CMakeFiles/grib_histogram.dir/flags.make
tools/CMakeFiles/grib_histogram.dir/grib_histogram.cc.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/grib_histogram.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/grib_histogram.dir/grib_histogram.cc.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/grib_histogram.dir/grib_histogram.cc.o -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/grib_histogram.cc

tools/CMakeFiles/grib_histogram.dir/grib_histogram.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/grib_histogram.dir/grib_histogram.cc.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/grib_histogram.cc > CMakeFiles/grib_histogram.dir/grib_histogram.cc.i

tools/CMakeFiles/grib_histogram.dir/grib_histogram.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/grib_histogram.dir/grib_histogram.cc.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/grib_histogram.cc -o CMakeFiles/grib_histogram.dir/grib_histogram.cc.s

# Object files for target grib_histogram
grib_histogram_OBJECTS = \
"CMakeFiles/grib_histogram.dir/grib_histogram.cc.o"

# External object files for target grib_histogram
grib_histogram_EXTERNAL_OBJECTS =

bin/grib_histogram: tools/CMakeFiles/grib_histogram.dir/grib_histogram.cc.o
bin/grib_histogram: tools/CMakeFiles/grib_histogram.dir/build.make
bin/grib_histogram: tools/libecc_tools.a
bin/grib_histogram: lib/libeccodes.so
bin/grib_histogram: /usr/lib/x86_64-linux-gnu/libm.so
bin/grib_histogram: tools/CMakeFiles/grib_histogram.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/grib_histogram"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/bin/grib_histogram
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/grib_histogram.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/grib_histogram.dir/build: bin/grib_histogram

.PHONY : tools/CMakeFiles/grib_histogram.dir/build

tools/CMakeFiles/grib_histogram.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && $(CMAKE_COMMAND) -P CMakeFiles/grib_histogram.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/grib_histogram.dir/clean

tools/CMakeFiles/grib_histogram.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/tools /home/vojta/Desktop/mffuk/bakalarka/build/tools/CMakeFiles/grib_histogram.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/grib_histogram.dir/depend
