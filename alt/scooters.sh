#!/bin/bash

if [ $1 == "stop" ]; then
    docker rm $(docker stop $(docker ps -a | grep missivaeak/bestscooter_scooter-app:alt | awk '{print $1}'))
    exit 0
fi

counter=1
while [ $counter -le $(($1)) ]; do
    docker run -d \
    -e SCOOTER_ID=$counter \
    -e HARDWARE_PATH=/scooter-app/model/hardware/ \
    -e LOG_PATH=/scooter-app/scooter-trips.log \
    -e NODE_ENV=simulation \
    -e BACKEND=http://api-server:1337/ \
    -e VERSION=v1 \
    -e HARDWARE_UPDATE=5000 \
    -e WS_URL=ws://ws-server:8081/ \
    -e TOKEN="" \
    --network alt_bestscooter-network \
    --link api-server:api-server \
    --link ws-server:ws-server \
    --volume alt_hardware:/scooter-app/model/hardware/ \
    missivaeak/bestscooter_scooter-app:alt

    ((counter++))
done
