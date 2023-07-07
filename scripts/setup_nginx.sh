#!/bin/bash

set -eux

dnf install -y nginx

\cp -f /vagrant/configurations/nginx.conf.template /etc/nginx/conf.d/pleroma.conf
sed -ri "s/%HOSTNAME%/$(hostname)/g" /etc/nginx/conf.d/pleroma.conf

\cp -rf /vagrant/certs /opt/pleroma-docker/

systemctl enable --now nginx
