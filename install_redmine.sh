#!/bin/bash

export RUBY_VERSION=2.2
export REDMINE_PATH=/opt/redmine
export REDMINE_VER=3.1

export MYSQL_PRINT_ONLY=true/false
export MYSQL_IMPL=mariadb/mysql
export MYSQL_ROOT_PASSWORD=fill_root_pass_here
export MYSQL_DBNAME=redmine_r3demo
export MYSQL_HOST=mammoth.local
export MYSQL_USERNAME=redmine_r3demo
export MYSQL_PASSWORD=fill_user_pass_here

BASEDIR=$(dirname $0)
bash -li "$BASEDIR/scripts/$1/pre-install.sh"
bash -li "$BASEDIR/scripts/$1/install_rvm.sh"
bash -li "$BASEDIR/scripts/$1/install_ruby.sh"
bash -li "$BASEDIR/scripts/$1/install_mysql.sh"
bash -li "$BASEDIR/scripts/$1/install_redmine.sh"
bash -li "$BASEDIR/scripts/$1/install_apache.sh"
