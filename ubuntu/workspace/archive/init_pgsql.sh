#!/usr/bin/env bash

# Run this script after PostgreSQL installation

PGSQL_DATA_DIR=$WORKSPACE_ROOT/devsoft/pgsqldata

# Set default timezone for database cluster
# https://www.postgresql.org/docs/current/static/app-initdb.html, 'Environment' section
export TZ='UTC'

# Initialize if cluster does not exists
if [ ! -d "$PGSQL_DATA_DIR" ]; then
    # Create a new PostgreSQL database cluster
    initdb -D $PGSQL_DATA_DIR -E UTF8 -U postgres -W --locale="en_US.UTF-8"
fi

# pg_hba.conf sample
# allow postgres user to use "trust" authentication on Unix sockets
#local   all   postgres                         trust
# allow all other users to use "md5" authentication on Unix sockets
#local   all   all                              md5
# for users connected via local IPv4 or IPv6 connections, always require md5
#host    all   all        127.0.0.1/32          md5
#host    all   all        ::1/128               md5