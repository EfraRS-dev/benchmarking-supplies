#!/bin/bash

declare -A data_files=(
    ["python"]="Python/data_py.txt"
    ["java"]="Java/data_java.txt"
    ["cpp"]="C++/data_cpp.txt"
    ["nodejs"]="Node/data_js.txt"
    ["r"]="R/data_r.txt"
)

echo "Lenguaje,Tiempo (s)" > results.csv

# Lectura de archivo por lenguaje
for service in "${!data_files[@]}"; do
    echo "Ejecutando $service..."
    docker-compose run --rm "$service"
    
    execution_time=$(cat "${data_files[$service]}")
    
    echo "$service,$execution_time" >> results.csv
    echo "$service completado en $execution_time s"
done

cat results.csv
