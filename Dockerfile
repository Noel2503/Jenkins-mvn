# Stage 1: Build the application with Maven
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Clone the project repository
RUN git clone https://github.com/Noel2503/Jenkins-mvn.git .

# Build the application with Maven
RUN mvn clean install -DskipTests

# Stage 2: Run the application
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port the app runs on (if known, e.g., 8080)
EXPOSE 8080

# Set the entrypoint to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
