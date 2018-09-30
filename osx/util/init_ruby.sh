#!/usr/bin/env bash

# Install using homebrew
#brew fetch --retry --force-bottle --deps ruby
brew install ruby

# Change to mainland rubygem taobao mirror
# Remove official source at first, then add it back after
# adding RubyChina source, to ensure RubyChina source is at top. (Though optional)
#gem source -r https://rubygems.org/
#gem source -a https://gems.ruby-china.com/
#gem source -a https://rubygems.org/
#gem source --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/

#gem install pry
#gem2.0 install pry
