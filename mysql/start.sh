#!/bin/bash

# Config Openrc and start Mariadb
mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old_mariadb-server.cnf
sed "s/^skip-networking/#&/" /etc/my.cnf.d/old_mariadb-server.cnf > /etc/my.cnf.d/mariadb-server.cnf
rm /etc/my.cnf.d/old_mariadb-server.cnf
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start

# Create Database wordpress
mysql << EOF 
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'root';
GRANT ALL ON wordpress.* TO 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Add Database
#if [ ! -f /var/lib/mysql/wordpress ]; then
#	mysql -h localhost wordpress < ./wordpress.sql
#fi
tail -f /dev/null
