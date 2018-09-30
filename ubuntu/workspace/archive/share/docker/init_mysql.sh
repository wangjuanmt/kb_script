#!/usr/bin/env bash

echo "This script is deprecated! Use docker compose instead!"
exit 1

# https://hub.docker.com/_/mysql/
MYSQL_IMG_NAME=mysql
MYSQL_DATA_IMG_NAME=busybox
MYSQL_PORT=3306
MYSQL_CONTAINER_NAME=mysql_local
MYSQL_DATA_CONTAINER_NAME=mysql_data
MYSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER=/var/lib/mysql
MYSQL_DEFAULT_DATA_DIR_OUTSIDE_CONTAINER=$WORKSPACE_ROOT/devsoft/mysqldata
MYSQL_ROOT_PWD=@ctive123

docker pull $MYSQL_IMG_NAME

# Create a data volume container
docker create --name $MYSQL_DATA_CONTAINER_NAME -v $MYSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER $MYSQL_DATA_IMG_NAME

# We can either run the container directly or create it before starting it.
# '-v' option can be used multiple times,
# if we want to base our changes on the standard configuration file,
# we can save the default file to a custom location like this:
#docker exec -it my-container-name cat /etc/my.cnf > /my/custom/config-file
# Then start container with one more '-v' option '-v /my/custom/config-file:/etc/my.cnf'.

# Create a mysql container with mysql data container mounted
docker create --name $MYSQL_CONTAINER_NAME -p $MYSQL_PORT:$MYSQL_PORT --volumes-from $MYSQL_DATA_CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PWD $MYSQL_IMG_NAME

# Alternatively, if we want to mount a host directory as a data volume:
#docker create --name $MYSQL_CONTAINER_NAME -p $MYSQL_PORT:$MYSQL_PORT --net="bridge" -v $MYSQL_DEFAULT_DATA_DIR_OUTSIDE_CONTAINER:$MYSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PWD $MYSQL_IMG_NAME

# Connect to MySQL via the MySQL command line client
#docker run -rm -it --name=mysqlcli --link <mysql container name/id>:mysql $MYSQL_IMG_NAME sh -c 'exec mysql -h"mysql" -P"$MYSQL_PORT" -uroot -p"$MYSQL_ROOT_PWD"'
# We can also use it as a client for non-Docker or remote MySQL instances
#docker run -it --rm mysql mysql -hsome.mysql.host -usome-mysql-user -p

# mycli inside docker:
# https://hub.docker.com/r/diyan/mycli/
# https://hub.docker.com/r/okampfer/mycli-docker/
#docker run --rm -it --name=mycli --link=<mysql container name/id>:mysql okampfer/mycli-docker --host=mysql --port=$MYSQL_PORT --database=mysql --user=root --password=$MYSQL_ROOT_PWD
