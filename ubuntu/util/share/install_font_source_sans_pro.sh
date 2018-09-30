#!/usr/bin/env bash

DOWNLOAD_WITH_MIRROR=$1

if [[ $DOWNLOAD_WITH_MIRROR == "help" ]]; then
    echo "Usage: install_font_source_sans_pro.sh [download_with_mirror? (optional, 'true' or 'false', 'true' by default)]"
    exit 0
fi

if [[ $DOWNLOAD_WITH_MIRROR == "" ]]; then
    DOWNLOAD_WITH_MIRROR="true"
fi

FONT_TARGET_DIR=$USER_FONTS_DIR/SourceSansPro

# Downloading from mirror is recommended because it is always the latest version.
if [[ $DOWNLOAD_WITH_MIRROR == "true" ]]; then
    FONT_DOWNLOAD_MIRROR='https://mirrors.tuna.tsinghua.edu.cn/adobe-fonts/source-sans-pro/OTF/'
    wget -r -np -nH --cut-dirs=2 -R index.html* -e robots=off -P $FONT_TARGET_DIR $FONT_DOWNLOAD_MIRROR
# Downloading from official github repo requires version numbers.
else
    mkdir -p $USER_DOWNLOADS
    
    # Download fonts archive from official github repo
    FONT_DOWNLOAD_TARBALL='https://github.com/adobe-fonts/source-sans-pro/archive/2.020R-ro/1.075R-it.tar.gz'
    FONT_TAR_SAVE_NAME=SourceSansPro.tar.gz
    FONT_TAR_EXTRACTED_DIR_NAME=source-sans-pro-*

    cd $USER_DOWNLOADS
    curl -L -o $FONT_TAR_SAVE_NAME $FONT_DOWNLOAD_TARBALL

    chown $TARGET_USER:$TARGET_USER_GROUP $FONT_TAR_SAVE_NAME
    tar zxf $FONT_TAR_SAVE_NAME

    # Remove the old version
    [ -d $FONT_TARGET_DIR ] && rm -rf $FONT_TARGET_DIR

    # Deploy the new version
    mkdir -p $FONT_TARGET_DIR
    cd ./$FONT_TAR_EXTRACTED_DIR_NAME
    cp -rf ./OTF/*.otf $FONT_TARGET_DIR/
    chown -R $TARGET_USER:$TARGET_USER_GROUP $FONT_TARGET_DIR

    # Cleanup
    cd $USER_DOWNLOADS
    rm -rf ./$FONT_TAR_EXTRACTED_DIR_NAME
    rm -f $FONT_TAR_SAVE_NAME
fi
