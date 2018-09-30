#!/usr/bin/env bash

DOWNLOAD_WITH_MIRROR=$1

if [[ $DOWNLOAD_WITH_MIRROR == "help" ]]; then
    echo "Usage: install_font_source_han_sans.sh [download_with_mirror? (optional, 'true' or 'false', 'true' by default)]"
    exit 0
fi

if [[ $DOWNLOAD_WITH_MIRROR == "" ]]; then
    DOWNLOAD_WITH_MIRROR="true"
fi

FONT_TARGET_DIR=$USER_FONTS_DIR/SourceHanSans

if [[ $DOWNLOAD_WITH_MIRROR == "true" ]]; then
    FONT_DOWNLOAD_URL='https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-sans/OTF/SourceHanSansSC.zip'
else
    FONT_DOWNLOAD_URL='https://raw.githubusercontent.com/adobe-fonts/source-han-sans/release/OTF/SourceHanSansSC.zip'
fi

mkdir -p $USER_DOWNLOADS

FONT_TAR_SAVE_NAME=SourceHanSansSC.zip
FONT_TAR_EXTRACTED_DIR_NAME=SourceHanSansSC

cd $USER_DOWNLOADS
curl -L -o $FONT_TAR_SAVE_NAME $FONT_DOWNLOAD_URL

chown $TARGET_USER:$TARGET_USER_GROUP $FONT_TAR_SAVE_NAME
7za x -y $FONT_TAR_SAVE_NAME

# Remove the old version
[ -d $FONT_TARGET_DIR ] && rm -rf $FONT_TARGET_DIR

# Deploy the new version
mkdir -p $FONT_TARGET_DIR
cd ./$FONT_TAR_EXTRACTED_DIR_NAME
cp -rf ./*.otf $FONT_TARGET_DIR/
chown -R $TARGET_USER:$TARGET_USER_GROUP $FONT_TARGET_DIR

# Cleanup
cd $USER_DOWNLOADS
rm -rf ./$FONT_TAR_EXTRACTED_DIR_NAME
rm -f $FONT_TAR_SAVE_NAME
rm -rf ./__MACOSX
