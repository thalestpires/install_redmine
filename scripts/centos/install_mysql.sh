
if [[ "$MYSQL_PRINT_ONLY" == "true" ]]; then

	prefix="echo "
	quote="\""

else

	prefix=""
	quote=""

	yum -y install $MYSQL_IMPL-server $MYSQL_IMPL
	service mariadb start
	chkconfig mariadb on
	/usr/bin/mysqladmin -u root password $MYSQL_ROOT_PASSWORD
fi

`echo "$prefix"`mysql -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"create user $MYSQL_USERNAME identified by '$MYSQL_PASSWORD';"$quote
`echo "$prefix"`mysql -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"create database $MYSQL_DBNAME character set utf8;"$quote
`echo "$prefix"`mysql -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"grant all privileges on $MYSQL_DBNAME.* to '$MYSQL_USERNAME'@'%' identified by '$MYSQL_PASSWORD';"$quote
`echo "$prefix"`mysql -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"flush privileges;"$quote


