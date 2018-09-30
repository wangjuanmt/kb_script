#!/usr/bin/env bash

# https://github.com/brookshi/Hitchhiker

echo "Would be better to use custom docker compose yaml instead."
exit 1

HITCHHIKER_HOME=$USER_LOCAL_APP/hitchhiker

# Create folder
mkdir -p $HITCHHIKER_HOME
cd $HITCHHIKER_HOME

# Download docker-compose & mysql.conf file from github
curl -O https://raw.githubusercontent.com/brookshi/Hitchhiker/release/deploy/docker/hitchhiker_and_mysql/docker-compose.yml -O https://raw.githubusercontent.com/brookshi/Hitchhiker/release/deploy/docker/hitchhiker_and_mysql/hitchhiker-mysql.cnf

# Edit docker-compose.yml file ,replace localhost to your host ip/domain if necessary then save & quit.
# Another thing to note is we have to share /my/hitchhiker/sqldata on host machine.

docker-compose up -d

# test
curl http://localhost:8080/
