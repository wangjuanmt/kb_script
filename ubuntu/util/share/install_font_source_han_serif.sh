#!/usr/bin/env bash

DOWNLOAD_WITH_MIRROR=$1

if [[ $DOWNLOAD_WITH_MIRROR == "help" ]]; then
    echo "Usage: install_font_source_han_serif.sh [download_with_mirror? (optional, 'true' or 'false', 'true' by default)]"
    exit 0
fi

if [[ $DOWNLOAD_WITH_MIRROR == "" ]]; then
    DOWNLOAD_WITH_MIRROR="true"
fi

FONT_TARGET_DIR=$USER_FONTS_DIR/SourceHanSerif

if [[ $DOWNLOAD_WITH_MIRROR == "true" ]]; then
    FONT_DOWNLOAD_URL_1='https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-serif/OTF/SourceHanSerifSC_EL-M.zip'
    FONT_DOWNLOAD_URL_2='https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-han-serif/OTF/SourceHanSerifSC_SB-H.zip'
else
    FONT_DOWNLOAD_URL_1='https://github.com/adobe-fonts/source-han-serif/blob/release/OTF/SourceHanSerifSC_EL-M.zip'
    FONT_DOWNLOAD_URL_2='https://github.com/adobe-fonts/source-han-serif/blob/release/OTF/SourceHanSerifSC_SB-H.zip'
fi

mkdir -p $USER_DOWNLOADS

FONT_TAR_SAVE_NAME_1=SourceHanSerifSC_EL-M.zip
FONT_TAR_SAVE_NAME_2=SourceHanSerifSC_SB-H.zip
FONT_TAR_EXTRACTED_DIR_NAME_1=SourceHanSerifSC_EL-M
FONT_TAR_EXTRACTED_DIR_NAME_2=SourceHanSerifSC_SB-H

cd $USER_DOWNLOADS
curl -L -o $FONT_TAR_SAVE_NAME_1 $FONT_DOWNLOAD_URL_1
curl -L -o $FONT_TAR_SAVE_NAME_2 $FONT_DOWNLOAD_URL_2

chown $TARGET_USER:$TARGET_USER_GROUP $FONT_TAR_SAVE_NAME_1
chown $TARGET_USER:$TARGET_USER_GROUP $FONT_TAR_SAVE_NAME_2
7za x -y $FONT_TAR_SAVE_NAME_1
7za x -y $FONT_TAR_SAVE_NAME_2

# Remove the old version
[ -d $FONT_TARGET_DIR ] && rm -rf $FONT_TARGET_DIR

# Deploy the new version
mkdir -p $FONT_TARGET_DIR
cd $USER_DOWNLOADS/$FONT_TAR_EXTRACTED_DIR_NAME_1
cp -rf ./*.otf $FONT_TARGET_DIR/
cd $USER_DOWNLOADS/$FONT_TAR_EXTRACTED_DIR_NAME_2
cp -rf ./*.otf $FONT_TARGET_DIR/
chown -R $TARGET_USER:$TARGET_USER_GROUP $FONT_TARGET_DIR

# Cleanup
cd $USER_DOWNLOADS
rm -rf ./$FONT_TAR_EXTRACTED_DIR_NAME_1
rm -rf ./$FONT_TAR_EXTRACTED_DIR_NAME_2
rm -f $FONT_TAR_SAVE_NAME_1
rm -f $FONT_TAR_SAVE_NAME_2
rm -rf ./__MACOSX
