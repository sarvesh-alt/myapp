# Use AdoptOpenJDK 8 with Alpine for smaller image size
FROM adoptopenjdk/openjdk8:jre-alpine

# Add labels for better maintainability
LABEL maintainer="COSC 1209"
LABEL version="1.0"

# Expose the application port
EXPOSE 8080

# Create a directory for the application
WORKDIR /usr/app

# Copy the JAR file
COPY ./build/libs/java-app-1.0-SNAPSHOT.jar app.jar

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup && \
    chown -R appuser:appgroup /usr/app

# Switch to non-root user
USER appuser

# Use JAVA_OPTS for any JVM arguments
ENV JAVA_OPTS=""

# Run the application
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.jar"]