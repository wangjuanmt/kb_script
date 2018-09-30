#!/usr/bin/env fish

function vim --description 'Will execute nvim if found'
    if type -q nvim
        nvim $argv
    else
        eval (which vim) $argv
    end
end
