#!/bin/bash
echo 'Install Apache'

sudo yum -y install httpd httpd-devel libcurl-devel apr-util-devel apr-devel mod_ssl
sudo chkconfig httpd on
sudo service httpd start

gem install passenger
passenger-install-apache2-module --auto --languages ruby
passenger-install-apache2-module --snippet > passenger-compiled.conf
awk '{new=$0; print old; old=new}END{print "  PassengerDefaultGroup apache\n  PassengerDefaultGroup apache"; print old}' < passenger-compiled.conf > passenger-compiled-final.conf
sudo mv passenger-compiled-final.conf /etc/httpd/conf.modules.d/passenger-compiled.conf
rm -rf passenger-compiled.conf

sudo service httpd restart
