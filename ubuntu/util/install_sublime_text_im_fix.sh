#!/usr/bin/env bash

# https://github.com/lyfeyaj/sublime-text-imfix
# http://www.jianshu.com/p/bf05fb3a4709

SUBLIME_TEXT_IM_FIX_HOME=$USER_LOCAL_LIB/sublime_text_im_fix
SUBLIME_TEXT_IM_FIX_LIB=$SUBLIME_TEXT_IM_FIX_HOME/libsublime-imfix.so

[[ ! -d $SUBLIME_TEXT_IM_FIX_HOME ]] && mkdir -p $SUBLIME_TEXT_IM_FIX_HOME

curl -L -o $SUBLIME_TEXT_IM_FIX_LIB https://github.com/lyfeyaj/sublime-text-imfix/raw/master/lib/libsublime-imfix.so
