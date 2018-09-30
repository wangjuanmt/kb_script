#!/usr/bin/env bash

GUAKE_TMP_DIR=$USER_DOWNLOADS/guake

if [ -d "$GUAKE_TMP_DIR" ]; then
    rm -rf $GUAKE_TMP_DIR
fi

git clone https://github.com/Guake/guake.git $GUAKE_TMP_DIR
cd $GUAKE_TMP_DIR
sudo bash ./dev.sh --install

rm -rf $GUAKE_TMP_DIR
