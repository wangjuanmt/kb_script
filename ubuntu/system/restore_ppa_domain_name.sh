#!/usr/bin/env bash

cd /etc/apt/sources.list.d
ack -l "https://launchpad.proxy.ustclug.org" | sudo xargs perl -pi -E "s/https:\/\/launchpad\.proxy\.ustclug\.org/http:\/\/ppa\.launchpad\.net/g"
