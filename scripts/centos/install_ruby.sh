#!/bin/bash

echo "Install RUBY $RUBY_VERSION..."
sudo -i rvm requirements
rvm install $RUBY_VERSION
bash --login -c "rvm use $RUBY_VERSION --default"
rvm alias create default $RUBY_VERSION
