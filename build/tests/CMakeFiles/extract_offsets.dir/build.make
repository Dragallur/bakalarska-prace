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
include tests/CMakeFiles/extract_offsets.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/extract_offsets.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/extract_offsets.dir/flags.make

tests/CMakeFiles/extract_offsets.dir/extract_offsets.cc.o: tests/CMakeFiles/extract_offsets.dir/flags.make
tests/CMakeFiles/extract_offsets.dir/extract_offsets.cc.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/extract_offsets.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/extract_offsets.dir/extract_offsets.cc.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/extract_offsets.dir/extract_offsets.cc.o -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/extract_offsets.cc

tests/CMakeFiles/extract_offsets.dir/extract_offsets.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/extract_offsets.dir/extract_offsets.cc.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/extract_offsets.cc > CMakeFiles/extract_offsets.dir/extract_offsets.cc.i

tests/CMakeFiles/extract_offsets.dir/extract_offsets.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/extract_offsets.dir/extract_offsets.cc.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/extract_offsets.cc -o CMakeFiles/extract_offsets.dir/extract_offsets.cc.s

# Object files for target extract_offsets
extract_offsets_OBJECTS = \
"CMakeFiles/extract_offsets.dir/extract_offsets.cc.o"

# External object files for target extract_offsets
extract_offsets_EXTERNAL_OBJECTS =

tests/extract_offsets: tests/CMakeFiles/extract_offsets.dir/extract_offsets.cc.o
tests/extract_offsets: tests/CMakeFiles/extract_offsets.dir/build.make
tests/extract_offsets: lib/libeccodes.so
tests/extract_offsets: /usr/lib/x86_64-linux-gnu/libm.so
tests/extract_offsets: tests/CMakeFiles/extract_offsets.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable extract_offsets"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/tests/extract_offsets
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/extract_offsets.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/extract_offsets.dir/build: tests/extract_offsets

.PHONY : tests/CMakeFiles/extract_offsets.dir/build

tests/CMakeFiles/extract_offsets.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/extract_offsets.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/extract_offsets.dir/clean

tests/CMakeFiles/extract_offsets.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/tests /home/vojta/Desktop/mffuk/bakalarka/build/tests/CMakeFiles/extract_offsets.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/extract_offsets.dir/depend

