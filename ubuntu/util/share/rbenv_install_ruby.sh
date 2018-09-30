#!/usr/bin/env bash

# Install ruby by compiling it from source

RBENV_HOME=$HOME/.rbenv
RBENV_EXEC=$RBENV_HOME/bin/rbenv

RUBY_VERSION=$1
SET_GLOBAL=$2
USE_DOWNLOAD_MIRROR=$3

RUBY_DOWNLOAD_MIRROR_TAOBAO=https://ruby.taobao.org/mirrors/ruby
RUBY_DOWNLOAD_MIRROR_RUBY_CHINA=https://cache.ruby-china.com/pub/ruby/

RUBY_TARBALL_SAVE_NAME=ruby-$RUBY_VERSION.tar.bz2
RUBY_DOWNLOAD_URL=$RUBY_DOWNLOAD_MIRROR_TAOBAO/$RUBY_TARBALL_SAVE_NAME

# Download source tarball from mirror to cache first to speed up ruby installation
if [[ $USE_DOWNLOAD_MIRROR == "true" ]]; then
    mkdir -p $RBENV_HOME/cache
    #wget -nc $RUBY_DOWNLOAD_URL -P $RBENV_HOME/cache/
    curl -L -o $RBENV_HOME/cache/$RUBY_TARBALL_SAVE_NAME $RUBY_DOWNLOAD_URL
fi

# Load rbenv script
eval "$($RBENV_EXEC init -)"

# Permission when linking miniruby
# https://github.com/rbenv/ruby-build/issues/992
sudo $RBENV_EXEC install -s -v $RUBY_VERSION

sudo chown -R $TARGET_USER:$TARGET_USER_GROUP $RBENV_HOME

if [[ $SET_GLOBAL = "true" ]]; then
    $RBENV_EXEC global $RUBY_VERSION
fi

$RBENV_EXEC rehash
