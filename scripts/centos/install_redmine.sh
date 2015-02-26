#!/bin/bash

echo 'Install Redmine'


mkdir -p $REDMINE_PATH
cd $REDMINE_PATH
echo `pwd`
svn co https://svn.redmine.org/redmine/branches/$REDMINE_VER-stable redmine-$REDMINE_VER

yum install mysql-devel ImageMagick-devel 

cp redmine-$REDMINE_VER/config/database.yml{.example,}
cp redmine-$REDMINE_VER/config/configuration.yml{.example,}
sed --in-place "s/username:.*/username: $DB_USERNAME/g" redmine-$REDMINE_VER/config/database.yml
sed --in-place "s/password:.*/password: $DB_PASSWORD/g" redmine-$REDMINE_VER/config/database.yml

cd redmine-$REDMINE_VER

bundle
bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV=production

adduser redmine
usermod -a -G rvm redmine
chown -R redmine:redmine $REDMINE_PATH/redmine-$REDMINE_VER/{public,tmp,log,files}

cd ..


