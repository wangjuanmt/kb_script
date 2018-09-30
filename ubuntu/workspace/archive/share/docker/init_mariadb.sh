#!/usr/bin/env bash

echo "This script is deprecated! Use docker compose instead!"
exit 1

# https://hub.docker.com/_/mariadb/
MARIADB_IMG_NAME=mariadb
MARIADB_DATA_IMG_NAME=busybox
MARIADB_PORT=3306
MARIADB_CONTAINER_NAME=mariadb_local
MARIADB_DATA_CONTAINER_NAME=mariadb_data
MARIADB_DEFAULT_DATA_DIR_INSIDE_CONTAINER=/var/lib/mysql
MARIADB_DEFAULT_DATA_DIR_OUTSIDE_CONTAINER=$WORKSPACE_ROOT/devsoft/mariadbdata
MARIADB_ROOT_PWD=@ctive123

docker pull $MARIADB_IMG_NAME

# Create a data volume container
docker create --name $MARIADB_DATA_CONTAINER_NAME -v $MARIADB_DEFAULT_DATA_DIR_INSIDE_CONTAINER $MARIADB_DATA_IMG_NAME

# Create a mariadb container with mariadb data container mounted
docker create --name $MARIADB_CONTAINER_NAME -p $MARIADB_PORT:$MARIADB_PORT--volumes-from $MARIADB_DATA_CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$MARIADB_ROOT_PWD $MARIADB_IMG_NAME

# Alternatively, if we want to mount a host directory as a data volume:
#docker create --name $MARIADB_CONTAINER_NAME -p $MARIADB_PORT:$MARIADB_PORT --net="bridge" -v $MARIADB_DEFAULT_DATA_DIR_OUTSIDE_CONTAINER:$MARIADB_DEFAULT_DATA_DIR_INSIDE_CONTAINER -e MYSQL_ROOT_PASSWORD=$MARIADB_ROOT_PWD $MARIADB_IMG_NAME

# Connect to MariaDB via the mysql command line client
#docker run -rm -it --name=mariadbcli --link <mariadb container name/id>:mariadb $MARIADB_IMG_NAME sh -c 'exec mysql -h"mariadb" -P"$MARIADB_PORT" -uroot -p"$MARIADB_ROOT_PWD"'
# We can also use it as a client for non-Docker or remote MariaDB instances
#docker run -it --rm mariadb mysql -hsome.mysql.host -usome-mysql-user -p

# mycli inside docker:
# https://hub.docker.com/r/okampfer/mycli-docker/
#docker run --rm -it --name=mariadbcli --link=<mariadb container name/id>:mariadb okampfer/mycli-docker --host=mariadb --port=$MARIADB_PORT --database=mysql --user=root --password=$MARIADB_ROOT_PWD
