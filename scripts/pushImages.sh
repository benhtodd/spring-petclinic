#!/bin/bash
#
# This script is built to push local images to Harbor or another demote docker repo
#
TAR_PREFIX=benhtodd
TAR_IMAGE_TAG=1.0

#echo ${TAR_PREFIX}/api-gateway:${TAR_IMAGE_TAG}


docker push ${TAR_PREFIX}/api-gateway:${TAR_IMAGE_TAG}
docker push ${TAR_PREFIX}/visits-service:${TAR_IMAGE_TAG}
docker push ${TAR_PREFIX}/vets-service:${TAR_IMAGE_TAG}
docker push ${TAR_PREFIX}/customers-service:${TAR_IMAGE_TAG}
docker push ${TAR_PREFIX}/admin-server:${TAR_IMAGE_TAG}
docker push ${TAR_PREFIX}/discovery-service:${TAR_IMAGE_TAG}
docker push ${TAR_PREFIX}/config-server:${TAR_IMAGE_TAG}

