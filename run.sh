#!/bin/bash

# example command:
#	sudo ./run.sh ~/Documents/repo/node-red-crypto-price-alert/btc_eth_ifttt_alert.json ~/node-red-data 1880

# note: the flows folder cannot be configured so you need to copy the flow from the repo of the app flow_app.json 
# to the flows folder.

if [ -z "$1" ]
then
    echo "No flow file supplied"
    echo "e.g., sudo ./run.sh flow_app.json ~/node-red-data 1880 my-node-red-image"  
    exit
fi


if [ -z "$2" ]
then
    echo "No node-red data folder supplied"
    echo "e.g., sudo ./run.sh flow_app.json ~/node-red-data 1880 lie-node-red-image"
    exit  
fi

if [ -z "$3" ]
then
    echo "No PORT supplied"
    echo "e.g., sudo ./run.sh flow_app.json ~/node-red-data 1880 lie-node-red-image"
    exit  
fi


if [ -z "$4" ]
then
    echo "No PORT supplied"
    echo "e.g., sudo ./run.sh flow_app.json ~/node-red-data 1880 lie-node-red-image"
    exit  
fi



echo "Start node-red application: "
echo "   Docker image name: $4"
echo "   container: nodered-$3"
echo "   flow file: $1"
echo "   Node-red folder: $2" 
echo "   PORT: $3" 
echo "   MQTT port: 1$3"


cp $1 $2/flow_app.json

docker run -d -p $3:1880  \
    -p 1$3:8880 \
	-v $2:/data \
	-e FLOWS=flow_app.json \
	--name nodered-$3 $4 && \
docker start nodered-$3 

