FROM gcc:latest
WORKDIR /usr/src/app
COPY script.cpp /usr/src/app
RUN g++ -o myapp script.cpp
CMD ["./myapp"]
