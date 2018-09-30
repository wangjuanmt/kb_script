#!/usr/bin/env bash

# Check if user is root
[ $(id -u) != "0" ] && echo "Error: You must be root to run this script" && exit 1

. $SCRIPT_UTIL_ROOT/env_vars.sh

mkdir -p /usr/lib/jvm
cp -rvf $WORKSPACE_ROOT/setup/java_category/jdk/jdk7 /usr/lib/jvm/

# "1" means priority
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk7/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk7/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk7/bin/javaws" 1

# Choose the correct java, javac, javaws manually
update-alternatives --config java
update-alternatives --config javac
update-alternatives --config javaws