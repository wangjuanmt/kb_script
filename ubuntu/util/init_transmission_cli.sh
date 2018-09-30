#!/usr/bin/env bash

. $SCRIPT_UTIL_ROOT/install_transmission_cli.sh

. $HOME/bedroom/kb/script/ubuntu/util/env_vars.sh

. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

# Cancel daemon auto start
if [[ $UBUNTU_CODE_NAME = "trusty" ]]; then
    CONFIG=/etc/default/transmission-daemon
    old="^.*ENABLE_DAEMON.*"
    printf -v new "ENABLE_DAEMON=0"
    grep -q '^.*ENABLE_DAEMON' $CONFIG && sudo sed -i "s~$old~$new~" $CONFIG || sudo echo -e "$new\n$(cat $CONFIG)" > $CONFIG
else
    # From 16.04 on, ubuntu started to use systemd.
    # To see current status of transmission-daemon service:
    # systemctl list-unit-files | grep transmission
    # To stop and disable its auto startup
    systemctl stop transmission-daemon
    systemctl disable transmission-daemon
fi

#. $SCRIPT_UTIL_ROOT/install_update_transmission_remote_cli.sh
