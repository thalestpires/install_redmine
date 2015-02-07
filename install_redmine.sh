#!/bin/bash

BASEDIR=$(dirname $0)
bash -li $BASEDIR'/scripts/install_rvm.sh'
bash -li $BASEDIR'/scripts/install_ruby.sh'
bash -li $BASEDIR'/scripts/install_redmine.sh'
bash -li $BASEDIR'/scripts/install_apache.sh'
