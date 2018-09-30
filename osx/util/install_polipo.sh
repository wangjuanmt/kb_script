#!/usr/bin/env bash

#brew fetch --retry --force-bottle --deps polipo
brew install polipo

# Need to tune plist file a little bit,
# update ProgramArguments section like the following:
#<key>ProgramArguments</key>
#<array>
#    <string>/usr/local/opt/polipo/bin/polipo</string>
#    <string>-c</string>
#    <string>/path/to/your/polipo.conf</string>
#</array>

# To have launchd start polipo at login
#ln -sfv /usr/local/opt/polipo/*.plist $HOME/Library/LaunchAgents

# Then to load polipo now
#launchctl load $HOME/Library/LaunchAgents/homebrew.mxcl.polipo.plist