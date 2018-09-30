#!/usr/bin/env fish

function upgrade_pyenv
    cd (pyenv root)
    git pull
end
