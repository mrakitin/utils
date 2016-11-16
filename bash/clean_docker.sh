#!/bin/bash

docker ps -a
docker rm $(docker ps -a | grep rabbitmq:management | awk '{print $1}')

