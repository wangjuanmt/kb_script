#!/usr/bin/env bash

# Cygwin does not have chsh for changing shells, nor does it have a /etc/passwd file. Thus, we need to make one.
mkpasswd -l -p "$(cygpath -H)" > /etc/passwd

cp /etc/passwd /etc/passwd.origin

# "/etc/passwd" format reference: https://www.cyberciti.biz/faq/understanding-etcpasswd-file-format/

# Update /etc/passwd to set default shell for current user to /bin/zsh,
# and change home directory of current user from "/cygdrive/c/Users/[user]" to "/home/[user]".
sed -rine "s/^($(whoami)\:.+)\/cygdrive\/c\/Users\/$(whoami)\:\/bin\/bash/\1\/home\/$(whoami)\:\/bin\/zsh/gi" /etc/passwd
