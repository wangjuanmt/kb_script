#!/usr/bin/env bash

# Want to install rvm/ruby with proxy?
# Set http_proxy & https_proxy

RVM_HOME=$HOME/.rvm

# If user name (bsun or bruce.sun or whatever) is changed,
# we can run "rvm remove <version>" to remove rubies first,
# then "rvm get stable" to upgrade rvm to latest,
# "rvm list known" to get a list of rubies that can be installed,
# at last "rvm install <version>" to install a brand new ruby.

# Install mpapis public key (might need gpg2)
#gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# Or if it fails
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

# "--ruby": install RVM with ruby
# "--ignore-dotfiles": Instruct rvm install script to not change the shell initializations files 'rc' / 'profile'
# "stable": install stable version of RVM
# "get.rvm.io" is a redirect to "https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer"
#\curl -sSL https://get.rvm.io | bash -s -- --ruby --ignore-dotfiles stable
\curl -sSL https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer | bash -s -- --ignore-dotfiles stable

# Use taobao ruby mirror for faster ruby installation
sed -i -E 's!https?://cache.ruby-lang.org/pub/ruby!https://ruby.taobao.org/mirrors/ruby!' $RVM_HOME/config/db
# And here is USTC ruby mirror
#https://mirrors.ustc.edu.cn/ruby/

# Load rvm script
. "$HOME/.rvm/scripts/rvm"

# Install latest stable version (till 2016-10) of Ruby
rvm install ruby-2.3 --default

# To switch gemset
#rvm gemset use teddy
# To see the name of the current gemset
#rvm gemset name
# To list the full directory path for the current gemset
#rvm gemdir
# To list all named gemsets for the current ruby interpreter
#rvm gemset list
# To list all named gemsets for all interpreters
#rvm gemset list_all
