#!/usr/bin/env bash

# Add multiple system python versions
# https://github.com/pyenv/pyenv/issues/158
# NOTE ubuntu has different locations for python2/3 exeutables!
pyenv virtualenv -p /usr/bin/python2 venv2
pyenv virtualenv -p /usr/bin/python3 venv3

pyenv global venv3
pyenv rehash
