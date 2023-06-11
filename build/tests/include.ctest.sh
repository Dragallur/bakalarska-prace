set -ea

. ./utils.sh

# Not all Unix shells support this unfortunately
#set -o pipefail

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

set -x
echo "Script: $0"

proj_dir=/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source
build_dir=/home/vojta/Desktop/mffuk/bakalarka/build
data_dir=/home/vojta/Desktop/mffuk/bakalarka/build/data

# use definitions from binary dir to test if installation will be correct
def_dir="/home/vojta/Desktop/mffuk/bakalarka/build/share/eccodes/definitions"
ECCODES_DEFINITION_PATH="${def_dir}"
export ECCODES_DEFINITION_PATH

# binaries are in the TOP CMAKE_BINARY_DIR
tools_dir=/home/vojta/Desktop/mffuk/bakalarka/build/bin
tigge_dir=/home/vojta/Desktop/mffuk/bakalarka/build/bin

# If this environment variable is set, then run the
# executables with valgrind. See ECC-746
EXEC=""
if test "x$ECCODES_TEST_WITH_VALGRIND" != "x"; then
  EXEC="valgrind --error-exitcode=1 -q"
  tools_dir="$EXEC /home/vojta/Desktop/mffuk/bakalarka/build/bin"
fi

# ecCodes tests are in the PROJECT_BINARY_DIR
test_dir=/home/vojta/Desktop/mffuk/bakalarka/build/tests

# use samples from binary dir to test if installation will be correct
samp_dir="/home/vojta/Desktop/mffuk/bakalarka/build/share/eccodes/samples"
ECCODES_SAMPLES_PATH=${samp_dir}
export ECCODES_SAMPLES_PATH

set -u

# Options
HAVE_PRODUCT_BUFR=1
HAVE_PRODUCT_GRIB=1
HAVE_JPEG=1
HAVE_LIBJASPER=0
HAVE_LIBOPENJPEG=1
HAVE_PNG=0
HAVE_AEC=1
HAVE_EXTRA_TESTS=0
HAVE_MEMFS=0
ECCODES_ON_WINDOWS=0

echo "Current directory: `pwd`"
