#!/bin/bash
echo 'Install Apache'

yum install httpd httpd-devel libcurl-devel apr-util-devel apr-devel
chkconfig httpd on
service httpd start

gem install passenger
passenger-install-apache2-module --auto --languages ruby
passenger-install-apache2-module --snippet > passenger-compiled.conf
awk '{new=$0; print old; old=new}END{print "  PassengerDefaultGroup apache\n  PassengerDefaultGroup apache"; print old}' < passenger-compiled.conf > /etc/httpd/conf.modules.d/passenger-compiled.conf

service httpd restart

yum install mod_ssl
