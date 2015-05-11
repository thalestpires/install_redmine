apt-get install -y mysql-server
service mysql start

/usr/bin/mysqladmin -u root password $DB_ROOT_PASSWORD

mysql -u root -p$DB_ROOT_PASSWORD -e "create user $DB_USERNAME identified by '$DB_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "create database redmine character set utf8;"
mysql -u root -p$DB_ROOT_PASSWORD -e "grant all privileges on redmine.* to '$DB_USERNAME'@'localhost' identified by '$DB_PASSWORD';"
mysql -u root -p$DB_ROOT_PASSWORD -e "flush privileges;"
