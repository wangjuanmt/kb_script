#!/usr/bin/env bash

# Unfortunately ruby versions installed by this doesn't work on OSX because of an error:
#<internal:gem_prelude>:4:in `require': cannot load such file -- rubygems.rb (LoadError)
#    from <internal:gem_prelude>:4:in `<internal:gem_prelude>'

RBENV_HOME=$HOME/.rbenv
RUBY_VERSION=$1
SET_GLOBAL=$2
DOWNLOAD_MIRROR="https://bintray.com/athrunsun/rbenv_ruby_build/download_file?file_path="
UNCOMPRESS_TARGET_DIR=$RBENV_HOME/versions/$RUBY_VERSION

. $SCRIPT_UTIL_ROOT/determine_system_version.sh

if [[ $SYSTEM_ID != "osx" ]] && [[ $SYSTEM_ID != "ubuntu" ]]; then
    echo "System not supported yet!"
    exit 1
else
    RUBY_BINARY_TARBALL_SAVE_NAME=rbenv_ruby_${RUBY_VERSION}_${SYSTEM_ID}_${SYSTEM_VERSION}.tar.gz
    RUBY_BINARY_TARBALL_URL="${DOWNLOAD_MIRROR}${RUBY_BINARY_TARBALL_SAVE_NAME}"
    curl -L -o $USER_DOWNLOADS/$RUBY_BINARY_TARBALL_SAVE_NAME $RUBY_BINARY_TARBALL_URL
    cd $USER_DOWNLOADS
    mkdir -p $UNCOMPRESS_TARGET_DIR
    tar xzf $RUBY_BINARY_TARBALL_SAVE_NAME -C $UNCOMPRESS_TARGET_DIR
fi

cd $UNCOMPRESS_TARGET_DIR

# Fix locations in all files of the downloaded ruby binary, mainly replace username.
# OSX version is built on travis-ci.
if [[ $SYSTEM_ID == "osx" ]]; then
    ORIGINAL_USER=travis
    ack -l "/Users/$ORIGINAL_USER/.rbenv/versions" | xargs perl -pi -E "s/\/Users\/$ORIGINAL_USER\/\.rbenv\/versions/\/Users\/$TARGET_USER\/\.rbenv\/versions/g"
# All other linux versions are built on gitlab with customized docker images.
else
    ORIGINAL_USER=athrun
    ack -l "/home/$ORIGINAL_USER/.rbenv/versions" | xargs perl -pi -E "s/\/home\/$ORIGINAL_USER\/\.rbenv\/versions/\/home\/$TARGET_USER\/\.rbenv\/versions/g"
fi

eval "$(rbenv init -)"

if [[ $SET_GLOBAL = "true" ]]; then
    rbenv global $RUBY_VERSION
fi

rbenv rehash
