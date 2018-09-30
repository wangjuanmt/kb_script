#!/usr/bin/env bash

RBENV_HOME=$HOME/.rbenv
RBENV_EXEC=$RBENV_HOME/bin/rbenv

RUBY_VERSION=$1
SET_GLOBAL=$2

# Binary version on https://rvm.io number is behind source tarball version
RUBY_DOWNLOAD_MIRROR="https://rvm.io/binaries"

RUBY_BINARY_TARBALL_NAME="ruby-${RUBY_VERSION}.tar.bz2"
. $SCRIPT_UTIL_ROOT/determine_system_version.sh

mkdir -p $USER_DOWNLOADS
RUBY_BINARY_DOWNLOAD_URL=$RUBY_DOWNLOAD_MIRROR/$SYSTEM_ID/$SYSTEM_VERSION/x86_64/$RUBY_BINARY_TARBALL_NAME
RUBY_BINARY_TARBALL_SAVE_PATH=$USER_DOWNLOADS/$RUBY_BINARY_TARBALL_NAME

CURRENT_DIR=$(pwd)
RUBY_TARGET_DIR=$RBENV_HOME/versions/$RUBY_VERSION
# -nc, --no-clobber: skip downloads that would download to existing files
#wget -nc $RUBY_BINARY_DOWNLOAD_URL -O $RUBY_BINARY_TARBALL_SAVE_PATH
curl -L -o $RUBY_BINARY_TARBALL_SAVE_PATH $RUBY_BINARY_DOWNLOAD_URL
cd $USER_DOWNLOADS
mkdir -p $RUBY_TARGET_DIR
tar -xf $RUBY_BINARY_TARBALL_NAME -C $RUBY_TARGET_DIR --strip-components=1
#mv ruby-$RUBY_VERSION $RUBY_TARGET_DIR
#rm -f $RUBY_BINARY_TARBALL_NAME

cd $RUBY_TARGET_DIR

# Fix incorrect prefix
if [[ $SYSTEM_ID == "osx" ]]; then
    ack -l "/Users/kuczynsk/.rvm/rubies/ruby-$RUBY_VERSION" | xargs perl -pi -E "s/\/Users\/kuczynsk\/\.rvm\/rubies\/ruby\-$RUBY_VERSION/\/Users\/$TARGET_USER\/\.rbenv\/versions\/$RUBY_VERSION/g"
else
    ack -l "/usr/share/rvm/rubies/ruby-$RUBY_VERSION" | xargs perl -pi -E "s/\/usr\/share\/rvm\/rubies\/ruby\-$RUBY_VERSION/\/home\/$TARGET_USER\/\.rbenv\/versions\/$RUBY_VERSION/g"
fi

eval "$($RBENV_EXEC init -)"

if [[ $SET_GLOBAL = "true" ]]; then
    $RBENV_EXEC global $RUBY_VERSION
fi

$RBENV_EXEC rehash

cd $CURRENT_DIR
