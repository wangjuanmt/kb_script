#!/usr/bin/env bash

# This installation doesn't work! pyenv is not able to pick these versions...

PYENV_ROOT=$HOME/.pyenv
PYENV_EXEC=$PYENV_ROOT/bin/pyenv

# For OSX:
# See https://bintray.com/homebrew/bottles/python3#files
# See https://bintray.com/homebrew/bottles/python#files

# For linux:
# See https://bintray.com/linuxbrew/bottles/python3#files
# See https://bintray.com/linuxbrew/bottles/python#files

PYTHON_VERSION=$1
SET_GLOBAL=$2

if [[ $PYTHON_VERSION = "latest" ]]; then
    if [[ $SYSTEM_ID = "osx" ]]; then
        export PYTHON_VERSION=3.6.0
    else
        export PYTHON_VERSION=3.6.0
    fi
elif [[ $PYTHON_VERSION = "latest2" ]]; then
    if [[ $SYSTEM_ID = "osx" ]]; then
        export PYTHON_VERSION=2.7.13
    else
        export PYTHON_VERSION=2.7.13
    fi
fi

#PYTHON_OSX_BINARY_DOWNLOAD_MIRROR="https://bintray.com/homebrew/bottles/download_file?file_path="
#PYTHON_OSX_BINARY_DOWNLOAD_MIRROR="https://mirrors.ustc.edu.cn/homebrew-bottles/bottles/"
PYTHON_OSX_BINARY_DOWNLOAD_MIRROR="https://mirror.tuna.tsinghua.edu.cn/homebrew-bottles/bottles/"
PYTHON_LINUX_BINARY_DOWNLOAD_MIRROR="https://bintray.com/linuxbrew/bottles/download_file?file_path="

if [[ "$PYTHON_VERSION" =~ ^3.* ]]; then
    export PYTHON_BINARY_TARBALL_NAME_PREFIX="python3"
else
    export PYTHON_BINARY_TARBALL_NAME_PREFIX="python"
fi

. $SCRIPT_UTIL_ROOT/determine_system_version.sh

if [[ $SYSTEM_ID = "osx" ]]; then
    export PYTHON_BINARY_TARBALL_NAME="${PYTHON_BINARY_TARBALL_NAME_PREFIX}-${PYTHON_VERSION}.${SYSTEM_CODE_NAME}.bottle.tar.gz"
    export PYTHON_BINARY_TARBALL_DOWNLOAD_URL="${PYTHON_OSX_BINARY_DOWNLOAD_MIRROR}${PYTHON_BINARY_TARBALL_NAME}"
else
    export PYTHON_BINARY_TARBALL_NAME="${PYTHON_BINARY_TARBALL_NAME_PREFIX}-${PYTHON_VERSION}.x86_64_linux.bottle.tar.gz"
    export PYTHON_BINARY_TARBALL_DOWNLOAD_URL="${PYTHON_LINUX_BINARY_DOWNLOAD_MIRROR}${PYTHON_BINARY_TARBALL_NAME}"
fi

CURRENT_DIR=$(pwd)
PYTHON_TARGET_DIR=$PYENV_ROOT/versions/$PYTHON_VERSION

#wget -nc $PYTHON_BINARY_TARBALL_DOWNLOAD_URL -O $USER_DOWNLOADS/$PYTHON_BINARY_TARBALL_DOWNLOAD_URL
curl -L -o $USER_DOWNLOADS/$PYTHON_BINARY_TARBALL_DOWNLOAD_URL $PYTHON_BINARY_TARBALL_DOWNLOAD_URL
cd $USER_DOWNLOADS
tar -xf $PYTHON_BINARY_TARBALL_DOWNLOAD_URL -C $PYTHON_TARGET_DIR --strip-components=2
#mv $PYTHON_BINARY_TARBALL_NAME_PREFIX/$PYTHON_VERSION $PYTHON_TARGET_DIR
#rm -rf $PYTHON_BINARY_TARBALL_NAME_PREFIX
#rm -f $PYTHON_BINARY_TARBALL_DOWNLOAD_URL

eval "$($PYENV_EXEC init -)"
eval "$($PYENV_EXEC virtualenv-init -)"

if [[ $SET_GLOBAL = "true" ]]; then
    $PYENV_EXEC global $PYTHON_VERSION
fi

$PYENV_EXEC rehash

cd $CURRENT_DIR
