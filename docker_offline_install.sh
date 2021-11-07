#!/usr/bin/env bash

repo_path=$(realpath repo)
cp /etc/apt/sources.list /etc/apt/sources.list.bk -f
echo "deb [trusted=yes] file:${repo_path} ./" >/etc/apt/sources.list
apt-get update -y
apt-get install docker-ce -y
