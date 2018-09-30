#!/usr/bin/env bash

VIM_HOME=$HOME/.vim
VIM_PLUGIN_HOME=$VIM_HOME/bundle

##################################################################
# Install Vundle.vim
VIM_VUNDLE_HOME=$VIM_PLUGIN_HOME/Vundle.vim

if [ -d "$VIM_VUNDLE_HOME" ]; then
  rm -rf $VIM_VUNDLE_HOME
fi

git clone https://github.com/VundleVim/Vundle.vim.git $VIM_VUNDLE_HOME
##################################################################

##################################################################
# Install pathogen.vim
#mkdir -p $VIM_HOME/autoload $VIM_PLUGIN_HOME && \
#curl -LSso $VIM_HOME/autoload/pathogen.vim https://tpo.pe/pathogen.vim
##################################################################

##################################################################
# Load vim-colors-solarized
VIM_COLORS_SOLARIZED_DIR=$VIM_PLUGIN_HOME/vim-colors-solarized

if [ -d "$VIM_COLORS_SOLARIZED_DIR" ]; then
  rm -rf $VIM_COLORS_SOLARIZED_DIR
fi

git clone https://github.com/altercation/vim-colors-solarized.git $VIM_COLORS_SOLARIZED_DIR
##################################################################

##################################################################
# Load onedark.vim
VIM_COLORS_ONE_DARK=$VIM_PLUGIN_HOME/onedark.vim

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
# Load vim airline
# VIM_AIRLINE_DIR=$VIM_PLUGIN_HOME/vim-airline

# if [ -d "$VIM_AIRLINE_DIR" ]; then
#     rm -rf $VIM_AIRLINE_DIR
# fi

# git clone https://github.com/bling/vim-airline $VIM_AIRLINE_DIR
# And run ':Helptags' in vim to generate tags.
##################################################################

##################################################################
# Load vim-fugitive
VIM_FUGITIVE_DIR=$VIM_PLUGIN_HOME/vim-fugitive

if [ -d "$VIM_FUGITIVE_DIR" ]; then
  rm -rf $VIM_FUGITIVE_DIR
fi

git clone https://github.com/tpope/vim-fugitive.git $VIM_FUGITIVE_DIR
vim -u NONE -c "helptags vim-fugitive/doc" -c q
##################################################################

##################################################################
# Load vim-gitgutter
VIM_GITGUTTER_DIR=$VIM_PLUGIN_HOME/vim-gitgutter

if [ -d "$VIM_GITGUTTER_DIR" ]; then
  rm -rf $VIM_GITGUTTER_DIR
fi

git clone https://github.com/airblade/vim-gitgutter.git $VIM_GITGUTTER_DIR
##################################################################

##################################################################
# Load lightline.vim
LIGHT_LINE_VIM_DIR=$VIM_PLUGIN_HOME/lightline.vim

if [ -d "$LIGHT_LINE_VIM_DIR" ]; then
  rm -rf $LIGHT_LINE_VIM_DIR
fi

git clone https://github.com/itchyny/lightline.vim.git $LIGHT_LINE_VIM_DIR
##################################################################

##################################################################
# Load NERD Tree
NERD_TREE_VIM_DIR=$VIM_PLUGIN_HOME/nerdtree

if [ -d "$NERD_TREE_VIM_DIR" ]; then
  rm -rf $NERD_TREE_VIM_DIR
fi

git clone https://github.com/scrooloose/nerdtree.git $NERD_TREE_VIM_DIR
##################################################################

##################################################################
# Load vim-nerdtree-tabs
VIM_NERDTREE_TABS_VIM_DIR=$VIM_PLUGIN_HOME/vim-nerdtree-tabs

if [ -d "$VIM_NERDTREE_TABS_VIM_DIR" ]; then
  rm -rf $VIM_NERDTREE_TABS_VIM_DIR
fi

git clone https://github.com/jistr/vim-nerdtree-tabs.git $VIM_NERDTREE_TABS_VIM_DIR
##################################################################

##################################################################
# Load nerdtree-git-plugin
VIM_NERDTREE_GIT_PLUGIN_DIR=$VIM_PLUGIN_HOME/nerdtree-git-plugin

if [ -d "$VIM_NERDTREE_GIT_PLUGIN_DIR" ]; then
  rm -rf $VIM_NERDTREE_GIT_PLUGIN_DIR
fi

git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git $VIM_NERDTREE_GIT_PLUGIN_DIR
##################################################################

##################################################################
# Source a basic configuration to ~/.vimrc
#touch $HOME/.vimrc
#chown $TARGET_USER:$TARGET_USER_GROUP $HOME/.vimrc
#old="^.*custom_vimrc.*"
#printf -v new "source \$SCRIPT_UTIL_SHARE/custom_vimrc"
#grep -q '^.*custom_vimrc' $HOME/.vimrc && sed -i "s~$old~$new~" $HOME/.vimrc || printf "\n\nsource \$SCRIPT_UTIL_SHARE/custom_vimrc" | tee -a $HOME/.vimrc
##################################################################

##################################################################
# Load tmuxline.vim
TMUX_LINE_VIM_DIR=$VIM_PLUGIN_HOME/tmuxline.vim

if [ -d "$TMUX_LINE_VIM_DIR" ]; then
   rm -rf $TMUX_LINE_VIM_DIR
fi

git clone https://github.com/edkolev/tmuxline.vim.git $TMUX_LINE_VIM_DIR

# Within vim inside a tmux session, run the following command to enable tmuxline
#:Tmuxline lightline
# Then we can run the following command to save current config to a file
#:TmuxlineSnapshot [file]

# Append the following line to ~/.tmux.conf
#if-shell "test -f $APP_SCRIPT_SHARE/tmux_config/tmuxline.snapshot" "source $APP_SCRIPT_SHARE/tmux_config/tmuxline.snapshot"
##################################################################

##################################################################
#Load ctrlp.vim
CTRLP_DIR=$VIM_PLUGIN_HOME/ctrlp.vim

if [ -d "$CTRLP_DIR" ]; then
  rm -rf $CTRLP_DIR
fi

git clone https://github.com/ctrlpvim/ctrlp.vim.git $CTRLP_DIR 
##################################################################

##################################################################
#Load vim-multiple-cursors
VIM_MULTIPLE_CURSORS_DIR=$VIM_PLUGIN_HOME/vim-multiple-cursors

if [ -d "$VIM_MULTIPLE_CURSORS_DIR" ]; then
  rm -rf $VIM_MULTIPLE_CURSORS_DIR
fi

git clone https://github.com/terryma/vim-multiple-cursors.git $VIM_MULTIPLE_CURSORS_DIR
##################################################################

##################################################################
#Load vim-javascript
VIM_JAVASCRIPT_DIR=$VIM_PLUGIN_HOME/vim-javascript

if [ -d "$VIM_JAVASCRIPT_DIR" ]; then
  rm -rf $VIM_JAVASCRIPT_DIR
fi

git clone https://github.com/pangloss/vim-javascript.git $VIM_JAVASCRIPT_DIR
##################################################################

##################################################################
#Load ctrlsf
VIM_CTRLSF_DIR=$VIM_PLUGIN_HOME/ctrlsf.vim

if [ -d "$VIM_CTRLSF_DIR" ]; then
  rm -rf $VIM_CTRLSF_DIR
fi

git clone https://github.com/dyng/ctrlsf.vim.git $VIM_CTRLSF_DIR
##################################################################

##################################################################
#Load ack.vim
VIM_ACKVIM_DIR=$VIM_PLUGIN_HOME/ack.vim

if [ -d "$VIM_ACKVIM_DIR" ]; then
  rm -rf $VIM_ACKVIM_DIR
fi

git clone https://github.com/mileszs/ack.vim.git $VIM_ACKVIM_DIR
##################################################################

##################################################################
#Load vim-markdown
VIM_MARKDOWN_DIR=$VIM_PLUGIN_HOME/vim-markdown

if [ -d "$VIM_MARKDOWN_DIR" ]; then
  rm -rf $VIM_MARKDOWN_DIR
fi

git clone https://github.com/gabrielelana/vim-markdown.git $VIM_MARKDOWN_DIR
##################################################################

##################################################################
# Load indentLine
VIM_INDENTLINE_DIR=$VIM_PLUGIN_HOME/indentline

if [[ -d $VIM_INDENTLINE_DIR ]]; then
    rm -rf $VIM_INDENTLINE_DIR
fi

git clone https://github.com/Yggdroot/indentLine.git $VIM_INDENTLINE_DIR
##################################################################

# Change owner in case we are running this script with sudo
chown -R $TARGET_USER:$TARGET_USER_GROUP $VIM_HOME
