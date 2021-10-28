# Base Back App Image building

# Lib and Tools version
ARG JDK_VERSION=11.0.11-jre-slim-buster

# Copy app from app-builder and run
FROM openjdk:$JDK_VERSION AS runtime
ARG PROFILE=default
ENV SPRING_PROFILES_ACTIVE $PROFILE
ENV JAVA_OPTS="-Xms256m -Xmx1024m"
ADD build/libs/*.jar /app.jar

ENTRYPOINT ["java", "-Dloader.path=/ext", "-cp", "/app.jar", "org.springframework.boot.loader.PropertiesLauncher"]