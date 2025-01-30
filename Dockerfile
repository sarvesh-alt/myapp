FROM openjdk:8-jre-alpine

# Create app directory
WORKDIR /usr/app

# Copy the jar file
COPY ./build/libs/java-app-1.0-SNAPSHOT.jar .

# Add non-root user (skip on Windows)
RUN if [ "$(uname)" != "Windows_NT" ]; then \
      addgroup -S appgroup && adduser -S appuser -G appgroup && \
      chown -R appuser:appgroup /usr/app && \
      su appuser ; \
    fi

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q --spider http://localhost:8080/health || exit 1

ENTRYPOINT ["java", "-jar", "java-app-1.0-SNAPSHOT.jar"]