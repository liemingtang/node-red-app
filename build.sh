#!/bin/bash

if [ -z "$1" ]
then
    echo "Please provide an image name for the docker image. "
    echo "Note: docker image name should be unique like lieming-node-red-image"
    echo "e.g., sudo ./build.sh lie-node-red-image"  
    exit
fi

docker build -t $1 .

