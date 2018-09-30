#!/usr/bin/env bash

# Remove Chrome updater, and prevent it from auto recreation.
# Because executing
# "/path/to/Google\ Chrome.app/Contents/Versions/<version>/Google\ Chrome\ Framework.framework/Frameworks/KeystoneRegistration.framework/Resources/ksinstall --nuke"
# seems not working!
rm -rf $HOME/Library/Google/GoogleSoftwareUpdate
touch $HOME/Library/Google/GoogleSoftwareUpdate
