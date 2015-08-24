#!/bin/bash

echo 'Install Redmine'


if [[ ! -e ~/.ssh/id_rsa.pub ]]; then
	ssh-keygen;
fi

echo "add the following key to your Planio account and press any key to continue"
cat ~/.ssh/id_rsa.pub
read

sudo mkdir -p $REDMINE_PATH
sudo setfacl -R -m g:admin:rwX $REDMINE_PATH
sudo setfacl -R -m d:g:admin:rwX $REDMINE_PATH
git clone -o vpms git@projects.visagio.com:visagio-redmine-app.git $REDMINE_PATH

cd $REDMINE_PATH
git checkout redmine-$REDMINE_VER

sudo adduser redmine
sudo usermod -a -G rvm redmine
sudo chown -R redmine:redmine $REDMINE_PATH/{public,tmp,log,files}

# TODO create the push code to the target git repo

sudo yum install mysql-devel ImageMagick-devel

cp config/database.yml{.example,}
cp config/configuration.yml{.example,}
sed --in-place "0,/username:.*//username: $MYSQL_USERNAME/" config/database.yml
sed --in-place "0,/password:.*//password: $MYSQL_PASSWORD/" config/database.yml
sed --in-place "0,/host:.*//host: $MYSQL_HOST/" config/database.yml
sed --in-place "0,/database:.*//database: $MYSQL_DBNAME/" config/database.yml

gem install bundle
bundle
bundle exec rake generate_secret_token
bundle exec rake db:migrate RAILS_ENV=production

#TODO mover lugar dos anexos

cd ~
