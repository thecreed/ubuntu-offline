#!/usr/bin/env bash

function error_exit
{
  echo "$1" 1>&2
  echo "Usage: ./mkrepo.sh <packages-directory>" 1>&2
  exit 1
}

PKGDIR=$1

if [ ! $PKGDIR ]
then
  error_exit "No packages directory path set!"
fi

cd $PKGDIR
dpkg-scanpackages -m . > Packages
cat Packages | gzip -9c > Packages.gz
PKGS=$(wc -c Packages)
PKGS_GZ=$(wc -c Packages.gz)
cat > Release << EOF
Architectures: all
Date: $(date -R)
MD5Sum:
 $(md5sum Packages  | cut -d" " -f1) $PKGS
 $(md5sum Packages.gz  | cut -d" " -f1) $PKGS_GZ
SHA1:
 $(sha1sum Packages  | cut -d" " -f1) $PKGS
 $(sha1sum Packages.gz  | cut -d" " -f1) $PKGS_GZ
SHA256:
 $(sha256sum Packages | cut -d" " -f1) $PKGS
 $(sha256sum Packages.gz | cut -d" " -f1) $PKGS_GZ
EOF

#and sign it
gpg -abs -o Release.gpg Release


dpkg-scanpackages ./ /dev/null | gzip -9c > ./Packages.gz