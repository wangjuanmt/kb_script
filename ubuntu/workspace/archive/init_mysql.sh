#!/usr/bin/env bash

# Add PPA for mysql-5.6
sudo add-apt-repository -y ppa:ondrej/mysql-5.6

sudo apt-get update

# MySQL
sudo apt-get install -y mysql-server-5.6 mysql-client-5.6 mysql-workbench
cd /etc/mysql
mv my.cnf my.cnf.backup_$(date +%F-%T)
ln -s $WORKSPACE_SCRIPT_ROOT/config/mysql/my.cnf
# Preferred password for root: @ctive123
