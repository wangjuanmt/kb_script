#!/usr/bin/env fish

# Directly loading via 'eval' command will error out with:
# pyenv: no such command `sh-'.
# Similar problem occurs for rbenv/nodenv.
function load_pyenv
    pyenv init - fish | source
    pyenv virtualenv-init - fish | source
end
