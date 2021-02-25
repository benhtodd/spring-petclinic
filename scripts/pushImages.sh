#!/bin/bash
REPOSITORY_HOST=registry.lab.livefire.dev
REPOSITORY_PREFIX=observe
IMAGE_TAG=1.0

docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/api-gateway:${IMAGE_TAG}
docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/visits-service:${IMAGE_TAG}
docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/vets-service:${IMAGE_TAG}
docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/customers-service:${IMAGE_TAG}
docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/admin-server:${IMAGE_TAG}
docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/discovery-service:${IMAGE_TAG}
docker push ${REPOSITORY_HOST}/${REPOSITORY_PREFIX}/config-server:${IMAGE_TAG}

