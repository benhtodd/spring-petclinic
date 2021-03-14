#!/bin/bash
SRC_PREFIX=benhtodd
SRC_IMAGE_TAG=1.0
TAR_PREFIX=harbor.local/petclinic
TAR_IMAGE_TAG=1.0

# echo rename {SRC_PREFIX}/api-gateway:${SRC_IMAGE_TAG}  to ${TAR_PREFIX}/api-gateway:${TAR_IMAGE_TAG}
docker tag ${SRC_PREFIX}/api-gateway:${SRC_IMAGE_TAG} ${TAR_PREFIX}/api-gateway:${TAR_IMAGE_TAG}
docker rmi ${SRC_PREFIX}/api-gateway:${SRC_IMAGE_TAG}
docker tag ${SRC_PREFIX}/vets-service:${SRC_IMAGE_TAG} ${TAR_PREFIX}/vets-service:${TAR_IMAGE_TAG}
docker rmi ${SRC_PREFIX}/vets-service:${SRC_IMAGE_TAG}
docker tag ${SRC_PREFIX}/customers-service:${SRC_IMAGE_TAG} ${TAR_PREFIX}/customers-service:${TAR_IMAGE_TAG}
docker rmi ${SRC_PREFIX}/customers-service:${SRC_IMAGE_TAG}
docker tag ${SRC_PREFIX}/admin-server:${SRC_IMAGE_TAG} ${TAR_PREFIX}/admin-server:${TAR_IMAGE_TAG}
docker rmi ${SRC_PREFIX}/admin-server:${SRC_IMAGE_TAG}
docker tag ${SRC_PREFIX}/config-server:${SRC_IMAGE_TAG} ${TAR_PREFIX}/config-server:${TAR_IMAGE_TAG}
docker rmi ${SRC_PREFIX}/config-server:${SRC_IMAGE_TAG}
docker tag ${SRC_PREFIX}/visits-service:${SRC_IMAGE_TAG} ${TAR_PREFIX}/visits-service:${TAR_IMAGE_TAG}
docker rmi ${SRC_PREFIX}/visits-service:${SRC_IMAGE_TAG}

docker images