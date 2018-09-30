#!/usr/bin/env bash

# To install pyenv/python with proxy, set environment variables 'http_proxy' & 'https_proxy'

. $SCRIPT_UTIL_SHARE/pyenv_install_python.sh $PYTHON_3_LATEST_STABLE_VERSION true true
#. $SCRIPT_UTIL_SHARE/pyenv_install_python.sh $PYTHON_2_LATEST_STABLE_VERSION false true

#. $SCRIPT_UTIL_SHARE/pyenv_install_python_binary_from_diy_bintray.sh $PYTHON_3_LATEST_STABLE_VERSION true
#. $SCRIPT_UTIL_SHARE/pyenv_install_python_binary_from_diy_bintray.sh $PYTHON_2_LATEST_STABLE_VERSION false
