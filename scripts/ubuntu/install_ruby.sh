#!/bin/bash

echo 'Install RUBY'
rvm requirements
rvm install $1
rvm use $1 --default
rvm alias create default $1
