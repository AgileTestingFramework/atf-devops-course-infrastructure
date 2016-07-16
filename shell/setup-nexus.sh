#! /bin/bash

NAME=main_nexus
PORT=8081
IMAGE=sonatype/nexus:2.13.0-01

sudo docker pull $IMAGE
sudo docker run -d --name $NAME -p $PORT:$PORT $IMAGE
