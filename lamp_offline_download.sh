#!/usr/bin/env bash

mkdir repo
packages=(mysql-server apache2 php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip)
for pkg in ${packages[@]}; do
./getpkg.sh $pkg repo/
done
