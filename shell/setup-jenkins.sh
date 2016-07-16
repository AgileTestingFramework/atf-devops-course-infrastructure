#! /bin/bash

NAME=main_jenkins
PORT=8080
IMAGE=jenkins:1.651.3

sudo docker pull $IMAGE
sudo docker run -d --name $NAME -p $PORT:$PORT $IMAGE
