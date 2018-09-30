#!/usr/bin/env bash

. $HOME/bedroom/kb/script/ubuntu/util/env_vars.sh

. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

# Convert Shadowsocks into an HTTP proxy (127.0.0.1:8123)
sudo apt-get install -y polipo

# Update system wide polipo config (deprecated, use "launch_polipo" script instead)
#sudo service polipo stop
# Set or append socksParentProxy depending on whether it exists in /etc/polipo/config
#grep -q '^socksParentProxy' /etc/polipo/config && sudo sed -i 's/^socksParentProxy.*/socksParentProxy=127\.0\.0\.1:1080/' /etc/polipo/config || printf "\nsocksParentProxy=127.0.0.1:1080" | sudo tee -a /etc/polipo/config
#sudo service polipo start

# Disable auto startup
if [[ $UBUNTU_CODE_NAME = "trusty" ]]; then
    sudo service polipo stop
    # Disable upstart service from auto startup
    # http://askubuntu.com/questions/19320/how-to-enable-or-disable-services
    echo manual | sudo tee /etc/init/polipo.override
else
    sudo systemctl stop polipo
    sudo systemctl disable polipo
fi
