FROM openjdk:11-jdk-slim

WORKDIR /app

COPY Script.java /app/Script.java

# Compile the Java program
RUN javac Script.java

# Command to run the Java program
CMD ["java", "-cp", "/app", "Script"]