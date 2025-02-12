FROM alpine:latest
WORKDIR /usr/src/app
RUN apk add --no-cache g++ libstdc++
COPY script.cpp .
RUN g++ -o myapp script.cpp && ls -l myapp
RUN chmod +x myapp
CMD ["./myapp"]