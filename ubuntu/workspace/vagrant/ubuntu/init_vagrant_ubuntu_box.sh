#!/usr/bin/env bash

vagrant init ubuntu/trusty64
vagrant up --provider virtualbox

# Then we can ssh into this box with:
#vagrant ssh
