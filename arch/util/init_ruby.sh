#!/usr/bin/env bash

sudo pacman -S --noconfirm --needed ruby

sudo pacman -S --noconfirm --needed ruby1.9

# Change to mainland rubygem taobao mirror
gem source -r https://rubygems.org/
gem source -a https://ruby.taobao.org/
#gem source -a https://rubygems.org/

sudo gem install pry
sudo gem2.0 install pry
