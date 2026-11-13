# FROM maven:3.9-eclipse-temurin-21
# WORKDIR /app
# COPY pom.xml . 
# COPY src ./src
 
# RUN mvn clean package
# EXPOSE 8080
# CMD ["java", "-jar", "target/veereh-3.0-SNAPSHOT.jar"]
#multistageBuild
FROM maven:3.9-eclipse-temurin-21 AS bhoomika 
WORKDIR /app
COPY pom.xml . 
COPY src ./src
RUN mvn clean package

FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY --from=bhoomika  /app/target/veereh-3.0-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java", "-jar", "/app/veereh-3.0-SNAPSHOT.jar"]
