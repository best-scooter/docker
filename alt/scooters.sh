#!/bin/bash

if [ $1 == "stop" ]; then
    docker rm $(docker stop $(docker ps -a | grep bestscooter.azurecr.io/scooter-app | awk '{print $1}'))
    exit 0
fi

counter=1
while [ $counter -le $(($1)) ]; do
    docker run -d \
    -e SCOOTER_ID=$counter \
    -e HARDWARE_PATH=/scooter-app/model/hardware/ \
    -e LOG_PATH=scooter-trips.log \
    -e NODE_ENV=simulation \
    -e BACKEND=http://api-server:1337/ \
    -e VERSION=v1 \
    -e HARDWARE_UPDATE=5000 \
    -e WS_URL=ws://ws-server:8081/ \
    -e TOKEN="" \
    --network alt_bestscooter-network \
    --link api-server:bestscooter.azurecr.io/api-server \
    --link ws-server:bestscooter.azurecr.io/ws-server \
    --volume alt_hardware:/scooter-app/model/hardware/ \
    bestscooter.azurecr.io/scooter-app

    ((counter++))
done

# Denna funkar nog inte
# docker run -e SCOOTER_ID=1 -e HARDWARE_PATH=/model/hardware/ -e LOG_PATH=scooter-trips.log -e NODE_ENV=simulation -e BACKEND=http://api-server:1337/ -e VERSION=v1 -e HARDWARE_UPDATE=5000 -e WS_URL=ws://ws-server:8081/ -e TOKEN="" --network docker_bestscooter-network --link api-server:bestscooter.azurecr.io/api-server --link ws-server:bestscooter.azurecr.io/ws-server --volume /scooter-app/hardware:/scooter-app/model/hardware/ bestscooter.azurecr.io/scooter-app


# Denna funkar just nu
# TODO: lägg till -d flagga
# docker run -e SCOOTER_ID=1 -e HARDWARE_PATH=/scooter-app/model/hardware/ -e LOG_PATH=scooter-trips.log -e NODE_ENV=simulation -e BACKEND=http://api-server:1337/ -e VERSION=v1 -e HARDWARE_UPDATE=5000 -e WS_URL=ws://ws-server:8081/ -e TOKEN="" --network docker_bestscooter-network --link api-server:bestscooter.azurecr.io/api-server --link ws-server:bestscooter.azurecr.io/ws-server --volume docker_hardware:/scooter-app/model/hardware/ bestscooter.azurecr.io/scooter-app