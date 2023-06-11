# examples/python include file for CMake

set -eax

data_dir=/home/vojta/Desktop/mffuk/bakalarka/build/data
HAVE_PRODUCT_BUFR=1
HAVE_PRODUCT_GRIB=1
HAVE_MEMFS=0

# use definitions from binary dir to test if installation will be correct
def_dir="/home/vojta/Desktop/mffuk/bakalarka/build/share/eccodes/definitions"
ECCODES_DEFINITION_PATH="${def_dir}"
export ECCODES_DEFINITION_PATH

tools_dir=/home/vojta/Desktop/mffuk/bakalarka/build/bin
examples_dir=/home/vojta/Desktop/mffuk/bakalarka/build/examples/python
examples_src=/home/vojta/Desktop/mffuk/bakalarka/eccodes-2.30.2-Source/examples/python

# use samples from binary dir to test if installation will be correct
samp_dir="/home/vojta/Desktop/mffuk/bakalarka/build/share/eccodes/samples"
ECCODES_SAMPLES_PATH=${samp_dir}
export ECCODES_SAMPLES_PATH

if [ $HAVE_MEMFS -eq 1 ]; then
   unset ECCODES_DEFINITION_PATH
fi

PYTHONPATH=/home/vojta/Desktop/mffuk/bakalarka/build/python:$PYTHONPATH
export PYTHONPATH

echo "Current directory: `pwd`"
