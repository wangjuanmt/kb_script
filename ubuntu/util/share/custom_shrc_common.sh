#!/usr/bin/env bash

export TERM=xterm-256color

#export PYTHON_3_LATEST_STABLE_VERSION=3.7.0
export PYTHON_3_LATEST_STABLE_VERSION=3.6.6
export PYTHON_2_LATEST_STABLE_VERSION=2.7.15
export RUBY_2_LATEST_STABLE_VERSION=2.5.1
export GOLANG_LATEST_STABLE_VERSION=1.10.3

# Best practice for $JAVA_HOME is pointing to $JVM_DIR/jdk.
# NOTE that this affects maven and ONLY current shell's $JAVA_HOME
# but not 'java' executable b/c $JAVA_HOME/bin is already interpreted
# when shell loads $PATH.
function set_jdk() {
    export JAVA_HOME=$JVM_DIR/$@
}

# NOTE that this affects maven and ALL shells' $JAVA_HOME,
# as well as 'java' executable.
function change_jdk() {
    current_dir=$(pwd)
    rm -f $JVM_DIR/jdk
    cd $JVM_DIR
    ln -s $JVM_DIR/$@ $JVM_DIR/jdk
    cd $current_dir
}

# https://gist.github.com/legovaer/61923f0839401342c758
# Usage: gitb <file>
gitb() {
    ruby $SCRIPT_UTIL_SHARE/git_blame_colored.rb $1 | less -R
}

# Import Ruby Gem binaries if exist (deprecated after introducing rvm)
#if which ruby >/dev/null && which gem >/dev/null; then
#    export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi
#if which ruby2.0 >/dev/null && which gem2.0 >/dev/null; then
#    export PATH="$(ruby2.0 -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

# Import RVM functions
#. $SCRIPT_UTIL_SHARE/load_rvm.sh

# Load nvm
#. $SCRIPT_UTIL_SHARE/load_nvm.sh

# Load gvm
. $SCRIPT_UTIL_SHARE/load_gvm.sh

. $SCRIPT_UTIL_SHARE/xenv_functions_common.sh

# Load n
load_n

# Load sdkman
#. $SCRIPT_UTIL_SHARE/load_sdkman.sh

# For https://github.com/jarun/googler
#alias ggp="googler -p 127.0.0.1:8123"

# To update locate db, run:
# "sudo updatedb" on linux,
# and "sudo /usr/libexec/locate.updatedb" on macos.
if [[ $SYSTEM_CATEGORY = "mac" ]]; then
    # Use "glocate" and "sudo gupdatedb" from "brew install findutils"
    alias lf="glocate / | fzf -m"
else
    #alias lf="locate / | fzf-tmux -m"
    alias lf="locate / | fzf -m"
fi

# Use "cnpm" or:
#npm config set registry "https://npmreg.proxy.ustclug.org"
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# An alternative to 'npx'.
# Use single quotes instead of double quotes!
alias npm-exec='PATH=$(npm bin):$PATH'

alias pc="proxychains4 -f $APP_SCRIPT_SHARE/proxychains_config/proxychains.conf"

alias export_polipo_proxy_env_vars="export http_proxy=http://127.0.0.1:8123/;export https_proxy=http://127.0.0.1:8123/;export ftp_proxy=http://127.0.0.1:8123/;export rsync_proxy=http://127.0.0.1:8123/;export no_proxy=\"localhost,127.0.0.1\""
alias export_privoxy_proxy_env_vars="export http_proxy=http://127.0.0.1:8118/;export https_proxy=http://127.0.0.1:8118/;export ftp_proxy=http://127.0.0.1:8118/;export rsync_proxy=http://127.0.0.1:8118/;export no_proxy=\"localhost,127.0.0.1\""

alias gitrf="git reflog --format='%C(auto)%h %<|(17)%gd %C(blue)%ci%C(reset) %s'"
alias gitv="PAGER='vim -R -' git -c color.ui=false"

# Use neovim whenever possible, and set it as default EDITOR
# if command -v nvim 1>/dev/null 2>&1; then
#     alias vim="nvim"
#     export EDITOR=nvim
# else
#     echo "Neovim command 'nvim' NOT found, will falback to use 'vim' as EDITOR."
#     export EDITOR=vim
# fi
export EDITOR=vim

# For tilix
# We may need to link /etc/profile.d/vte-2.91.sh to /etc/profile.d/vte.sh beforehand
# sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
#VTE_SCRIPT="/etc/profile.d/vte.sh"
#if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#    if [[ -s $VTE_SCRIPT ]]; then
#        source $VTE_SCRIPT
#    else
#        echo "It looks like you don't have ${VTE_SCRIPT} (for tilix terminal), consider creating a symlink for it."
#    fi
#fi

[[ -s $PRIVATE_SCRIPT_UTIL_SHARE/custom_shrc_common.sh ]] && . $PRIVATE_SCRIPT_UTIL_SHARE/custom_shrc_common.sh
