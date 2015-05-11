#!/bin/bash

export RUBY_VERSION=1.9.3
export REDMINE_PATH=/soma/redmine
export REDMINE_VER=2.6
export DB_USERNAME=soma
export DB_PASSWORD=soma121267
export DB_ROOT_PASSWORD=gcSOMA927156


BASEDIR=$(dirname $0)
bash -li "$BASEDIR/scripts/$1/pre-install.sh"
bash -li "$BASEDIR/scripts/$1/install_rvm.sh"
bash -li "$BASEDIR/scripts/$1/install_ruby.sh"
bash -li "$BASEDIR/scripts/$1/install_mysql.sh"
bash -li "$BASEDIR/scripts/$1/install_redmine.sh"
bash -li "$BASEDIR/scripts/$1/install_apache.sh"
