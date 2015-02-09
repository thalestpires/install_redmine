#!/bin/bash

echo 'Install RVM'
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -L get.rvm.io | bash -s stable

usermod -a -G rvm root
source /etc/profile.d/rvm.sh
