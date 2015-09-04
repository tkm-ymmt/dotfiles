#!/bin/sh

docker-machine start hant-docker
docker-machine env hant-docker
eval "$(docker-machine env hant-docker)"
