#!/usr/bin/env bash

# Check neovim-specific plugins in https://github.com/neovim/neovim/wiki/Related-projects#plugins

NEO_VIM_HOME=$HOME/.config/nvim
NEO_VIM_PLUGIN_HOME=$NEO_VIM_HOME/plugged

mkdir -p $NEO_VIM_PLUGIN_HOME

##################################################################
# Setup vim-plugin (plugin manager)
NEO_VIM_PLUGIN_MGR_FOLDER=$HOME/.local/share/nvim/site/autoload
NEO_VIM_PLUGIN_MGR_FILE=$NEO_VIM_PLUGIN_MGR_FOLDER/plug.vim

mkdir -p $NEO_VIM_PLUGIN_MGR_FOLDER

if [ -f "$NEO_VIM_PLUGIN_MGR_FILE" ]; then
  rm -f $NEO_VIM_PLUGIN_MGR_FILE
fi

curl -fLo $NEO_VIM_PLUGIN_MGR_FILE --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
##################################################################

##################################################################
# Load NeoSolarized
NEO_SOLARIZED_DIR=$NEO_VIM_PLUGIN_HOME/NeoSolarized

if [ -d "$NEO_SOLARIZED_DIR" ]; then
  rm -rf $NEO_SOLARIZED_DIR
fi

git clone https://github.com/iCyMind/NeoSolarized.git $NEO_SOLARIZED_DIR
##################################################################

##################################################################
# Load onedark.vim
VIM_COLORS_ONE_DARK=$NEO_VIM_PLUGIN_HOME/onedark.vim

if [ -d "$VIM_COLORS_ONE_DARK" ]; then
  rm -rf $VIM_COLORS_ONE_DARK
fi

git clone https://github.com/joshdick/onedark.vim.git $VIM_COLORS_ONE_DARK
##################################################################

##################################################################
# Load vim-polyglot
VIM_POLYGLOT=$VIM_PLUGIN_HOME/vim-polyglot

if [ -d "$VIM_POLYGLOT" ]; then
  rm -rf $VIM_POLYGLOT
fi

git clone https://github.com/sheerun/vim-polyglot.git $VIM_POLYGLOT
##################################################################

##################################################################
# Load vim-gitgutter
VIM_GITGUTTER_DIR=$NEO_VIM_PLUGIN_HOME/vim-gitgutter

if [ -d "$VIM_GITGUTTER_DIR" ]; then
  rm -rf $VIM_GITGUTTER_DIR
fi

git clone https://github.com/airblade/vim-gitgutter.git $VIM_GITGUTTER_DIR
##################################################################

##################################################################
# Load lightline.vim
LIGHT_LINE_VIM_DIR=$NEO_VIM_PLUGIN_HOME/lightline.vim

if [ -d "$LIGHT_LINE_VIM_DIR" ]; then
  rm -rf $LIGHT_LINE_VIM_DIR
fi

git clone https://github.com/itchyny/lightline.vim.git $LIGHT_LINE_VIM_DIR
##################################################################

##################################################################
# Load NERD Tree
NERD_TREE_VIM_DIR=$NEO_VIM_PLUGIN_HOME/nerdtree

if [ -d "$NERD_TREE_VIM_DIR" ]; then
  rm -rf $NERD_TREE_VIM_DIR
fi

git clone https://github.com/scrooloose/nerdtree.git $NERD_TREE_VIM_DIR
##################################################################

##################################################################
# Load vim-nerdtree-tabs
NERDTREE_TABS_VIM_DIR=$NEO_VIM_PLUGIN_HOME/vim-nerdtree-tabs

if [ -d "$NERDTREE_TABS_VIM_DIR" ]; then
  rm -rf $NERDTREE_TABS_VIM_DIR
fi

git clone https://github.com/jistr/vim-nerdtree-tabs.git $NERDTREE_TABS_VIM_DIR
##################################################################

##################################################################
# Load nerdtree-git-plugin
NERDTREE_GIT_PLUGIN_DIR=$NEO_VIM_PLUGIN_HOME/nerdtree-git-plugin

if [ -d "$NERDTREE_GIT_PLUGIN_DIR" ]; then
  rm -rf $NERDTREE_GIT_PLUGIN_DIR
fi

git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git $NERDTREE_GIT_PLUGIN_DIR
##################################################################

##################################################################
# Load tmuxline.vim
TMUX_LINE_VIM_DIR=$NEO_VIM_PLUGIN_HOME/tmuxline.vim

if [ -d "$TMUX_LINE_VIM_DIR" ]; then
   rm -rf $TMUX_LINE_VIM_DIR
fi

git clone https://github.com/edkolev/tmuxline.vim.git $TMUX_LINE_VIM_DIR
##################################################################

##################################################################
#Load ctrlp.vim
CTRLP_DIR=$NEO_VIM_PLUGIN_HOME/ctrlp.vim

if [ -d "$CTRLP_DIR" ]; then
  rm -rf $CTRLP_DIR
fi

git clone https://github.com/ctrlpvim/ctrlp.vim.git $CTRLP_DIR 
##################################################################

##################################################################
#Load vim-multiple-cursors
VIM_MULTIPLE_CURSORS_DIR=$NEO_VIM_PLUGIN_HOME/vim-multiple-cursors

if [ -d "$VIM_MULTIPLE_CURSORS_DIR" ]; then
  rm -rf $VIM_MULTIPLE_CURSORS_DIR
fi

git clone https://github.com/terryma/vim-multiple-cursors.git $VIM_MULTIPLE_CURSORS_DIR
##################################################################

##################################################################
#Load vim-javascript
VIM_JAVASCRIPT_DIR=$NEO_VIM_PLUGIN_HOME/vim-javascript

if [ -d "$VIM_JAVASCRIPT_DIR" ]; then
  rm -rf $VIM_JAVASCRIPT_DIR
fi

git clone https://github.com/pangloss/vim-javascript.git $VIM_JAVASCRIPT_DIR
##################################################################

##################################################################
#Load ctrlsf
CTRLSF_DIR=$NEO_VIM_PLUGIN_HOME/ctrlsf.vim

if [ -d "$CTRLSF_DIR" ]; then
  rm -rf $CTRLSF_DIR
fi

git clone https://github.com/dyng/ctrlsf.vim.git $CTRLSF_DIR
##################################################################

##################################################################
#Load ack.vim
ACKVIM_DIR=$NEO_VIM_PLUGIN_HOME/ack.vim

if [ -d "$ACKVIM_DIR" ]; then
  rm -rf $ACKVIM_DIR
fi

git clone https://github.com/mileszs/ack.vim.git $ACKVIM_DIR
##################################################################

##################################################################
#Load vim-markdown
VIM_MARKDOWN_DIR=$NEO_VIM_PLUGIN_HOME/vim-markdown

if [ -d "$VIM_MARKDOWN_DIR" ]; then
  rm -rf $VIM_MARKDOWN_DIR
fi

git clone https://github.com/gabrielelana/vim-markdown.git $VIM_MARKDOWN_DIR
##################################################################

# Change owner in case we are running this script with sudo
chown -R $TARGET_USER:$TARGET_USER_GROUP $NEO_VIM_HOME
