FROM ubuntu:20.04

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    ca-certificates \
    lsb-release \
    sudo \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN curl -fsSL https://get.docker.com | sh


RUN curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose


RUN git clone https://github.com/EfraRS-dev/benchmarking-supplies.git

EXPOSE 2375

# Comando por defecto (inicia el daemon de Docker y mantiene el contenedor en ejecución)
CMD ["sh", "-c", "dockerd & while :; do sleep 3600; done"]