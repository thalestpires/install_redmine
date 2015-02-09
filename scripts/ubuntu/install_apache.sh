#!/bin/bash
echo 'Install Apache'
apt-get install -y apache2
gem install passenger
passenger-install-apache2-module


passenger-install-apache2-module --snippet | head -1 > /etc/apache2/mods-available/passenger-compiled.load
passenger-install-apache2-module --snippet | tail -n +2 > /etc/apache2/mods-available/passenger-compiled.conf
a2enmod passenger-compiled
service apache2 restart
