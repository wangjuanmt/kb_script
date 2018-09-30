#!/usr/bin/env bash

FONT_TARGET_DIR=$USER_FONTS_DIR/IBMPlex

FONT_DOWNLOAD_URL="https://github.com/IBM/plex/releases/download/v1.1.6/OpenType.zip"

mkdir -p $USER_DOWNLOADS

FONT_ZIP_SAVE_NAME=IBMPlexOpenType.zip
FONT_ZIP_EXTRACTED_DIR_NAME=IBMPlex

cd $USER_DOWNLOADS
curl -L -o $FONT_ZIP_SAVE_NAME $FONT_DOWNLOAD_URL

chown $TARGET_USER:$TARGET_USER_GROUP $FONT_ZIP_SAVE_NAME
7za x -o$FONT_ZIP_EXTRACTED_DIR_NAME -y $FONT_ZIP_SAVE_NAME

# Remove the old version
[ -d $FONT_TARGET_DIR ] && rm -rf $FONT_TARGET_DIR

# Deploy the new version
mkdir -p $FONT_TARGET_DIR
cd $USER_DOWNLOADS/$FONT_ZIP_EXTRACTED_DIR_NAME
cp -rf ./OpenType $FONT_TARGET_DIR
chown -R $TARGET_USER:$TARGET_USER_GROUP $FONT_TARGET_DIR

# Cleanup
cd $USER_DOWNLOADS
rm -rf ./$FONT_ZIP_EXTRACTED_DIR_NAME
rm -f $FONT_ZIP_SAVE_NAME