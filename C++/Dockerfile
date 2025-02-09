FROM gcc:latest
WORKDIR /usr/src/myapp
COPY script.cpp /usr/src/myapp
RUN g++ -o myapp script.cpp
CMD ["./myapp"]
