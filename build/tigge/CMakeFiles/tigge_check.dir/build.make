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
include tigge/CMakeFiles/tigge_check.dir/depend.make

# Include the progress variables for this target.
include tigge/CMakeFiles/tigge_check.dir/progress.make

# Include the compile flags for this target's objects.
include tigge/CMakeFiles/tigge_check.dir/flags.make

tigge/CMakeFiles/tigge_check.dir/tigge_check.cc.o: tigge/CMakeFiles/tigge_check.dir/flags.make
tigge/CMakeFiles/tigge_check.dir/tigge_check.cc.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tigge/tigge_check.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tigge/CMakeFiles/tigge_check.dir/tigge_check.cc.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tigge && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tigge_check.dir/tigge_check.cc.o -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tigge/tigge_check.cc

tigge/CMakeFiles/tigge_check.dir/tigge_check.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tigge_check.dir/tigge_check.cc.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tigge && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tigge/tigge_check.cc > CMakeFiles/tigge_check.dir/tigge_check.cc.i

tigge/CMakeFiles/tigge_check.dir/tigge_check.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tigge_check.dir/tigge_check.cc.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tigge && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tigge/tigge_check.cc -o CMakeFiles/tigge_check.dir/tigge_check.cc.s

# Object files for target tigge_check
tigge_check_OBJECTS = \
"CMakeFiles/tigge_check.dir/tigge_check.cc.o"

# External object files for target tigge_check
tigge_check_EXTERNAL_OBJECTS =

bin/tigge_check: tigge/CMakeFiles/tigge_check.dir/tigge_check.cc.o
bin/tigge_check: tigge/CMakeFiles/tigge_check.dir/build.make
bin/tigge_check: lib/libeccodes.so
bin/tigge_check: tigge/libtigge_tools.a
bin/tigge_check: /usr/lib/x86_64-linux-gnu/libm.so
bin/tigge_check: tigge/CMakeFiles/tigge_check.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/tigge_check"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tigge && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/bin/tigge_check
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tigge && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tigge_check.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tigge/CMakeFiles/tigge_check.dir/build: bin/tigge_check

.PHONY : tigge/CMakeFiles/tigge_check.dir/build

tigge/CMakeFiles/tigge_check.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tigge && $(CMAKE_COMMAND) -P CMakeFiles/tigge_check.dir/cmake_clean.cmake
.PHONY : tigge/CMakeFiles/tigge_check.dir/clean

tigge/CMakeFiles/tigge_check.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tigge /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/tigge /home/vojta/Desktop/mffuk/bakalarka/build/tigge/CMakeFiles/tigge_check.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tigge/CMakeFiles/tigge_check.dir/depend

