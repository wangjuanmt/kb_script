#!/usr/bin/env bash

# https://github.com/ofek/hatch

MINICONDA_3_PREFIX="$USER_LOCAL_APP/miniconda3"
MINICONDA_2_PREFIX="$USER_LOCAL_APP/miniconda2"

pip install hatch

hatch pypath py3 $MINICONDA_3_PREFIX/bin/python
hatch pypath py2 $MINICONDA_2_PREFIX/bin/python
