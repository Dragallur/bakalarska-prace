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
include tools/CMakeFiles/bufr_compare.dir/depend.make

# Include the progress variables for this target.
include tools/CMakeFiles/bufr_compare.dir/progress.make

# Include the compile flags for this target's objects.
include tools/CMakeFiles/bufr_compare.dir/flags.make

tools/CMakeFiles/bufr_compare.dir/bufr_compare.cc.o: tools/CMakeFiles/bufr_compare.dir/flags.make
tools/CMakeFiles/bufr_compare.dir/bufr_compare.cc.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/bufr_compare.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/CMakeFiles/bufr_compare.dir/bufr_compare.cc.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bufr_compare.dir/bufr_compare.cc.o -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/bufr_compare.cc

tools/CMakeFiles/bufr_compare.dir/bufr_compare.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bufr_compare.dir/bufr_compare.cc.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/bufr_compare.cc > CMakeFiles/bufr_compare.dir/bufr_compare.cc.i

tools/CMakeFiles/bufr_compare.dir/bufr_compare.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bufr_compare.dir/bufr_compare.cc.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools/bufr_compare.cc -o CMakeFiles/bufr_compare.dir/bufr_compare.cc.s

# Object files for target bufr_compare
bufr_compare_OBJECTS = \
"CMakeFiles/bufr_compare.dir/bufr_compare.cc.o"

# External object files for target bufr_compare
bufr_compare_EXTERNAL_OBJECTS =

bin/bufr_compare: tools/CMakeFiles/bufr_compare.dir/bufr_compare.cc.o
bin/bufr_compare: tools/CMakeFiles/bufr_compare.dir/build.make
bin/bufr_compare: tools/libecc_tools.a
bin/bufr_compare: lib/libeccodes.so
bin/bufr_compare: /usr/lib/x86_64-linux-gnu/libm.so
bin/bufr_compare: tools/CMakeFiles/bufr_compare.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/bufr_compare"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/bin/bufr_compare
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bufr_compare.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/CMakeFiles/bufr_compare.dir/build: bin/bufr_compare

.PHONY : tools/CMakeFiles/bufr_compare.dir/build

tools/CMakeFiles/bufr_compare.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tools && $(CMAKE_COMMAND) -P CMakeFiles/bufr_compare.dir/cmake_clean.cmake
.PHONY : tools/CMakeFiles/bufr_compare.dir/clean

tools/CMakeFiles/bufr_compare.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tools /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/tools /home/vojta/Desktop/mffuk/bakalarka/build/tools/CMakeFiles/bufr_compare.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/CMakeFiles/bufr_compare.dir/depend

