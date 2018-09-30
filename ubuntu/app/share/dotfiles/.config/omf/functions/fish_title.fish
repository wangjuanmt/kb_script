#!/usr/bin/env fish

# Set terminal title
function __bobthefish_title_user -S -d 'Display actual user if different from $default_user'
    if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
        set -l IFS .
        hostname | read -l hostname __
        echo -ns (whoami) '@' $hostname ' '
    end
end

function fish_title
    if set -q argv[1]; and [ "$argv[1]" != 'fish' ]
        echo $argv[1]
    else
        __bobthefish_title_user
        echo " - $PWD"
    end
end
