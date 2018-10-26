#!/bin/sh
echo "Setting up RUBY"
set -e

apt update
apt install -y ruby-full ruby-bundler build-essential
echo "Setup Ruby completed"

