#!/usr/bin/env bash

# System tools
#brew cak install caffeine
# Use pmset instead
# http://forums.macrumors.com/threads/fyi-2013-macbook-air-drops-separate-display-system-sleep-timers.1595455/
# To see all settings
#pmset -g custom
# To set the display to turn off after 30 minutes while preventing the system from sleeping when using AC power
#sudo pmset -c sleep 0
#sudo pmset -c displaysleep 30
# To set the display to turn off after 5 minutes and the system goes to sleep as well when using battery power
#sudo pmset -b sleep 5
#sudo pmset -b displaysleep 5
#-b, -c, -u, -a correspond to battery ( -b ), charger (wall power) ( -c ), UPS ( -u ) or all ( -a )
# To put display to sleep now
#pmset displaysleepnow
