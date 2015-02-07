#!/bin/bash

echo 'Install RVM'
apt-get -y install curl
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source /usr/local/rvm/bin/rvm

echo 'Install RUBY'
rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm alias create default 1.9.3
source ~/.bashrc
ruby -v

echo 'Install Redmine'
mkdir /opt/redmine
cd /opt/redmine
apt-get install -y subversion
svn co https://svn.redmine.org/redmine/branches/2.6-stable redmine-2.6
apt-get install -y mysql-server
apt-get install -y libmysqlclient-dev freetds-dev imagemagick libmagickcore-dev libmagickwand-dev libcurl4-openssl-dev apache2-threaded-dev libapr1-dev libaprutil1-dev
cd redmine-2.6
cd config/
wget https://raw.githubusercontent.com/victorlcampos/install_redmine/master/templates/database.yml
wget https://raw.githubusercontent.com/victorlcampos/install_redmine/master/templates/configuration.yml
cd ..
bundle exec rake generate_secret_token
bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production

echo 'Install Apache'
apt-get install -y apache2
gem install passenger
passenger-install-apache2-module
