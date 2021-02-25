#!/bin/bash
docker tag bkable/api-gateway:latest registry.lab.livefire.dev/observe/api-gateway:1.0
docker rmi bkable/api-gateway:latest
docker tag bkable/vets-service:latest registry.lab.livefire.dev/observe/vets-service:1.0
docker rmi bkable/vets-service:latest
docker tag bkable/customers-service:latest registry.lab.livefire.dev/observe/customers-service:1.0
docker rmi bkable/customers-service:latest
docker tag bkable/admin-server:latest registry.lab.livefire.dev/observe/admin-server:1.0
docker rmi bkable/admin-server:latest
docker tag bkable/discovery-server:latest registry.lab.livefire.dev/observe/discovery-server:1.0
docker rmi bkable/discovery-server:latest
docker tag bkable/config-server:latest registry.lab.livefire.dev/observe/config-server:1.0
docker rmi bkable/config-server:latest
docker tag bkable/visits-service:latest registry.lab.livefire.dev/observe/visits-service:1.0
docker rmi bkable/visits-service:latest