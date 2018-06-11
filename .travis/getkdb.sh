#!/usr/bin/env bash

set -e

if [ "${CONDA_FORCE_32BIT}" = "1" ]; then
  curl -O https://kx.com/$X/3.5/linuxx86.zip
  unzip -d $CONDA_PREFIX linuxx86.zip
  rm -f $CONDA_PREFIX/q/q.q
else
  curl -O -L $L64
  mkdir -p $CONDA_PREFIX/q
  unzip -d $CONDA_PREFIX/q l64.zip
  echo -n $QLIC_KC | base64 -d > $CONDA_PREFIX/q/kc.lic
fi
