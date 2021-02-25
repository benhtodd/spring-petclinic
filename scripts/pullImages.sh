#!/bin/bash
REPOSITORY_PREFIX=bkable
REPOSITORY_HOST=
IMAGE_TAG=


docker pull ${REPOSITORY_PREFIX}/spring-petclinic-api-gateway:latest
docker pull ${REPOSITORY_PREFIX}/spring-petclinic-visits-service:latest
docker pull ${REPOSITORY_PREFIX}/spring-petclinic-vets-service:latest
docker pull ${REPOSITORY_PREFIX}/spring-petclinic-customers-service:latest
docker pull ${REPOSITORY_PREFIX}/spring-petclinic-admin-server:latest
docker pull ${REPOSITORY_PREFIX}/spring-petclinic-discovery-server:latest
docker pull ${REPOSITORY_PREFIX}/spring-petclinic-config-server:latest