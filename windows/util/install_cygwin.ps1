# DO NOT use proxy when installing cygwin!
# https://mirrors.tuna.tsinghua.edu.cn/help/cygwin/
choco.exe install -y cygwin --params="'/Site:http://mirrors.tuna.tsinghua.edu.cn/cygwin/'" --ignore-checksums

# A utility to install Cygwin (http://cygwin.com) packages and their dependencies.
choco.exe install -y cyg-get
