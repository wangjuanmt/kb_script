#!/usr/bin/env bash

. $HOME/bedroom/kb/script/ubuntu/util/env_vars.sh

. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

# Convert Shadowsocks into an HTTP proxy (127.0.0.1:8118)
sudo apt-get install -y privoxy

# Set or append forward-socks5 depending on whether it exists in /etc/privoxy/config
#grep -q '^forward-socks5' /etc/privoxy/config && sudo sed -i 's/^forward-socks5.*/forward-socks5 \/ 127\.0\.0\.1:1080 \./' /etc/privoxy/config || printf "\nforward-socks5 / 127.0.0.1:1080 ." | sudo tee -a /etc/privoxy/config

# Disable auto startup
if [[ $UBUNTU_CODE_NAME = "trusty" ]]; then
    sudo service privoxy stop
    echo manual | sudo tee /etc/init/privoxy.override
else
    sudo systemctl stop privoxy
    sudo systemctl disable privoxy
fi
