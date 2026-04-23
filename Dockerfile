FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy only pom first (cache dependencies)
COPY pom.xml .
RUN mvn -B -q -e -DskipTests dependency:go-offline

# Then copy source
COPY src ./src

RUN mvn clean package -DskipTests

CMD ["java", "-jar", "target/*.jar"]
