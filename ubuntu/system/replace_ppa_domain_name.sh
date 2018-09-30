#!/usr/bin/env bash

cd /etc/apt/sources.list.d
ack -l "http://ppa.launchpad.net" | sudo xargs perl -pi -E "s/http:\/\/ppa\.launchpad\.net/https:\/\/launchpad\.proxy\.ustclug\.org/g"
ack -l "https://ppa.launchpad.net" | sudo xargs perl -pi -E "s/https:\/\/ppa\.launchpad\.net/https:\/\/launchpad\.proxy\.ustclug\.org/g"
