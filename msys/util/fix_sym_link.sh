#!/usr/bin/env bash

# http://jcf94.com/2016/04/25/2016-04-25-msys2/
# https://superuser.com/questions/550732/use-mklink-in-msys
printf "export MSYS=\"winsymlinks:lnk\"" | tee -a /etc/profile
