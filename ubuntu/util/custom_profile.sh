#!/usr/bin/env bash

. $SCRIPT_UTIL_SHARE/custom_profile_common.sh

export JAVA_HOME=$JVM_DIR/jdk
#export JAVA_HOME_7=$JVM_DIR/jdk7
#export JAVA_HOME_8=$JVM_DIR/jdk8
#export JAVA_HOME_7=/usr/lib/jvm/java-7-oracle
#export JAVA_HOME_8=/usr/lib/jvm/java-8-oracle

#export LINUXBREW_HOME=$HOME/.linuxbrew
export LINUXBREW_HOME=/home/linuxbrew/.linuxbrew
export MANPATH=$LINUXBREW_HOME/share/man:$MANPATH
export INFOPATH=$LINUXBREW_HOME/share/info:$INFOPATH

# python
#USER_PIP_HOME=$HOME/.local

# yarn global bin
#YARN_USER_HOME=$HOME/.yarn

# WATCH the order! Put a variable in the END (NOT FRONT) if you want it to appear in front of $PATH!
export PATH=$SYSTEM_SCRIPT_ROOT:$PATH
export PATH=$APP_SCRIPT_ROOT:$PATH
export PATH=$APP_SCRIPT_SHARE:$PATH
export PATH=$WORKSPACE_SCRIPT_ROOT:$PATH
export PATH=$WORKSPACE_SCRIPT_SHARE:$PATH
export PATH=$PRIVATE_SYSTEM_SCRIPT_ROOT:$PATH
export PATH=$PRIVATE_APP_SCRIPT_ROOT:$PATH
export PATH=$PRIVATE_APP_SCRIPT_SHARE:$PATH
export PATH=$PRIVATE_WORKSPACE_SCRIPT_ROOT:$PATH
export PATH=$PRIVATE_WORKSPACE_SCRIPT_SHARE:$PATH

export PATH=$FPP_HOME:$PATH

export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export PATH=$LINUXBREW_HOME/sbin:$PATH
export PATH=$LINUXBREW_HOME/bin:$PATH

export PATH=$USER_LOCAL_BIN:$PATH

#export PATH=$GOENV_ROOT/shims:$PATH
#export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$GVM_ROOT/bin:$PATH

# We need this in the path otherwise some UI applications like vscode have no idea where "node" or "npm" is.
# To avoid this problem in UI applications, set node and npm paths manually. (vscode has some related configuration)
#export PATH=$NODENV_ROOT/shims:$PATH

export PATH=$NODENV_ROOT/bin:$PATH

# Installing packages globally with yarn is considered harmful when using together with nodenv
#export PATH=$YARN_USER_HOME/bin:$PATH

#export PATH=$RBENV_HOME/shims:$PATH
export PATH=$RBENV_HOME/bin:$PATH

# CAUTION! Adding pyenv shims path to PATH will override system python, which will cause system scripts/apps
# which rely on system python not loading properly. Same applies to rbenv/nodenv/...
#export PATH=$PYENV_ROOT/shims:$PATH
export PATH=$PYENV_ROOT/bin:$PATH
#export PATH=$USER_PIP_HOME/bin:$PATH

#export PATH=$MINICONDA2_HOME/bin:$PATH
#export PATH=$MINICONDA3_HOME/bin:$PATH

#export PATH=$JENV_ROOT/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH

#export PATH=$SDKMAN_HOME/bin:$PATH
