#!/bin/bash

set -eux

\cp -rf /vagrant/pleroma-docker /opt/
pushd /opt/pleroma-docker
    docker compose build
    \cp -f /vagrant/configurations/$(hostname)/* ./
    
popd
