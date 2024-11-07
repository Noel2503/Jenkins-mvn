# Stage 1: Build the application with Maven
FROM maven:3.8.5-openjdk-17 as build

# Set the working directory
WORKDIR /app

# Copy the Java source code
COPY Calculator.java .

# Compile the Java program
RUN mvn -B -DskipTests compile assembly:single

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file from the build stage
COPY --from=build /app/target/*.jar calculator.jar

# Set the entrypoint to run the calculator app
ENTRYPOINT ["java", "-jar", "calculator.jar"]
