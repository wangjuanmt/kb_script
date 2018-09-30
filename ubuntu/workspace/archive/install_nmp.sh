#!/usr/bin/env bash

# All backup files are prefixed with datetime when renaming,
# so that old files won't be overriden if we execute this file repeatedly.

# Check if user is root
[ $(id -u) != "0" ] && echo "Error: You must be root to run this script" && exit 1

. $SCRIPT_UTIL_ROOT/env_vars.sh

# nginx
apt-get install nginx -y
cd /etc/nginx
mv nginx.conf nginx.conf.backup_$(date +%F-%T)
#cp -f $WORKSPACE_ROOT/configbak/nginx/nginx.conf nginx.conf
ln -s $WORKSPACE_ROOT/configbak/nginx/nginx.conf

mkdir -p /etc/nginx/sites-enabled
cp -rf $WORKSPACE_ROOT/configbak/nginx/sites-enabled/* /etc/nginx/sites-enabled/

# mysql
#apt-get install mysql-server mysql-client mysql-workbench -y
#cd /etc/mysql
#mv my.cnf my.cnf.backup_$(date +%F-%T)
#cp -f $WORKSPACE_ROOT/configbak/mysql/my.cnf my.cnf
#cd $WORKSPACE_ROOT/devsoft
#chown -R mysql:mysql ./mysqldata

# During restarting, if we meet with errors like
# "log file ./ib_logfile0 is of different size than specified in the .cnf file",
# we can delete log files in data dir.
#find ./mysqldata -type f -regex './mysqldata/ib_logfile[0-9]*' -delete

#service mysql restart

# php
apt-get install php5-fpm php5-cli php5-mysql php5-gd php5-mcrypt -y

cd /etc/php5/cli
mv php.ini php.ini.backup_$(date +%F-%T)
ln -s /etc/php5/fpm/php.ini
# We may need to add "extension=mcrypt.so" to php.ini

#cd /etc/php5/fpm/pool.d
#mv www.conf www.conf.backup_$(date +%F-%T)
#perl -pi -e 's/^listen\s*=\s*[\d\.]+:\d+$/listen=tmp\/php5-fpm.sock/g' www.conf
#perl -pi -e 's/^listen\s*=\s*.*php5-fpm.sock$/listen=127.0.0.1:9000/g' www.conf

service nginx restart
service php5-fpm restart