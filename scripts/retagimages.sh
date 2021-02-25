#!/bin/bash
docker tag observe/spring-petclinic-api-gateway:1.0 registry.lab.livefire.dev/observe/spring-petclinic-api-gateway:1.0
docker rmi observe/spring-petclinic-api-gateway:1.0
docker tag observe/spring-petclinic-vets-service:1.0 registry.lab.livefire.dev/observe/spring-petclinic-vets-service:1.0
docker rmi observe/spring-petclinic-vets-service:1.0
docker tag observe/spring-petclinic-customers-service:1.0 registry.lab.livefire.dev/observe/spring-petclinic-customers-service:1.0
docker rmi observe/spring-petclinic-customers-service:1.0
docker tag observe/spring-petclinic-admin-server:1.0 registry.lab.livefire.dev/observe/spring-petclinic-admin-server:1.0
docker rmi observe/spring-petclinic-admin-server:1.0
docker tag observe/spring-petclinic-discovery-server:1.0 registry.lab.livefire.dev/observe/spring-petclinic-discovery-server:1.0
docker rmi observe/spring-petclinic-discovery-server:1.0
docker tag observe/spring-petclinic-config-server:1.0 registry.lab.livefire.dev/observe/spring-petclinic-config-server:1.0
docker rmi observe/spring-petclinic-config-server:1.0
docker tag observe/spring-petclinic-visits-service:1.0 registry.lab.livefire.dev/observe/spring-petclinic-visits-service:1.0
docker rmi observe/spring-petclinic-visits-service:1.0