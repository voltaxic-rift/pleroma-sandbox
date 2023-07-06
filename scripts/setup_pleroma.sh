#!/bin/bash

set -eux

cp -r /vagrant/pleroma-docker /opt/
pushd /opt/pleroma-docker
docker compose build
