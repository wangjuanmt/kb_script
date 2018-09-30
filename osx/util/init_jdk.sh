#!/usr/bin/env bash

mkdir -p $JVM_DIR

# JDK8
#brew cask install java
. $WORKSPACE_SCRIPT_ROOT/jdk/install_latest_jdk8.sh

# JDK7 (deprecated)
#brew cask install java7

# AppleJDK6
#brew cask install java6

# Link jdk installations to shorter paths
# (Mainly used in IDEs)
#ln -s $(/usr/libexec/java_home -v 1.7) $JVM_DIR/jdk7
#ln -s $(/usr/libexec/java_home -v 1.8) $JVM_DIR/jdk8

# JAVA_HOME is set to $JVM_DIR/jdk
# So that we can point to any version of JDK
cd $JVM_DIR
ln -s jdk8 jdk
