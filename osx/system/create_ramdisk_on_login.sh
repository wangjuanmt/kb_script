#!/usr/bin/env bash

# Create ramdisk upon user login via launchd

TARGET_PLIST_FILE_PATH=$HOME/Library/LaunchAgents/org.okampfer.ramdisk.plist

if [[ -f $TARGET_PLIST_FILE_PATH ]]; then
    launchctl unload -w $TARGET_PLIST_FILE_PATH
    rm -f $TARGET_PLIST_FILE_PATH
fi

cp -f $SYSTEM_SCRIPT_ROOT/org.okampfer.ramdisk.plist.template $TARGET_PLIST_FILE_PATH

# Replace "[USER_HOME]" with current user home dir
old="\[USER_HOME\]"
printf -v new "$HOME"
sed -i "" "s~$old~$new~" $TARGET_PLIST_FILE_PATH

# Then load it
launchctl load -w $TARGET_PLIST_FILE_PATH

# To unload it
#launchctl unload -w $TARGET_PLIST_FILE_PATH
#rm -f $TARGET_PLIST_FILE_PATH

# NOTE: launchd won't accept link!
# To enable debugging, see https://developer.apple.com/library/mac/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html,
# also reference http://launchd.info.

# Another way to do this is to create ramdisk upon user login via LoginHook (deprecated)
# Not recommended b/c it's impossible to have more than one login hooks
# Ref: http://superuser.com/questions/377384/more-than-one-loginhooks
#defaults write com.apple.loginwindow LoginHook $APP_SCRIPT_ROOT/create_ramdisk_for_chrome
# To remove LoginHook
#sudo defaults delete com.apple.loginwindow LoginHook
