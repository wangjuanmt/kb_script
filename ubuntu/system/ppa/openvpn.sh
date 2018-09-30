#!/usr/bin/env bash

# To set proxy for apt, edit `/etc/apt/apt.conf`, add:
#Acquire::http::Proxy "http://127.0.0.1:8123";

. $HOME/bedroom/kb/script/ubuntu/util/env_vars.sh

. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

# https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg | sudo apt-key add -
echo "deb https://build.openvpn.net/debian/openvpn/stable ${UBUNTU_CODE_NAME} main" | sudo tee /etc/apt/sources.list.d/openvpn-aptrepo.list
