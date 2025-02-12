FROM python:3.10-alpine
# Establece el directorio de trabajo
WORKDIR /usr/src/app
# Copia el archivo de código fuente
COPY script.py .
# Crea el directorio para los datos de salida
RUN mkdir -p /usr/src/app/data
# Comando para ejecutar el programa
CMD ["python", "script.py"]' > Dockerfile