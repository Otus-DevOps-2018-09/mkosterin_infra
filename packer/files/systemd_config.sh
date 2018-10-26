#!/bin/sh
cp ~/puma.service /etc/systemd/system/
systemctl enable puma
systemctl start puma

