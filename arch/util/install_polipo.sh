#!/usr/bin/env bash

# Convert Shadowsocks into an HTTP proxy (127.0.0.1:8123)

sudo pacman -S --noconfirm --needed polipo

# Run polipo as non-root user
# Create new config file from sample config (not required if not formatting home dir)
#cp /etc/polipo/config.sample $USER_HOME/.poliporc

# Create cache dir (not required if not formatting home dir)
#mkdir $USER_HOME/.polipo-cache

# Change cache folder to a writable location (not required if not formatting home dir)
#printf "\ndiskCacheRoot=\"~/.polipo-cache/\"" | tee -a $USER_HOME/.poliporc

# Set socksParentProxy (not required if not formatting home dir)
#printf "\nsocksParentProxy=127.0.0.1:1080" | tee -a $USER_HOME/.poliporc
#printf "\nsocksProxyType=socks5" | tee -a $USER_HOME/.poliporc

# Then we can start polipo as non-root user like:
#polipo -c ~/.poliporc
