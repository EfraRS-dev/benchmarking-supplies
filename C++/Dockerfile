FROM gcc:alpine
WORKDIR /usr/src/app
COPY script.cpp .
RUN apk add --no-cache libstdc++
RUN g++ -o myapp script.cpp
RUN mkdir -p /usr/src/app/data
CMD ["./myapp"]' > Dockerfile