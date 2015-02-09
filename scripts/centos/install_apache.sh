#!/bin/bash
echo 'Install Apache'

yum install httpd httpd-devel libcurl-devel apr-util-devel apr-devel
chkconfig httpd on
service httpd start

gem install passenger
passenger-install-apache2-module

passenger-install-apache2-module --snippet > /etc/httpd/conf.d/passenger-compiled.conf
service httpd restart
