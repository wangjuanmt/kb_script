#!/usr/bin/env bash

# Linuxbrew won't link libpng libs (it assumes OSX already has it),
# but freetype needs it, so we have to manually create a link for it.
brew install libpng
cd $LINUXBREW_HOME/lib
ln -s ../opt/libpng/lib/libpng16.so.16.19.0 libpng16.so.16
brew install mpv

# Unfotunatelly this mpv doesn't work, at least on Linux Mint 17.2
# Run "mpv -vo help" and "mpv -ao help" and I found out that
# the output doesn't contain "opengl" and "pulse" which
# mpv should be using.
