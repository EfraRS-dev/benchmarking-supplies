FROM openjdk:17-alpine
WORKDIR /usr/src/app
COPY SumScript.java .
RUN javac SumScript.java
RUN mkdir -p /usr/src/app/data
CMD ["java", "SumScript"]' > Dockerfile