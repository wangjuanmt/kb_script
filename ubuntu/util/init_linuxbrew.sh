#!/usr/bin/env bash

# http://linuxbrew.sh/
# NOTE: folder $LINUXBREW_HOME is created with "create_linuxbrew_home_prefix_dir.sh" specifically, which need sudo.

AUTO_INSTALL=$1

# My Linuxbrew is ignoring existing bottles and attempting source builds: https://github.com/Linuxbrew/brew/issues/452
# The precompiled binary bottles of non-relocatable bottles can only be used if you install in /home/linuxbrew/.linuxbrew,
# otherwise they have to be built from source.
#LINUXBREW_HOME=$HOME/.linuxbrew
LINUXBREW_HOME=/home/linuxbrew/.linuxbrew
LINUXBREW_EXEC=$LINUXBREW_HOME/bin/brew

if [[ $AUTO_INSTALL = "true" ]]; then
    # Install Linuxbrew via auto installation script
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
else
    if [[ -d "$LINUXBREW_HOME" ]]; then
        echo "'$LINUXBREW_HOME' already exists, skip installation."
        exit 1
    else
        CORE_REPO_PREFIX="${LINUXBREW_HOME}/Library/Taps/homebrew/homebrew-core"
        git clone https://github.com/Linuxbrew/brew.git $LINUXBREW_HOME
        git clone https://github.com/Linuxbrew/homebrew-core.git $CORE_REPO_PREFIX
    fi
fi

# Personal taps
$LINUXBREW_EXEC tap athrunsun/genericbinary
$LINUXBREW_EXEC tap athrunsun/linuxbinary
$LINUXBREW_EXEC tap athrunsun/appimage

$LINUXBREW_EXEC update
