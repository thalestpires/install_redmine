#!/bin/bash

export RUBY_VERSION=1.9.3
export REDMINE_PATH=/notafiscal/redmin
export REDMINE_VER=2.6
export DB_USERNAME=notaPGN
export DB_PASSWORD=notaPGN121267
export DB_ROOT_PASSWORD=nfPGN927156


BASEDIR=$(dirname $0)
bash -li "$BASEDIR/scripts/$2/pre-install.sh"
bash -li "$BASEDIR/scripts/$2/install_rvm.sh"
bash -li "$BASEDIR/scripts/$2/install_ruby.sh"
bash -li "$BASEDIR/scripts/$2/install_mysql.sh"
bash -li "$BASEDIR/scripts/$2/install_redmine.sh"
bash -li "$BASEDIR/scripts/$2/install_apache.sh"
