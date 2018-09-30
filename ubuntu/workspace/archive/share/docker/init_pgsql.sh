#!/usr/bin/env bash

echo "This script is deprecated! Use docker compose instead!"
exit 1

# https://ryaneschinger.com/blog/dockerized-postgresql-development-environment/
# https://docs.docker.com/engine/tutorials/dockervolumes/

# https://hub.docker.com/_/postgres/
PGSQL_IMG_NAME=postgres:9.5
PGSQL_DATA_IMG_NAME=busybox
PGSQL_PORT=5432
PGSQL_CONTAINER_NAME=pgsql_local_pgsql
PGSQL_DATA_CONTAINER_NAME=pgsql_data
PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER=/var/lib/postgresql/data/pgsqldata
PGSQL_DEFAULT_DATA_DIR_OUTSIDE_CONTAINER=$WORKSPACE_ROOT/devsoft/pgsqldata
PGSQL_SUPERUSER=postgres
PGSQL_PWD=@ctive123

#docker pull $PGSQL_IMG_NAME

# Create a data volume container
# NOTE this container will remain "Created" status
#docker create --name $PGSQL_DATA_CONTAINER_NAME -v $PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER $PGSQL_DATA_IMG_NAME

# To create a fresh container with custom 'initdb' arguments,
# use environment variable POSTGRES_INITDB_ARGS.
# The recommended way is to mount data from data volume container to posrgres container,
# so that database data is system-independent.
docker create --name $PGSQL_CONTAINER_NAME -p $PGSQL_PORT:$PGSQL_PORT --volumes-from $PGSQL_DATA_CONTAINER_NAME -e TZ="UTC" -e POSTGRES_USER=$PGSQL_SUPERUSER -e POSTGRES_PASSWORD=$PGSQL_PWD -e PGDATA=$PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER -e POSTGRES_INITDB_ARGS="-E UTF8 --locale='en_US.UTF-8'" $PGSQL_IMG_NAME

# Alternatively, if we want to mount a host directory as a data volume:
#docker create --name $PGSQL_CONTAINER_NAME -p $PGSQL_PORT:$PGSQL_PORT --net="bridge" -v $PGSQL_DEFAULT_DATA_DIR_OUTSIDE_CONTAINER:$PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER -e TZ="UTC" -e POSTGRES_PASSWORD=$PGSQL_PWD -e PGDATA=$PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER -e POSTGRES_INITDB_ARGS="-E UTF8 -U postgres -W --locale='en_US.UTF-8'" $PGSQL_IMG_NAME

# Backup data volumes
#docker run --rm --volumes-from $PGSQL_DATA_CONTAINER_NAME -v $(pwd):/backup busybox tar cvf /backup/pgsql_data_backup.tar $PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER

# Restore data volumes elsewhere (make sure 'pwd' has pgsql_data_backup.tar)
#docker run --rm --volumes-from $PGSQL_DATA_CONTAINER_NAME -v $(pwd):/backup busybox bash -c "cd $PGSQL_DEFAULT_DATA_DIR_INSIDE_CONTAINER && tar xvf /backup/pgsql_data_backup.tar --strip 1"

# To see the IP of a running container
# http://stackoverflow.com/questions/17157721/
#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name>/<container_id>

# To connect to docker container via psql
# https://www.postgresql.org/docs/9.5/static/app-psql.html
#docker run --name psqlcli -it --rm --link <postgres container name/id>:postgres $PGSQL_IMG_NAME psql -h postgres -p $PGSQL_PORT -U postgres

# pgcli inside docker: https://hub.docker.com/r/pygmy/pgcli/
#docker pull pygmy/pgcli:stable
# To run pgcli with default user set in postgres container
#docker run --name pgcli -it --rm --link <postgres container name/id>:postgres pygmy/pgcli
# To run pgcli with custom user (use "docker inspect" to get the ip address of postgres container)
#docker run --name pgcli -it --rm --link <postgres container name/id>:postgres pygmy/pgcli postgresql://<custom user name>:<custom password>@<postgres container ip/name>:<postgres container port>/<db_name>

# pgcli-docker: https://github.com/athrunsun/pgcli-docker
#docker run --name pgcli -it --rm --link <postgres container name/id>:postgres okampfer/pgcli-docker postgresql://<custom user name>:<custom password>@<postgres container ip/name>:<postgres container port>/<db_name>
