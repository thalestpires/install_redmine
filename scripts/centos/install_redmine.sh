#!/bin/bash

echo 'Install Redmine'


mkdir -p $REDMINE_PATH
cd $REDMINE_PATH
echo `pwd`
#svn co http://svn.redmine.org/redmine/branches/$REDMINE_VER-stable redmine-$REDMINE_VER

echo "add the following key to your Planio account:"
cat ~/.ssh/id_rsa.pub
read

sudo setfacl -R -m g:admin:rwX ./
git clone -o vpms git@projects.visagio.com:visagio-redmine-app.git ./


yum install mysql-devel ImageMagick-devel 

cp redmine-$REDMINE_VER/config/database.yml{.example,}
cp redmine-$REDMINE_VER/config/configuration.yml{.example,}
sed --in-place "s/username:.*/username: $MYSQL_USERNAME/g" redmine-$REDMINE_VER/config/database.yml
sed --in-place "s/password:.*/password: $MYSQL_PASSWORD/g" redmine-$REDMINE_VER/config/database.yml

cd redmine-$REDMINE_VER

gem install bundle
bundle
bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV=production

adduser redmine
usermod -a -G rvm redmine
chown -R redmine:redmine $REDMINE_PATH/redmine-$REDMINE_VER/{public,tmp,log,files}


ln -s $REDMINE_PATH/redmine-$REDMINE_VER $REDMINE_PATH/current

#TODO mover lugar dos anexos

cd ~


