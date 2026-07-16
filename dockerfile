# Stage 1: Use Java 17 base image
FROM eclipse-temurin:17-jdk AS build

# Set working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests


# Stage 2: Create lightweight runtime image
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy generated JAR from build stage
COPY --from=build /app/target/java-devops-demo-0.0.1-SNAPSHOT.jar ./java-devops-demo.jar

# Expose application port
EXPOSE 8080

# Start Spring Boot application
ENTRYPOINT ["java","-jar","java-devops-demo.jar"]

