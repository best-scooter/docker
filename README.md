# docker

## Ansluta till Azure Container Registry

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

## Testa

Ställ dig i mappen med `docker-compose.yml` och kör
```docker-compose up```

Navigera till `localhost:8080` och logga in med uppgifterna
```
database: database-server
username: user
password: password
database: database
```

Om du kommer in på en Adminer-sida för en tom databas så fungerar systemet såhär långt!
