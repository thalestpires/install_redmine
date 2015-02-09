#!/bin/bash

echo "Install RUBY $RUBY_VERSION..."
rvm requirements
rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default
rvm alias create default $RUBY_VERSION
