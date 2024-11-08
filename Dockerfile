# Start with a base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy jar file (ensure this file exists or is created in a build stage)
COPY target/your-app.jar app.jar

# Expose the port and set the entrypoint
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
