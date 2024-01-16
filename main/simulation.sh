#!/bin/bash

export NR_OF_CUSTOMERS=$1
export NR_OF_SCOOTERS=$2
export SCOOTER_ID=1

if [ $1 == "stop" ]; then
    echo "Stopping simulation."
    docker-compose down
    exit 0
fi

if [ $# -lt 2 ]; then
    echo "Use command"
    echo "    ./simulation <NR_OF_CUSTOMERS> <NR_OF_SCOOTERS>"
    echo "to start or"
    echo "    ./simulation stop"
    echo "to stop simulation."
    exit 0
fi

echo "Starting simulation with $NR_OF_CUSTOMERS customers and $NR_OF_SCOOTERS scooters."

docker-compose up -d database-server
docker-compose up -d api-server
docker-compose up -d ws-server
docker-compose up -d mock-service
docker-compose up -d wsclient-prototype
