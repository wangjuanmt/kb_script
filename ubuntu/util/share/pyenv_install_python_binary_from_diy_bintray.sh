#!/usr/bin/env bash

PYENV_ROOT=$HOME/.pyenv
PYTHON_VERSION=$1
SET_GLOBAL=$2
DOWNLOAD_MIRROR="https://bintray.com/athrunsun/pyenv_python_build/download_file?file_path="
UNCOMPRESS_TARGET_DIR=$PYENV_ROOT/versions/$PYTHON_VERSION

. $SCRIPT_UTIL_ROOT/determine_system_version.sh

mkdir -p $USER_DOWNLOADS

if [[ $SYSTEM_ID != "osx" ]] && [[ $SYSTEM_ID != "ubuntu" ]]; then
    echo "System not supported yet!"
    exit 1
else
    PYTHON_BINARY_TARBALL_SAVE_NAME=pyenv_python_${PYTHON_VERSION}_${SYSTEM_ID}_${SYSTEM_VERSION}.tar.gz
    PYTHON_BINARY_TARBALL_URL="${DOWNLOAD_MIRROR}${PYTHON_BINARY_TARBALL_SAVE_NAME}"
    curl -L -o $USER_DOWNLOADS/$PYTHON_BINARY_TARBALL_SAVE_NAME $PYTHON_BINARY_TARBALL_URL
    cd $USER_DOWNLOADS
    mkdir -p $UNCOMPRESS_TARGET_DIR
    tar xzf $PYTHON_BINARY_TARBALL_SAVE_NAME -C $UNCOMPRESS_TARGET_DIR
fi

cd $UNCOMPRESS_TARGET_DIR

# Fix locations in all files of the downloaded python binary, mainly replace username.
# OSX version is built on travis-ci.
if [[ $SYSTEM_ID == "osx" ]]; then
    ORIGINAL_USER=travis
    ack -l "/Users/$ORIGINAL_USER/.pyenv/versions" | xargs perl -pi -E "s/\/Users\/$ORIGINAL_USER\/\.pyenv\/versions/\/Users\/$TARGET_USER\/\.pyenv\/versions/g"
# All other linux versions are built on gitlab with customized docker images.
else
    ORIGINAL_USER=athrun
    ack -l "/home/$ORIGINAL_USER/.pyenv/versions" | xargs perl -pi -E "s/\/home\/$ORIGINAL_USER\/\.pyenv\/versions/\/home\/$TARGET_USER\/\.pyenv\/versions/g"
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [[ $SET_GLOBAL = "true" ]]; then
    pyenv global $PYTHON_VERSION
fi

pyenv rehash
