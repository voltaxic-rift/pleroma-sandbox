#!/bin/bash

set -eux

if [ ! -e /vagrant/vendor/mkcert ]; then
    curl -L -o /vagrant/vendor/mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64
    chmod +x /vagrant/vendor/mkcert
fi

if [ ! -e /vagrant/certs/rootCA.pem ]; then
    pushd /vagrant/certs/
        /vagrant/vendor/mkcert -install
        \cp -f ~/.local/share/mkcert/rootCA.pem ./
        /vagrant/vendor/mkcert pleroma1.local
        /vagrant/vendor/mkcert pleroma2.local
        /vagrant/vendor/mkcert pleroma3.local
    popd
else
    trust anchor /vagrant/certs/rootCA.pem
fi
