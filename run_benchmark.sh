#!/bin/bash

echo "Lenguaje,Tiempo (ms)" > results.csv

for lang in python java cpp nodejs r; do
    echo "Limpiando contenedores e imágenes antes de ejecutar $lang..."
    
    docker container prune -f  # Borra contenedores detenidos
    docker image prune -f -a   # Borra imágenes no utilizadas
    docker volume prune -f     # Borra volúmenes no usados
    docker system prune -f     # Borra todo lo que no esté en uso
    
    echo "Ejecutando $lang..."
    
    START_TIME=$(date +%s%N)
    docker-compose run --rm $lang
    END_TIME=$(date +%s%N)
    
    EXECUTION_TIME=$(( (END_TIME - START_TIME) / 1000000 ))
    echo "$lang,$EXECUTION_TIME" >> results.csv
    
    echo "$lang completado en $EXECUTION_TIME ms"

    echo "Limpiando después de ejecutar $lang..."
    docker container prune -f
    docker image prune -f -a
    docker volume prune -f
    docker system prune -f

done

echo "Resultados guardados en results.csv"
