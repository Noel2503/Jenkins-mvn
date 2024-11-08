# Start with a base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy jar file (ensure this file exists or is created in a build stage)
COPY target/Calculator-1.0-SNAPSHOT.jar /app

# Expose the port and set the entrypoint
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "./Calculator-1.0-SNAPSHOT.jar"]
