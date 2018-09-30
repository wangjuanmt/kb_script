#!/usr/bin/env bash

# This is to configure different DNS resolvers for specific domains in Ubuntu
# http://www.vojcik.net/configure-different-dns-resolvers-for-domains-in-ubuntu/

. $HOME/bedroom/kb/script/ubuntu/util/env_vars.sh

CONFIG_FILE_NAME=$1
IS_PRIVATE=$2

CONFIG_FILE_TARGET_FOLDER=/etc/NetworkManager/dnsmasq.d

if [[ "$IS_PRIVATE" = "true" ]]; then
    CONFIG_FILE_SOURCE_FOLDER=$PRIVATE_SYSTEM_SCRIPT_ROOT/dnsmasq
else
    CONFIG_FILE_SOURCE_FOLDER=$SYSTEM_SCRIPT_ROOT/dnsmasq
fi

sudo ln -s $CONFIG_FILE_SOURCE_FOLDER/$CONFIG_FILE_NAME $CONFIG_FILE_TARGET_FOLDER/$CONFIG_FILE_NAME

echo "The NetworkManager service will restart to make custom dnsmasq config effective..."

# Restart network-manager to make the changes affective
# Legacy "service" command
#sudo service network-manager restart
# From 16.04 on, we can also use systemd command "systemctl"
# Looks like the only way to refresh dnsmasq (which is used by NetworkManager) cache is to restart NetworkManager service.
sudo systemctl restart NetworkManager

# Flush dnsmasq dns cache (doesn't work since 16.04)
#sudo /etc/init.d/dnsmasq restart

# Wait till NetworkManager restarting completed, b/c following actions may need network connections.
echo "Is NetworkManager restarting completed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) continue;;
    esac
done
