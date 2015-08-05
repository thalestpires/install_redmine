
if [[ "$MYSQL_PRINT_ONLY" == "true" ]]; then

	prefix="echo "
	quote="\""

else

	prefix=""
	quote=""

	sudo yum -y install $MYSQL_IMPL-server $MYSQL_IMPL
	if [[ "$MYSQL_IMPL" == "mariadb" ]]; then
		sudo service mariadb start
		sudo chkconfig mariadb on
	else
		sudo service ${MYSQL_IMPL}d start
		sudo chkconfig ${MYSQL_IMPL}d on
	fi
	/usr/bin/mysqladmin -u root password $MYSQL_ROOT_PASSWORD
fi

`echo "$prefix"`mysql -h $MYSQL_HOST -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"create user $MYSQL_USERNAME identified by '$MYSQL_PASSWORD';"$quote
`echo "$prefix"`mysql -h $MYSQL_HOST -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"create database $MYSQL_DBNAME character set utf8;"$quote
`echo "$prefix"`mysql -h $MYSQL_HOST -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"grant all privileges on $MYSQL_DBNAME.* to '$MYSQL_USERNAME'@'%' identified by '$MYSQL_PASSWORD';"$quote
`echo "$prefix"`mysql -h $MYSQL_HOST -u root `if [[ "$MYSQL_ROOT_PASSWORD" != "" ]]; then echo -n "-p$MYSQL_ROOT_PASSWORD"; fi` -e $quote"flush privileges;"$quote


