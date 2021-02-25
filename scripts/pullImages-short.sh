#!/bin/bash
REPOSITORY_PREFIX=bkable
REPOSITORY_HOST=
IMAGE_TAG=


docker pull ${REPOSITORY_PREFIX}/api-gateway:latest
docker pull ${REPOSITORY_PREFIX}/visits-service:latest
docker pull ${REPOSITORY_PREFIX}/vets-service:latest
docker pull ${REPOSITORY_PREFIX}/customers-service:latest
docker pull ${REPOSITORY_PREFIX}/admin-server:latest
docker pull ${REPOSITORY_PREFIX}/discovery-server:latest
docker pull ${REPOSITORY_PREFIX}/config-server:latest