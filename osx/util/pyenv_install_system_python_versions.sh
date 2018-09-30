#!/usr/bin/env bash

# Add multiple system python versions
# https://github.com/pyenv/pyenv/issues/158
pyenv virtualenv -p /usr/local/bin/python2 venv2
pyenv virtualenv -p /usr/local/bin/python3 venv3

pyenv global venv3
pyenv rehash
