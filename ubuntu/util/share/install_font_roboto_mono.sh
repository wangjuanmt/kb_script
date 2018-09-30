#!/usr/bin/env bash

GIT_CHECKOUT_DIR=RobotoMono
FONT_TARGET_DIR=$USER_FONTS_DIR/$GIT_CHECKOUT_DIR

mkdir -p $FONT_TARGET_DIR
cd $FONT_TARGET_DIR

git init
git remote add origin https://github.com/google/fonts
git config core.sparsecheckout true
echo "apache/robotomono/*" >> .git/info/sparse-checkout
git pull --depth=1 origin master

# Next time just do a "git pull --depth=1 origin master" to update.
