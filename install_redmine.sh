#!/bin/bash

BASEDIR=$(dirname $0)
bash -li $BASEDIR'/scripts/'$2'/install_rvm.sh'
bash -li $BASEDIR'/scripts/'$2'/install_ruby.sh' $1
bash -li $BASEDIR'/scripts/'$2'/install_redmine.sh'
bash -li $BASEDIR'/scripts/'$2'/install_apache.sh'
