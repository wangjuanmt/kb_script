#!/usr/bin/env bash

# http://sdkman.io
# https://github.com/sdkman

# Call auto install script
curl -s "https://get.sdkman.io" | bash

# Manual installation (actually a gradle build, and much slower!)
# https://github.com/sdkman/sdkman-cli#local-installation
#SOURCE_TMP_DIR=$USER_DOWNLOADS/sdkman_source
#[[ -d $SOURCE_TMP_DIR ]] && rm -rf $SOURCE_TMP_DIR
#git clone https://github.com/sdkman/sdkman-cli $SOURCE_TMP_DIR
#cd $SOURCE_TMP_DIR
#./gradlew -Penv=production install
#rm -rf $SOURCE_TMP_DIR
