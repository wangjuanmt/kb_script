#!/usr/bin/env bash

# https://github.com/aws/aws-cli

eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init - bash)"
pyenv virtualenv 3.6.3 awscli
pyenv shell awscli
pip install awscli
