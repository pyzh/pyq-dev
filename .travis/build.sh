#!/usr/bin/env bash

set -ex

if [ -n "${CONDA_FORCE_32BIT}"]; then
   arch=-m32
else
   arch=""
fi
python setup.py install_exe
python setup.py install_qlib
python setup.py install_qext
python setup.py install_scripts
LDFLAGS="$arch --coverage -lgcov"
CFLAGS="$arch --coverage"
export CFLAGS LDFLAGS
python setup.py build_ext --build-temp .
python setup.py install_lib
unset CFLAGS LDFLAGS
