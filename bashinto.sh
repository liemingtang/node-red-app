#!/bin/bash

# bash into the node-red container

if [ -z "$1" ]
then
    echo "No node-red container specified"
    echo "e.g., sudo ./bashinto.sh nodered-1880"  
    exit
fi

docker start $1 && \ 
docker exec -i -t $1 /bin/bash

