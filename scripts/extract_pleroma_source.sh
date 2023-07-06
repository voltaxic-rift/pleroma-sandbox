#!/bin/bash

set -eux

mkdir /opt/pleroma-source
pushd /opt/pleroma-source
    tar zxvf /vagrant/vendor/pleroma.tar.gz --strip-components 1
popd
