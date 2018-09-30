#!/usr/bin/env bash

export DISTRO_ID="$(echo $(lsb_release -is) | tr '[:upper:]' '[:lower:]')"
export DISTRO_CODE_NAME="$(echo $(lsb_release -cs) | tr '[:upper:]' '[:lower:]')"
export DISTRO_RELEASE_VERSION="$(echo $(lsb_release -rs) | tr '[:upper:]' '[:lower:]')"

function ubuntu_code_name() {
    if [[ "$DISTRO_ID" =~ ^linuxmint.* ]]; then
        if [[ "$DISTRO_RELEASE_VERSION" =~ ^19.* ]]; then
            export DISTRO_UBUNTU_VERSION="18.04"
            export UBUNTU_CODE_NAME="bionic"
        elif [[ "$DISTRO_RELEASE_VERSION" =~ ^18.* ]]; then
            export DISTRO_UBUNTU_VERSION="16.04"
            export UBUNTU_CODE_NAME="xenial"
        elif [[ "$DISTRO_RELEASE_VERSION" =~ ^17.* ]]; then
            export DISTRO_UBUNTU_VERSION="14.04"
            export UBUNTU_CODE_NAME="trusty"
        else
            echo "Unsupported ubuntu distro!"
            # CAUTION: exit here will cause terminal failed to start! 
            #exit 1
        fi
    elif [[ "$DISTRO_ID" =~ ^ubuntu.* ]]; then
        export DISTRO_UBUNTU_VERSION=$DISTRO_RELEASE_VERSION
        export UBUNTU_CODE_NAME=$DISTRO_CODE_NAME
    else
        echo "Unsupported ubuntu distro!"
        # CAUTION: exit here will cause terminal failed to start!
        #exit 1
    fi
}

ubuntu_code_name
