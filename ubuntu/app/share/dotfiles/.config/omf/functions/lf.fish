#!/usr/bin/env fish

# To update locate db, run:
# "sudo updatedb" on linux,
# and "sudo /usr/libexec/locate.updatedb" on macos.

function lf
    if [ "$SYSTEM_CATEGORY" = "mac" ]
        # Use "glocate" and "sudo gupdatedb" from "brew install findutils"
        glocate / | fzf -m
    else
        locate / | fzf -m
    end
end
