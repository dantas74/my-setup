#!/bin/bash

docker stop $(docker ps -q) &> /dev/null

docker rm $(docker ps -aq) &> /dev/null

docker rmi $(docker images -aq) &> /dev/null

docker volume rm $(docker volume ls -q) &> /dev/null

exit 0
