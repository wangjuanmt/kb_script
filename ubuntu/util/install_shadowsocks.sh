#!/usr/bin/env bash

# (Deprecated)

# https://github.com/shadowsocks/shadowsocks
# https://pypi.python.org/pypi/shadowsocks/
pip install --upgrade shadowsocks

# Link launch_sslocal to /usr/bin,
# so that system will treat it as a command.
ln -s $APP_SCRIPT_ROOT/launch_sslocal /usr/bin/launch_sslocal

# Make shadowsocks auto startup
sed -i "/^exit 0$/i sudo launch_sslocal start lightss_seatle" /etc/rc.local
