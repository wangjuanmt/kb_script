#!/usr/bin/env bash

sdk install java 8u141-oracle

# Have to uninstall jdk manually, because sdkman uses pkg file to install jdk first,
# then copy jdk home to candidates folder, but sdkman didn't properly uninstall 
# installed jdk afterward.
. $WORKSPACE_SCRIPT_ROOT/jdk/uninstall_jdk.sh 8 141
