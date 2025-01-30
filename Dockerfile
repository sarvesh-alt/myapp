# Use a platform-agnostic base image
FROM --platform=linux/amd64 openjdk:8-jre-alpine AS linux-build

# Use a Windows-compatible base image for Windows
FROM --platform=windows/amd64  mcr.microsoft.com/windows/nanoserver:1809  AS windows-build

# Common steps for both platforms
EXPOSE 8080

# Copy the JAR file into the image
COPY ./build/libs/java-app-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

# Default command
ENTRYPOINT ["java", "-jar", "java-app-1.0-SNAPSHOT.jar"]
