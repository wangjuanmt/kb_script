#!/usr/bin/env bash

# https://brew.sh/

AUTO_INSTALL=$1
USE_MIRROR=$2

if [[ $AUTO_INSTALL = "true" ]]; then
    # Install Homebrew via auto installation script
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    HOMEBREW_PREFIX="/usr/local"
    HOMEBREW_EXEC=$HOMEBREW_PREFIX/bin/brew
    HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew"
    CORE_REPO_PREFIX="${HOMEBREW_REPOSITORY}/Library/Taps/homebrew/homebrew-core"
    CASK_REPO_PREFIX="${HOMEBREW_REPOSITORY}/Library/Taps/caskroom/homebrew-cask"

    BREW_REPO="https://github.com/Homebrew/brew.git"
    #BREW_REPO_MIRROR="https://mirrors.ustc.edu.cn/brew.git"
    BREW_REPO_MIRROR="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"

    CORE_REPO="https://github.com/Homebrew/homebrew-core.git"
    #CORE_REPO_MIRROR="https://mirrors.ustc.edu.cn/homebrew-core.git"
    CORE_REPO_MIRROR="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

    CASK_REPO="https://github.com/caskroom/homebrew-cask.git"
    CASK_REPO_MIRROR="https://mirrors.ustc.edu.cn/homebrew-cask.git"

    # Manual installation
    # http://docs.brew.sh/Installation.html
    if [[ $USE_MIRROR == "true" ]]; then
        git clone $BREW_REPO_MIRROR $HOMEBREW_REPOSITORY
    else
        git clone $BREW_REPO $HOMEBREW_REPOSITORY
    fi

    # Link brew executable manually
    CURRENT_DIR=$(pwd)
    cd $HOMEBREW_PREFIX/bin
    ln -s ../Homebrew/bin/brew brew

    . $SYSTEM_SCRIPT_ROOT/set_homebrew_folder_permission.sh

    # homebrew taps
    if [[ $USE_MIRROR == "true" ]]; then
        # Tap with a git cloning of a mirror to speed up
        git clone $CORE_REPO_MIRROR $CORE_REPO_PREFIX
    else
        $HOMEBREW_EXEC tap homebrew/core
    fi

    # homebrew-cask taps
    if [[ $USE_MIRROR == "true" ]]; then
        git clone $CASK_REPO_MIRROR $CASK_REPO_PREFIX
    else
        $HOMEBREW_EXEC tap caskroom/cask
    fi
fi

# Official taps
#$HOMEBREW_EXEC tap homebrew/versions
#$HOMEBREW_EXEC tap caskroom/versions

# Personal taps
$HOMEBREW_EXEC tap athrunsun/genericbinary
$HOMEBREW_EXEC tap athrunsun/osxbinary
$HOMEBREW_EXEC tap athrunsun/athruncask

$HOMEBREW_EXEC update
