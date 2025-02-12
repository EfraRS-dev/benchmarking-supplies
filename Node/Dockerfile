FROM node:18-alpine 
# Establece el directorio de trabajo
WORKDIR /usr/src/app
# Copia el archivo de código fuente
COPY index.js .
# Crea el directorio para los datos de salida
RUN mkdir -p /usr/src/app/data
# Comando para ejecutar el programa
CMD ["node", "index.js"]