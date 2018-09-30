#!/usr/bin/env fish

function upgrade_nodenv
    cd (nodenv root)
    git pull
end
