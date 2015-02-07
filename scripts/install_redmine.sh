#!/bin/bash

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
bundle
bundle exec rake generate_secret_token
bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production


