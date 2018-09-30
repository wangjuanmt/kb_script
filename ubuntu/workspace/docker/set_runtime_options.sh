#!/usr/bin/env bash

# https://docs.docker.com/engine/admin/systemd/
CONF_LINK_TARGET_DIR=/etc/systemd/system/docker.service.d
sudo mkdir -p $CONF_LINK_TARGET_DIR

# Docker runtime options, including:
# Docker runtime root
## https://stackoverflow.com/a/34731550/1239295
# Docker registry mirror
## https://docs.docker.com/registry/recipes/mirror/#configuring-the-docker-daemon
## https://mirrors.ustc.edu.cn/help/dockerhub.html
sudo cp -f $WORKSPACE_SCRIPT_ROOT/docker/conf/docker-runtime-options.conf $CONF_LINK_TARGET_DIR/
# Linking doesn't work
#sudo ln -s $WORKSPACE_SCRIPT_ROOT/docker/conf/docker-runtime-options.conf $CONF_LINK_TARGET_DIR/docker-runtime-options.conf

# Flush changes
sudo systemctl daemon-reload

# Verify that the configurations have been loaded
#systemctl show --property ExecStart docker

# Restart Docker
sudo systemctl restart docker
