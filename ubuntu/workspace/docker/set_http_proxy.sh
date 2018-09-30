#!/usr/bin/env bash

# https://docs.docker.com/engine/admin/systemd/
CONF_LINK_TARGET_DIR=/etc/systemd/system/docker.service.d
sudo mkdir -p $CONF_LINK_TARGET_DIR

# Http proxy
# http://stackoverflow.com/a/28093517/1239295
# Linking doesn't work
#sudo ln -s $WORKSPACE_SCRIPT_ROOT/docker/conf/http-proxy.conf $CONF_LINK_TARGET_DIR/http-proxy.conf
sudo cp -f $WORKSPACE_SCRIPT_ROOT/docker/conf/http-proxy.conf $CONF_LINK_TARGET_DIR/

# Flush changes
sudo systemctl daemon-reload

# Verify that the configurations have been loaded
systemctl show --property Environment docker

# Restart Docker
sudo systemctl restart docker
