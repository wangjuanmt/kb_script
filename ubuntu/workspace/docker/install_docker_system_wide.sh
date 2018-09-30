#!/usr/bin/env bash

# https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository
# https://mirrors.ustc.edu.cn/help/dockerhub.html
# https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/

INSTALL_FROM_LEGACY_REPO=$1

if [[ $INSTALL_FROM_LEGACY_REPO == "" ]] || [[ $INSTALL_FROM_LEGACY_REPO == "help" ]]; then
    echo "Usage: install_docker_system_wide.sh [install_from_legacy_repo? ('true' or 'false')]"
    exit 0
fi

. $HOME/bedroom/kb/script/ubuntu/util/env_vars.sh
. $SCRIPT_UTIL_ROOT/ubuntu_code_name.sh

. $WORKSPACE_SCRIPT_ROOT/docker/install_docker_dependencies.sh

# This is also where docker stores all downloaded images
DOCKER_RUNTIME_HOME=$USER_LOCAL/docker

if [[ $INSTALL_FROM_LEGACY_REPO == "true" ]]; then
    # Add gpg key
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

    # Rename any existing source
    [ -f "/etc/apt/sources.list.d/docker.list" ] && sudo mv /etc/apt/sources.list.d/docker.list /etc/apt/sources.list.d/docker.list.backup_$(date +%F-%T)

    # Create docker source
    sudo touch /etc/apt/sources.list.d/docker.list
    
    # Official source
    #echo "deb https://apt.dockerproject.org/repo ubuntu-${UBUNTU_CODE_NAME} main" | sudo tee /etc/apt/sources.list.d/docker.list
    
    # TUNA mirror (removed)
    #echo "deb https://mirrors.tuna.tsinghua.edu.cn/docker/apt/repo ubuntu-${UBUNTU_CODE_NAME} main" | sudo tee /etc/apt/sources.list.d/docker.list
    
    # USTC mirror
    echo "deb https://mirrors.ustc.edu.cn/docker-apt/repo ubuntu-${UBUNTU_CODE_NAME} main" | sudo tee /etc/apt/sources.list.d/docker.list
    
    # Aliyun mirror
    #echo "deb http://mirrors.aliyun.com/docker-engine/apt/repo ubuntu-${UBUNTU_CODE_NAME} main" | sudo tee /etc/apt/sources.list.d/docker.list

    sudo apt-get update

    # Purge the old versions if exist
    sudo apt-get purge -y lxc-docker docker docker-engine

    # Verify that apt is pulling from the right repository
    apt-cache policy docker-engine

    # Install the linux-image-extra kernel package
    # to allow you to use the aufs storage driver.
    # Usually mint comes with this package already installed,
    # if it's not, install it and reboot the system.
    sudo apt-get install -y linux-image-generic linux-image-extra-$(uname -r) linux-image-extra-virtual

    # Install docker
    sudo apt-get install -y docker-engine
else
    # Add gpg key
    #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    #curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
    #curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
    curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

    # Official source
    #sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${UBUNTU_CODE_NAME} stable"

    # USTC mirror
    #sudo add-apt-repository -y "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/ ${UBUNTU_CODE_NAME} stable"

    # TUNA mirror
    #sudo add-apt-repository -y "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/ ${UBUNTU_CODE_NAME} stable"

    # Aliyun mirror
    sudo add-apt-repository -y "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu ${UBUNTU_CODE_NAME} stable"
    
    sudo apt-get update

    # Purge the old versions if exist
    sudo apt-get purge -y lxc-docker docker docker-engine

    # Unless you have a strong reason not to, install the linux-image-extra-* packages, which allow Docker to use the aufs storage drivers.
    sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

    # Install docker-ce
    sudo apt-get install -y docker-ce
fi

# Stop the docker daemon to change default config
#sudo service docker stop
#sudo systemctl stop docker

# To change default docker runtime root (/var/lib/docker),
# add/modify the line below in /etc/default/docker:
# DOCKER_OPTS="-g $DOCKER_RUNTIME_HOME"
# NOTE this no longer works from ubuntu 16.04 and onward!
#printf "\nDOCKER_OPTS=\"-g $DOCKER_RUNTIME_HOME\"" | sudo tee -a /etc/default/docker

# Custom Docker daemon options (doesn't seem to work)
#sudo cp -f $WORKSPACE_SCRIPT_ROOT/docker/conf/daemon.json /etc/docker/daemon.json

. $WORKSPACE_SCRIPT_ROOT/docker/set_runtime_options.sh

# Optional (to unset, use $WORKSPACE_SCRIPT_ROOT/docker/unset_http_proxy.sh)
#. $WORKSPACE_SCRIPT_ROOT/docker/set_http_proxy.sh

# Start the docker daemon
#sudo service docker start
#sudo systemctl start docker

# Verify docker is installed correctly
#sudo docker run hello-world

# Create the docker group and add your user
# so that we don't have to preface each docker command with sudo
sudo groupadd docker
sudo usermod -aG docker $TARGET_USER
# Then logout and log back in, run 'docker run hello-world' to see if it works.

# Install docker-compose
#. $SCRIPT_UTIL_ROOT/install_docker_compose_binary_from_linuxbrew.sh
#. $SCRIPT_UTIL_ROOT/install_docker_compose_binary_system_wide.sh

# To set DNS for docker to use, edit /etc/default/docker
# and add settings: DOCKER_OPTS="--dns 8.8.8.8"
# You can also specify multiple DNS servers. Separated them with spaces, for example:
# --dns 8.8.8.8 --dns 192.168.1.1
# Then restart docker

# To cleanup dangling images
#docker rmi $(docker images -f "dangling=true" -q)

# To cleanup dangling volumes
#docker volume rm $(docker volume ls -f dangling=true -q)
