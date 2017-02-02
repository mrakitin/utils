#!/bin/bash
# Remove dangling docker images or all docker containers
# 2017-02-02

if [ -z "$1" ]; then
    docker images
    list_of_images=$(docker images --filter dangling=true -q)
    if [ ! -z "$list_of_images" ]; then
        docker rmi $list_of_images
    fi
elif [ "$1" == "mgmt" ]; then
    docker ps -a
    mgmt_container=$(docker ps -a | grep rabbitmq:management | awk '{print $1}')
    if [ ! -z "$mgmt_container" ]; then
        docker rm $mgmt_container
    fi
fi

