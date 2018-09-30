#!/usr/bin/env bash

# Install ntfs-3g in case we need to mount NTFS drives
brew install homebrew/fuse/ntfs-3g
# Append /usr/local/sbin following /usr/local/bin in $PATH,
# so that we don't have to replace the original mount_ntfs like below:
#mv /sbin/mount_ntfs /sbin/mount_ntfs.original
#ln -s /usr/local/sbin/mount_ntfs /sbin/mount_ntfs
# Use 'mount' command to see current mounted devices and mount points.
# To mount/remount a NTFS device:
#mount_ntfs -o force,rw /dev/diskXY /Volumes/mntpoint
