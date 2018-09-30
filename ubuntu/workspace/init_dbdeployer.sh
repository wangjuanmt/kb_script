#!/usr/bin/env bash

# https://github.com/datacharmer/dbdeployer

brew install athrunsun/linuxbinary/dbdeployer

# Install dependencies
sudo apt-get install -y libnuma1 libnuma-dev libaio1 libaio-dev

MYSQL_DOWNLOAD_URL=https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz
MYSQL_DOWNLOAD_SAVE_NAME=mysql-5.7.22-linux-glibc2.12-x86_64.tar.gz

curl -L -o $USER_DOWNLOADS/$MYSQL_DOWNLOAD_SAVE_NAME $MYSQL_DOWNLOAD_URL

# Update some default configuration
SANDBOX_HOME=$USER_LOCAL_LIB/dbdeployer/sandboxes
SANDBOX_BINARY=$USER_LOCAL_LIB/dbdeployer/sandbox-binary
mkdir -p $SANDBOX_HOME
mkdir -p $SANDBOX_BINARY
dbdeployer defaults update sandbox-home "$SANDBOX_HOME"
dbdeployer defaults update sandbox-binary "$SANDBOX_BINARY"

dbdeployer unpack $USER_DOWNLOADS/$MYSQL_DOWNLOAD_SAVE_NAME

# Skip mysql server start when deployment is done
#dbdeployer deploy single --skip-start 5.7.22

# See "dbdeployer usage" on how to start mysql server manually and how to use "mysql" binary
