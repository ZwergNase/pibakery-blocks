#!/bin/bash

#install docker
curl -sSL https://get.docker.com | sh

#install portainer ?
if [ "$1" == "Enable" ]
then
	docker volume create portainer_data
	docker run --restart always -d -p $2:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer	
fi

#enable user pi to control docker?
if [ "$4" == "Enable" ]
then
	usermod -aG docker $3
fi