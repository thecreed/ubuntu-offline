#!/bin/bash

# make sure apache and mysql is not installed
apt-get remove apache2 mysql-server -y

# extract the tarball 
[ ! -d ubuntu-offline ] && tar xfz xibo-ubuntu-offline.tar.gz

cd ubuntu-offline

# install docker from local apt repo
docker version 1>/dev/null 2>/dev/null || sh ./docker_offline_install.sh

# install the docker-compose binary
if [ ! -x /usr/local/bin/docker-compose ] ; then
cp bin/docker-compose /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
fi


# import the container images
if [ `docker images | wc -l` -le 2 ] ; then 
echo "Loading images to docker"
docker load -i images/container_images.tar 1>/dev/null || echo "Error loading images to docker"

# restore the container tags
while read REPOSITORY TAG IMAGE_ID
do
        echo "== Tagging $REPOSITORY $TAG $IMAGE_ID =="
        docker tag "$IMAGE_ID" "$REPOSITORY:$TAG"
done < images/container_images.list
fi

# run the xibo deployment
cd  xibo-docker-3.0.3/ && docker-compose up -d
