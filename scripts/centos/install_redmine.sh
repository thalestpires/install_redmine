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
git checkout redmine-$REDMINE_VER

sudo adduser redmine
sudo usermod -a -G rvm redmine
sudo chown -R redmine:redmine $REDMINE_PATH/{public,tmp,log,files}

# TIDI create the push code to the target git repo

yum install mysql-devel ImageMagick-devel 

cp config/database.yml{.example,}
cp config/configuration.yml{.example,}
sed --in-place "s/username:.*/username: $MYSQL_USERNAME/g" config/database.yml
sed --in-place "s/password:.*/password: $MYSQL_PASSWORD/g" config/database.yml
sed --in-place "s/host:.*/host: $MYSQL_HOST/g" config/database.yml
sed --in-place "s/database:.*/database: $MYSQL_DBNAME/g" config/database.yml

gem install bundle
bundle
bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV=production

#TODO mover lugar dos anexos

cd ~


