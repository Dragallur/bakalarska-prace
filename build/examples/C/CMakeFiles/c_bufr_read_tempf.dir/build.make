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
include examples/C/CMakeFiles/c_bufr_read_tempf.dir/depend.make

# Include the progress variables for this target.
include examples/C/CMakeFiles/c_bufr_read_tempf.dir/progress.make

# Include the compile flags for this target's objects.
include examples/C/CMakeFiles/c_bufr_read_tempf.dir/flags.make

examples/C/CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.o: examples/C/CMakeFiles/c_bufr_read_tempf.dir/flags.make
examples/C/CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/bufr_read_tempf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/C/CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.o   -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/bufr_read_tempf.c

examples/C/CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/bufr_read_tempf.c > CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.i

examples/C/CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C/bufr_read_tempf.c -o CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.s

# Object files for target c_bufr_read_tempf
c_bufr_read_tempf_OBJECTS = \
"CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.o"

# External object files for target c_bufr_read_tempf
c_bufr_read_tempf_EXTERNAL_OBJECTS =

examples/C/c_bufr_read_tempf: examples/C/CMakeFiles/c_bufr_read_tempf.dir/bufr_read_tempf.c.o
examples/C/c_bufr_read_tempf: examples/C/CMakeFiles/c_bufr_read_tempf.dir/build.make
examples/C/c_bufr_read_tempf: lib/libeccodes.so
examples/C/c_bufr_read_tempf: /usr/lib/x86_64-linux-gnu/libm.so
examples/C/c_bufr_read_tempf: examples/C/CMakeFiles/c_bufr_read_tempf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable c_bufr_read_tempf"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/examples/C/c_bufr_read_tempf
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/c_bufr_read_tempf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/C/CMakeFiles/c_bufr_read_tempf.dir/build: examples/C/c_bufr_read_tempf

.PHONY : examples/C/CMakeFiles/c_bufr_read_tempf.dir/build

examples/C/CMakeFiles/c_bufr_read_tempf.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/examples/C && $(CMAKE_COMMAND) -P CMakeFiles/c_bufr_read_tempf.dir/cmake_clean.cmake
.PHONY : examples/C/CMakeFiles/c_bufr_read_tempf.dir/clean

examples/C/CMakeFiles/c_bufr_read_tempf.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/C /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/examples/C /home/vojta/Desktop/mffuk/bakalarka/build/examples/C/CMakeFiles/c_bufr_read_tempf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/C/CMakeFiles/c_bufr_read_tempf.dir/depend
