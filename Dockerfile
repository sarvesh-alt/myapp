FROM mcr.microsoft.com/openjdk/jdk:17-mariner AS windows-build

# For Linux
FROM openjdk:8-jre-alpine AS linux-build

EXPOSE 8080

COPY ./build/libs/java-app-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "java-app-1.0-SNAPSHOT.jar"]
