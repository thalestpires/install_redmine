#!/bin/bash

echo 'Install RVM'
curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
curl -L get.rvm.io | sudo bash -s stable

sudo usermod -a -G rvm root
NUSER=`whoami`
sudo usermod -a -G rvm $NUSER
source /etc/profile.d/rvm.sh

#exec sudo su -l $USER
echo "please, logout and login again. set all variables again"
