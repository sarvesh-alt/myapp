FROM openjdk:11-jre-slim

WORKDIR /usr/app
COPY ./build/libs/java-app-1.0-SNAPSHOT.jar .

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "java-app-1.0-SNAPSHOT.jar"]