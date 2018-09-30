#!/usr/bin/env bash

# This installation doesn't work! These ruby will complain about a lib not found...

RBENV_HOME=$HOME/.rbenv
RBENV_EXEC=$RBENV_HOME/bin/rbenv

RUBY_VERSION=$1
SET_GLOBAL=$2

# For OSX:
# See https://bintray.com/homebrew/bottles/ruby#files

# For linux:
# See https://bintray.com/linuxbrew/bottles/ruby#files

if [[ $RUBY_VERSION = "latest" ]]; then
    if [[ $SYSTEM_ID = "osx" ]]; then
        export RUBY_VERSION=2.4.0
    else
        export RUBY_VERSION=2.4.0
    fi
fi

#RUBY_OSX_BINARY_DOWNLOAD_MIRROR="https://bintray.com/homebrew/bottles/download_file?file_path="
#RUBY_OSX_BINARY_DOWNLOAD_MIRROR="https://mirrors.ustc.edu.cn/homebrew-bottles/bottles/"
RUBY_OSX_BINARY_DOWNLOAD_MIRROR="https://mirror.tuna.tsinghua.edu.cn/homebrew-bottles/bottles/"
RUBY_LINUX_BINARY_DOWNLOAD_MIRROR="https://bintray.com/linuxbrew/bottles/download_file?file_path="

. $SCRIPT_UTIL_ROOT/determine_system_version.sh

if [[ $SYSTEM_ID = "osx" ]]; then
    export RUBY_BINARY_TARBALL_NAME="ruby-${RUBY_VERSION}.${SYSTEM_CODE_NAME}.bottle.tar.gz"
    export RUBY_BINARY_TARBALL_URL="${RUBY_OSX_BINARY_DOWNLOAD_MIRROR}${RUBY_BINARY_TARBALL_NAME}"
else
    export RUBY_BINARY_TARBALL_NAME="ruby-${RUBY_VERSION}.x86_64_linux.bottle.tar.gz"
    export RUBY_BINARY_TARBALL_URL="${RUBY_LINUX_BINARY_DOWNLOAD_MIRROR}${RUBY_BINARY_TARBALL_NAME}"
fi

CURRENT_DIR=$(pwd)
RUBY_TARGET_DIR=$RBENV_HOME/versions/$RUBY_VERSION
#wget -nc $RUBY_BINARY_TARBALL_URL -O $USER_DOWNLOADS/$RUBY_BINARY_TARBALL_NAME
curl -L -o $USER_DOWNLOADS/$RUBY_BINARY_TARBALL_NAME $RUBY_BINARY_TARBALL_URL
cd $USER_DOWNLOADS
mkdir -p $RUBY_TARGET_DIR
tar -xf $RUBY_BINARY_TARBALL_NAME -C $RUBY_TARGET_DIR --strip-components=2
#mv ruby/$RUBY_VERSION $RUBY_TARGET_DIR
#rm -rf ruby
#rm -f $RUBY_BINARY_TARBALL_NAME

eval "$($RBENV_EXEC init -)"

if [[ $SET_GLOBAL = "true" ]]; then
    $RBENV_EXEC global $RUBY_VERSION
fi

$RBENV_EXEC rehash

cd $CURRENT_DIR
