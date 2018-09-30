#!/usr/bin/env bash

sudo apt-get install -y ruby ruby-dev

# Change to mainland rubygem RubyChina mirror
#gem source -r https://rubygems.org/
#gem source -a https://gems.ruby-china.com/
#gem source -a https://rubygems.org/
#gem source --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/

#sudo gem install pry
#sudo gem2.3 install pry

# To install gems in home dir, use --user-install,
# then add "$(ruby -rubygems -e 'puts Gem.user_dir')/bin" to $PATH,
# which is usually "$HOME/.gem/ruby/1.9.1/bin" for ruby1.9.x,
# and "$HOME/.gem/ruby/2.0.0" for ruby2.x.
