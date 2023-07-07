#!/bin/bash

set -eux

\cp -rf /vagrant/pleroma-docker /opt/
pushd /opt/pleroma-docker
    docker compose build
    \cp -f /vagrant/configurations/$(hostname)/* ./
    docker compose up -d db
    docker compose cp /vagrant/configurations/setup_db.psql db:/tmp/
    docker compose exec db ash -c '\
        while ! pg_isready -U pleroma -d postgres://db:5432/pleroma -t 1; do \
            sleep 1s; \
        done; \
        psql -U pleroma -f /tmp/setup_db.psql; \
    '
    docker compose up -d
popd
