#!/usr/bin/env bash

mkdir repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce


packages=(docker-ce)
for pkg in ${packages[@]}; do
./getpkg.sh $pkg repo/
done
