#! /bin/bash
name='container_name'
runnigContainers=$(docker ps -q -f name=$name)
stoppedContainers=$(docker stop $runnigContainers)
docker rm $stoppedContainers
