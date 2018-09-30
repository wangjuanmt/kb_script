#!/usr/bin/env bash

TMUX_HOME=$HOME/.tmux
TMUX_PLUGINS_HOME=$TMUX_HOME/plugins

mkdir -p $TMUX_PLUGINS_HOME

##################################################################
# Setup vim-plugin (plugin manager)
TPM_HOME=$TMUX_PLUGINS_HOME/tpm

git clone https://github.com/tmux-plugins/tpm $TPM_HOME
##################################################################

##################################################################
#Load tmux-sensible
TMUX_SENSIBLE_HOME=$TMUX_PLUGINS_HOME/tmux-sensible

if [ -d "$TMUX_SENSIBLE_HOME" ]; then
  rm -rf $TMUX_SENSIBLE_HOME
fi

git clone https://github.com/tmux-plugins/tmux-sensible.git $TMUX_SENSIBLE_HOME 
##################################################################

##################################################################
#Load tmux-colors-solarized
TMUX_SOLARIZED_HOME=$TMUX_PLUGINS_HOME/tmux-colors-solarized

if [ -d "$TMUX_SOLARIZED_HOME" ]; then
  rm -rf $TMUX_SOLARIZED_HOME
fi

git clone https://github.com/seebi/tmux-colors-solarized.git $TMUX_SOLARIZED_HOME 
##################################################################

chown -R $TARGET_USER:$TARGET_USER_GROUP $TMUX_HOME
