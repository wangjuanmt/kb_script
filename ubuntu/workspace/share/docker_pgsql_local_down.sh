#!/usr/bin/env bash

DOCKER_PGSQL_LOCAL_HOME=$WORKSPACE_SCRIPT_SHARE/docker/pgsql_local
DOCKER_PGSQL_LOCAL_PROJECT_NAME=pgsql_local

cd $DOCKER_PGSQL_LOCAL_HOME

docker-compose -p $DOCKER_PGSQL_LOCAL_PROJECT_NAME down
