# Use a base image with Java and Maven installed
FROM maven:3-openjdk-17 AS builder
# Set the working directory in the container
WORKDIR /tmp
# Copy the project files to the container
# Build the Spring Boot application using Maven
# RUN mvn clean install -Dmaven.test.skip=true
# Use a lightweight base image for running the application
FROM adoptopenjdk/openjdk11:alpine-jre
# Set the working directory in the container
WORKDIR /tmp
RUN ls -la /tmp
# Copy the built JAR file from the builder stage to the container
COPY /tmp/target/spring-petclinic-*.jar app.jar
# Expose the port that the application will run on
EXPOSE 8080
# Specify the command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "app.jar"]
