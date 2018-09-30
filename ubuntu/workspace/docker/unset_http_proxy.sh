#!/usr/bin/env bash

CONF_LINK_TARGET_DIR=/etc/systemd/system/docker.service.d

sudo rm -f $CONF_LINK_TARGET_DIR/http_proxy.conf

# Flush changes
sudo systemctl daemon-reload

# Verify that the configurations have been loaded
systemctl show --property Environment docker

# Restart Docker
sudo systemctl restart docker
