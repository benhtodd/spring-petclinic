#!/bin/bash
#
#
# Example
# SRC_PREFIX=spring-petclinic
SRC_PREFIX=benhtodd
IMAGE_TAG=1.0

docker pull ${SRC_PREFIX}/api-gateway:${IMAGE_TAG}
docker pull ${SRC_PREFIX}/visits-service:${IMAGE_TAG}
docker pull ${SRC_PREFIX}/vets-service:${IMAGE_TAG}
docker pull ${SRC_PREFIX}/customers-service:${IMAGE_TAG}
docker pull ${SRC_PREFIX}/admin-server:${IMAGE_TAG}
docker pull ${SRC_PREFIX}/config-server:${IMAGE_TAG}