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
include tests/CMakeFiles/grib_sh_spectral_complex.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/grib_sh_spectral_complex.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/grib_sh_spectral_complex.dir/flags.make

tests/CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.o: tests/CMakeFiles/grib_sh_spectral_complex.dir/flags.make
tests/CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.o: /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/grib_sh_spectral_complex.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.o"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.o -c /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/grib_sh_spectral_complex.cc

tests/CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.i"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/grib_sh_spectral_complex.cc > CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.i

tests/CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.s"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests/grib_sh_spectral_complex.cc -o CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.s

# Object files for target grib_sh_spectral_complex
grib_sh_spectral_complex_OBJECTS = \
"CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.o"

# External object files for target grib_sh_spectral_complex
grib_sh_spectral_complex_EXTERNAL_OBJECTS =

tests/grib_sh_spectral_complex: tests/CMakeFiles/grib_sh_spectral_complex.dir/grib_sh_spectral_complex.cc.o
tests/grib_sh_spectral_complex: tests/CMakeFiles/grib_sh_spectral_complex.dir/build.make
tests/grib_sh_spectral_complex: lib/libeccodes.so
tests/grib_sh_spectral_complex: /usr/lib/x86_64-linux-gnu/libm.so
tests/grib_sh_spectral_complex: tests/CMakeFiles/grib_sh_spectral_complex.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vojta/Desktop/mffuk/bakalarka/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable grib_sh_spectral_complex"
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && /usr/bin/cmake -E remove /home/vojta/Desktop/mffuk/bakalarka/build/tests/grib_sh_spectral_complex
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/grib_sh_spectral_complex.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/grib_sh_spectral_complex.dir/build: tests/grib_sh_spectral_complex

.PHONY : tests/CMakeFiles/grib_sh_spectral_complex.dir/build

tests/CMakeFiles/grib_sh_spectral_complex.dir/clean:
	cd /home/vojta/Desktop/mffuk/bakalarka/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/grib_sh_spectral_complex.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/grib_sh_spectral_complex.dir/clean

tests/CMakeFiles/grib_sh_spectral_complex.dir/depend:
	cd /home/vojta/Desktop/mffuk/bakalarka/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source /home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/tests /home/vojta/Desktop/mffuk/bakalarka/build /home/vojta/Desktop/mffuk/bakalarka/build/tests /home/vojta/Desktop/mffuk/bakalarka/build/tests/CMakeFiles/grib_sh_spectral_complex.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/grib_sh_spectral_complex.dir/depend
