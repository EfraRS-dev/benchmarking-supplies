#!/bin/bash

echo "Lenguaje,Tiempo (ms)" > results.csv

for lang in python java cpp nodejs r; do
    echo "Ejecutando $lang..."
    
    START_TIME=$(date +%s%N)
    docker-compose run --rm $lang
    END_TIME=$(date +%s%N)
    
    EXECUTION_TIME=$(( (END_TIME - START_TIME) / 1000000 ))
    echo "$lang,$EXECUTION_TIME" >> results.csv
    
    echo "$lang completado en $EXECUTION_TIME ms"
done

echo "Resultados guardados en results.csv"
