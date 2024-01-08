counter=1
while [ $counter -le 1000 ]
do
  docker run -d -e SCOOTERID=$counter -e PASSWORD=$counter --network docker_bestscooter-network --link api-server:bestscooter.azurecr.io/api-server --link ws-server:bestscooter.azurecr.io/ws-server --volume hardware:/scooter-app/model/hardware/ bestscooter.azurecr.io/scooter-app
  ((counter++))
done

# Denna funkar nog inte
# docker run -e SCOOTER_ID=1 -e HARDWARE_PATH=/model/hardware/ -e LOG_PATH=scooter-trips.log -e NODE_ENV=simulation -e BACKEND=http://api-server:1337/ -e VERSION=v1 -e HARDWARE_UPDATE=5000 -e WS_URL=ws://ws-server:8081/ -e TOKEN="" --network docker_bestscooter-network --link api-server:bestscooter.azurecr.io/api-server --link ws-server:bestscooter.azurecr.io/ws-server --volume /scooter-app/hardware:/scooter-app/model/hardware/ bestscooter.azurecr.io/scooter-app


# Denna funkar just nu
# TODO: lägg till -d flagga
# docker run -e SCOOTER_ID=1 -e HARDWARE_PATH=/scooter-app/model/hardware/ -e LOG_PATH=scooter-trips.log -e NODE_ENV=simulation -e BACKEND=http://api-server:1337/ -e VERSION=v1 -e HARDWARE_UPDATE=5000 -e WS_URL=ws://ws-server:8081/ -e TOKEN="" --network docker_bestscooter-network --link api-server:bestscooter.azurecr.io/api-server --link ws-server:bestscooter.azurecr.io/ws-server --volume docker_hardware:/scooter-app/model/hardware/ bestscooter.azurecr.io/scooter-app