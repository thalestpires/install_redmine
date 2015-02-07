#!/bin/bash

echo 'Install RVM'
apt-get -y install curl
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source /usr/local/rvm/bin/rvm
