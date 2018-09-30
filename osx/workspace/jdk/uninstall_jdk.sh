#!/usr/bin/env bash

# References: 'uninstall' and 'zap' sections in the following formulas
# https://github.com/caskroom/homebrew-cask/blob/master/Casks/java.rb
# https://github.com/caskroom/homebrew-versions/blob/master/Casks/java8.rb

# Official documentation
# https://www.java.com/en/download/help/mac_uninstall_java.xml
# http://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html

echo "Usage: uninstall_jdk.sh [JDK major version] [JDK update version]"
echo "Parameters:"
echo "[JDK major version]: 7 or 8, single digit."
echo "[JDK update version]: minor version, also digits."

JDK_MAJOR_VERSION=$1
JDK_UPDATE_VERSION=$2

PKG_UTIL_PACKAGE_NAME="com.oracle.jdk${JDK_MAJOR_VERSION}u${JDK_UPDATE_VERSION}"

sudo pkgutil --forget $PKG_UTIL_PACKAGE_NAME
sudo pkgutil --forget com.oracle.jre

sudo launchctl remove "com.oracle.java.Helper-Tool"
sudo launchctl remove "com.oracle.java.Java-Updater"

sudo rm -rf "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"
sudo rm -rf "/Library/Java/JavaVirtualMachines/jdk-1.${JDK_MAJOR_VERSION}.0_${JDK_UPDATE_VERSION}.jdk"
sudo rm -rf "/Library/PreferencePanes/JavaControlPanel.prefPane"
sudo rm -rf "/Library/Java/Home"
sudo rm -rf "~/Library/Caches/com.oracle.java.Java-Updater"
sudo rm -rf "~/Library/Caches/Oracle.MacJREInstaller"
sudo rm -rf "~/Library/Caches/net.java.openjdk.cmd"
sudo rm -rf "/Library/Application Support/Oracle/Java"
sudo rm -rf "/Library/Preferences/com.oracle.java.Deployment.plist"
sudo rm -rf "/Library/Preferences/com.oracle.java.Helper-Tool.plist"
sudo rm -rf "~/Library/Application Support/Java/"
sudo rm -rf "~/Library/Application Support/Oracle/Java"
sudo rm -rf "~/Library/Preferences/com.oracle.java.Java-Updater.plist"
sudo rm -rf "~/Library/Preferences/com.oracle.java.JavaAppletPlugin.plist"
sudo rm -rf "~/Library/Preferences/com.oracle.javadeployment.plist"
sudo rm -rf "~/Library/Application Support/Oracle/"
