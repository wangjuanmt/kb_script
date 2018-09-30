#!/usr/bin/env fish

function upgrade_rbenv
    cd (rbenv root)
    git pull

    cd (rbenv root)/plugins/ruby-build
    git pull
end
