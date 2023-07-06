#!/bin/bash

set -eux

if [ ! -e /vagrant/vendor/pleroma.tar.gz ]; then
    curl -L -o /vagrant/vendor/pleroma.tar.gz https://git.pleroma.social/pleroma/pleroma/-/archive/v2.5.2/pleroma-v2.5.2.tar.gz
fi
