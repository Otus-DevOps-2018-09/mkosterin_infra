#!/bin/sh
echo "Setting up MongoDB"
set -e
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongo-org-3.2.list
apt update
apt install -y mongodb-org
cp -f ~/mongod.conf /etc/
chown root:root /etc/mongod.conf
chmod 644 /etc/mongod.conf
systemctl enable mongod
echo "Setup MongoDB complete"

