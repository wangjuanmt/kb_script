#!/usr/bin/env bash

FONT_TMP_SAVE_DIR=$USER_DOWNLOADS/AwesomeTerminalFonts
FONT_TARGET_DIR=$USER_FONTS_DIR/AwesomeTerminalFonts

[ -d $FONT_TARGET_DIR ] && rm -rf $FONT_TARGET_DIR

mkdir -p $FONT_TMP_SAVE_DIR
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git $FONT_TMP_SAVE_DIR
cd $FONT_TMP_SAVE_DIR
git checkout patching-strategy
mkdir -p $FONT_TARGET_DIR
cp -rf patched/*.ttf $FONT_TARGET_DIR/
chown -R $TARGET_USER:$TARGET_USER_GROUP $FONT_TARGET_DIR

# Cleanup
rm -rf $FONT_TMP_SAVE_DIR