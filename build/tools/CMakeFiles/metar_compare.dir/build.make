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
include tools/CMakeFiles/metar_compare.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/metar_compare.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/metar_compare.dir/flags.make

tools/CMakeFiles/metar_compare.dir/metar_compare.cc.o: tools/CMakeFiles/metar_compare.dir/flags.make
tools/CMakeFiles/metar_compare.dir/metar_compare.cc.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/metar_compare.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/metar_compare.dir/metar_compare.cc.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/metar_compare.dir/metar_compare.cc.o -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/metar_compare.cc

tools/CMakeFiles/metar_compare.dir/metar_compare.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/metar_compare.dir/metar_compare.cc.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/metar_compare.cc > CMakeFiles/metar_compare.dir/metar_compare.cc.i

tools/CMakeFiles/metar_compare.dir/metar_compare.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/metar_compare.dir/metar_compare.cc.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/metar_compare.cc -o CMakeFiles/metar_compare.dir/metar_compare.cc.s

# Object files for target metar_compare
metar_compare_OBJECTS = \
"CMakeFiles/metar_compare.dir/metar_compare.cc.o"

# External object files for target metar_compare
metar_compare_EXTERNAL_OBJECTS =

bin/metar_compare: tools/CMakeFiles/metar_compare.dir/metar_compare.cc.o
bin/metar_compare: tools/CMakeFiles/metar_compare.dir/build.make
bin/metar_compare: tools/libecc_tools.a
bin/metar_compare: lib/libeccodes.so
bin/metar_compare: /usr/lib/x86_64-linux-gnu/libm.so
bin/metar_compare: tools/CMakeFiles/metar_compare.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/metar_compare"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/bin/metar_compare
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/metar_compare.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/metar_compare.dir/build: bin/metar_compare

.PHONY : tools/CMakeFiles/metar_compare.dir/build

tools/CMakeFiles/metar_compare.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && $(CMAKE_COMMAND) -P CMakeFiles/metar_compare.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/metar_compare.dir/clean

tools/CMakeFiles/metar_compare.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/tools /home/vojta/Desktop/mffuk/bakalarka/build/tools/CMakeFiles/metar_compare.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/metar_compare.dir/depend

