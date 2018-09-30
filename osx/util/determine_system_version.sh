#!/usr/bin/env bash

# Split version number to get just {major.minor}, e.g. extract 10.10 from 10.10.5.
OSX_VERSION=$(sw_vers -productVersion)
OSX_VERSION_ARRAY=(${OSX_VERSION//./ })
export SYSTEM_VERSION="${OSX_VERSION_ARRAY[0]}.${OSX_VERSION_ARRAY[1]}"

if [[ $SYSTEM_VERSION = "10.10" ]]; then
    export SYSTEM_CODE_NAME="yosemite"
elif [[ $SYSTEM_VERSION = "10.11" ]]; then
    export SYSTEM_CODE_NAME="el_capitan"
elif [[ $SYSTEM_VERSION = "10.12" ]]; then
    export SYSTEM_CODE_NAME="sierra"
elif [[ $SYSTEM_VERSION = "10.13" ]]; then
    export SYSTEM_CODE_NAME="high_sierra"
fi
