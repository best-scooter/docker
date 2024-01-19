# docker simulation

I detta repo finns två varianter av att simulera scootersystemet.

## Simulation 1: main

Denna simulation kör systemet och kan användas för att demonstrera systemets huvudsakliga features. Systemets backend körs igång och tjänsten `mock-service` mockar kunder och elsparkcyklar till systemet. Detta system klarar av hög belastning. Det kan köras igång med följande kommandon:

```
cd main/
bash simulation.sh 5000 5000 1 // starta simulation
bash simulation.sh stop // stop
```

## Simulation 2: alt

Denna simulation kör systemet och ett antal `scooter-app`:s. I denna variant används mock-service för att mocka kunder och spara undan samt uppdatera hårdvaru-data i en docker-volym.`scooter-app`:s använder sig av volymens filer för att ställeföreträda elsparkcyklarnas hårdvara, t.ex. gps-system, batteri, hastighetsmätare. Detta system är mer känslig och klarar inte av hög belastning, dess huvudsakliga syfte är att visa på ´scooter-app´:s förmåga att rapporta till sin egen position utan mocka det.

```
cd alt/
bash simulation.sh 5 5 1 // starta simulation
bash simulation.sh stop // stoppa
```
