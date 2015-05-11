#!/bin/bash

echo 'Install RVM'
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

usermod -a -G rvm root
source /etc/profile.d/rvm.sh
