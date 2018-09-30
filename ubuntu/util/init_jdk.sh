#!/usr/bin/env bash

#. $SYSTEM_SCRIPT_ROOT/ppa/oracle_jdk
#sudo apt-get update

mkdir -p $JVM_DIR

# Download using curl and install (deprecated)
#. $SCRIPT_UTIL_ROOT/install_jdk8.sh
#. $SCRIPT_UTIL_ROOT/install_jdk7.sh

# Install from PPA (deprecated)
#sudo apt-get install -y oracle-java8-installer
#sudo apt-get install -y oracle-java7-installer

# Install JDK9 from linuxbrew
#brew install jdk
# Unlink otherwise we can't even install other versions,
# it's also better to set JAVA_HOME and other related environment variables without linuxbrew.
#brew unlink jdk

# Install JDK8 from linuxbrew
brew install jdk@8
brew unlink jdk@8

# Install JDK7 from linuxbrew
#brew install jdk7@7
#brew unlink jdk7@7

# JAVA_HOME is set to $JVM_DIR/jdk
# So that we can point to any version of JDK
cd $JVM_DIR
#ln -s $(brew --prefix jdk) jdk9
ln -s $(brew --prefix jdk@8) jdk8
#ln -s $(brew --prefix jdk@77) jdk7
ln -s jdk8 jdk
