#!/usr/bin/env bash

SSH_ENV="$HOME/.ssh/env"

ssh-agent -k
[[ -f "$SSH_ENV" ]] && rm -f $SSH_ENV
