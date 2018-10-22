#!/bin/sh
echo "Setting up RUBY"
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundle -v
echo "Setup Ruby completed"

