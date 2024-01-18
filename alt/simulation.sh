#!/bin/bash

export NR_OF_CUSTOMERS=$1
export NR_OF_SCOOTERS=$2
export SPEED_MULTIPLIER=$3
export SCOOTER_ID=1

if [ $# -lt 3 ]; then
    if [ $1 == "stop" ]; then
        echo "Stopping simulation."
        bash scooters.sh stop
        docker-compose down
        exit 0
    fi

    echo "Use command"
    echo "    ./simulation <NR_OF_CUSTOMERS> <NR_OF_SCOOTERS> <SPEED_MULTIPLIER>"
    echo "to start or"
    echo "    ./simulation stop"
    echo "to stop simulation."
    exit 0
fi


echo "Starting simulation with $NR_OF_CUSTOMERS customers and $NR_OF_SCOOTERS scooters with speed multiplier $SPEED_MULTIPLIER."

docker-compose up -d database-server
docker-compose up -d api-server
docker-compose up -d ws-server
docker-compose up -d mock-service
docker-compose up -d wsclient-prototype
bash scooters.sh $NR_OF_SCOOTERS

# while [ $SCOOTER_ID -le $(($NR_OF_SCOOTERS)) ]
# do
#   docker-compose up -d scooter-app
#   ((SCOOTER_ID++))
# done
