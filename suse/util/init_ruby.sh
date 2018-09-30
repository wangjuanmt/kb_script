#!/usr/bin/env bash

sudo zypper -n install ruby2.1 ruby2.1-devel ruby ruby-devel

# Change to mainland rubygem taobao mirror
gem source -r https://rubygems.org/
gem source -a https://ruby.taobao.org/
#gem source -a https://rubygems.org/

sudo gem install pry
sudo gem2.1 install pry

# To install gems in home dir, use --user-install,
# then add "$(ruby -rubygems -e 'puts Gem.user_dir')/bin" to $PATH,
# which is usually "$HOME/.gem/ruby/1.9.1/bin" for ruby1.9.x,
# and "$HOME/.gem/ruby/2.0.0" for ruby2.x.
