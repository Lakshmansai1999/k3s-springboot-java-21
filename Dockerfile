# Use Java 21 runtime
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy jar file
COPY target/*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
