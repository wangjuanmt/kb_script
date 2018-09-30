#!/usr/bin/env bash

FFMPEG_TAR_NAME=ffmpeg-release-64bit-static.tar.xz
FFMPEG_TARGET_DIR=$APP_ROOT/player/ffmpeg

# Download latest version of ffmpeg from a 3rd party static build site
cd $USER_DOWNLOADS
wget http://johnvansickle.com/ffmpeg/releases/$FFMPEG_TAR_NAME
tar xf $FFMPEG_TAR_NAME

# Remove the old version if it exists
[ -d $FFMPEG_TARGET_DIR ] && rm -rf $FFMPEG_TARGET_DIR

# Deploy the new version
mv ./ffmpeg-* $FFMPEG_TARGET_DIR
chown $TARGET_USER:$TARGET_USER_GROUP $FFMPEG_TARGET_DIR

# Cleanup
rm -f $FFMPEG_TAR_NAME
