#!/usr/bin/env bash

# Support to mount HFS/HFS+ devices (read-write)
sudo apt-get install hfsprogs
# Use 'mount' command to see current mounted devices and mount points.
# To mount/remount a HFS/HFS+ device:
#mount -t hfsplus -o [remount,]force,rw /dev/sdXY /media/mntpoint
# And you may have to change mount point's permissions to actually write to it.
