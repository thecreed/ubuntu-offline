#!/bin/bash

if [ -d ubuntu-offline ] ; then
pushd ubuntu-offline/xibo-docker-3.0.3
docker-compose down
docker image prune -a -f
popd
rm -rf ubuntu-offline
else echo "not exists"
fi
