#!/usr/bin/env bash

. $SCRIPT_UTIL_ROOT/determine_system_version.sh

if [[ $SYSTEM_ID == "osx" ]]; then
    if [[ $SYSTEM_VERSION == "10.10" ]]; then
        RUBY_2_LATEST_STABLE_VERSION=2.2.3
    elif [[ $SYSTEM_VERSION == "10.11" ]]; then
        RUBY_2_LATEST_STABLE_VERSION=2.2.5
    elif [[ $SYSTEM_VERSION == "10.12" ]]; then
        RUBY_2_LATEST_STABLE_VERSION=2.2.5
    else
        echo "rbenv_install_latest_ruby_binary_from_rvm.sh: unsupport OSX system version, cannot determine latest ruby version!"
        exit 1
    fi
elif [[ $SYSTEM_ID == "ubuntu" ]]; then
    RUBY_2_LATEST_STABLE_VERSION=2.4.2
else
    echo "rbenv_install_latest_ruby_binary_from_rvm.sh: unsupport system id, cannot determine latest ruby version!"
    exit 1
fi

# Install ruby by downloading precompiled binaries
. $SCRIPT_UTIL_SHARE/rbenv_install_ruby_binary_from_rvm.sh $RUBY_2_LATEST_STABLE_VERSION true
