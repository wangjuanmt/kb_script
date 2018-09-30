#!/usr/bin/env bash

# Patched fonts for Powerline users
# Will install SourceCodePro only
FONT_TMP_SAVE_DIR=$USER_DOWNLOADS/powerline-fonts
FONT_TARGET_DIR=$USER_FONTS_DIR/powerline-fonts

[ -d $FONT_TARGET_DIR ] && rm -rf $FONT_TARGET_DIR

mkdir -p $FONT_TMP_SAVE_DIR
git clone https://github.com/powerline/fonts.git $FONT_TMP_SAVE_DIR
cd $FONT_TMP_SAVE_DIR
mkdir -p $FONT_TARGET_DIR
cp -rf SourceCodePro/*.otf $FONT_TARGET_DIR/
chown -R $TARGET_USER:$TARGET_USER_GROUP $FONT_TARGET_DIR

# Cleanup
rm -rf $FONT_TMP_SAVE_DIR
