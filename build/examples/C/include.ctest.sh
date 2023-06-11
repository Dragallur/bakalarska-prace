# examples/C include file for CMake

set -eax
echo "Script: $0"

# Unset any environment variable that could interfere with tests
unset ECCODES_EXTRA_DEFINITION_PATH
unset ECCODES_LOG_STREAM
unset ECCODES_FAIL_IF_LOG_MESSAGE
unset ECCODES_DEBUG
unset ECCODES_GRIB_WRITE_ON_FAIL
unset ECCODES_GRIB_DATA_QUALITY_CHECKS
unset ECCODES_GRIB_KEEP_MATRIX
unset ECCODES_GRIB_NO_SPD
unset ECCODES_GRIB_NO_BIG_GROUP_SPLIT
unset ECCODES_GRIB_IEEE_PACKING
unset ECCODES_GRIBEX_MODE_ON
unset ECCODES_BUFRDC_MODE_ON
unset ECCODES_BUFR_SET_TO_MISSING_IF_OUT_OF_RANGE
unset ECCODES_BUFR_MULTI_ELEMENT_CONSTANT_ARRAYS
unset ECCODES_FILE_POOL_MAX_OPENED_FILES
unset ECCODES_IO_BUFFER_SIZE


proj_dir=/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source
data_dir=/home/vojta/Desktop/mffuk/bakalarka/build/data
HAVE_PRODUCT_BUFR=1
HAVE_PRODUCT_GRIB=1
HAVE_MEMFS=0

# use definitions from binary dir to test if installation will be correct
def_dir="/home/vojta/Desktop/mffuk/bakalarka/build/share/eccodes/definitions"
ECCODES_DEFINITION_PATH="${def_dir}"
export ECCODES_DEFINITION_PATH

tools_dir=/home/vojta/Desktop/mffuk/bakalarka/build/bin
examples_dir=/home/vojta/Desktop/mffuk/bakalarka/build/examples/C

# If this environment variable is set, then run the
# executables with valgrind
if test "x$ECCODES_TEST_WITH_VALGRIND" != "x"; then
   tools_dir="valgrind --error-exitcode=1 -q $tools_dir"
   examples_dir="valgrind --error-exitcode=1 -q $examples_dir"
fi

if [ $HAVE_MEMFS -eq 1 ]; then
   unset ECCODES_DEFINITION_PATH
fi

# use samples from binary dir to test if installation will be correct
samp_dir="/home/vojta/Desktop/mffuk/bakalarka/build/share/eccodes/samples"
ECCODES_SAMPLES_PATH=${samp_dir}
export ECCODES_SAMPLES_PATH

ECCODES_ON_WINDOWS=0
