# docker

För att ansluta till systemets docker registry behövs Docker CLI och Azure CLI.

Installera Docker CLI

https://dbwebb.se/kunskap/installera-virtualiseringsmiljon-docker

Installera Azure CLI
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

Ansluta till Azure Container Registry
```
az login
az acr login --name bestscooter
```

Färdig! Om du har rättigheter så kan du nu pusha och pulla.

Exempelkod för att hämta en image på nätet och sedan tagga, pusha och pulla den.
```
docker pull mcr.microsoft.com/mcr/hello-world
docker tag mcr.microsoft.com/mcr/hello-world bestscooter.azurecr.io/test/hello-world
docker push bestscooter.azurecr.io/test/hello-world

docker pull bestscooter.azurecr.io/test/hello-world
```
