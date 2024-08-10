# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim
WORKDIR /app

# Set environment variables
ENV APP_ENV=production
ENV APP_DEBUG=false

# Copy the webapp-runner.jar and the WAR file from the build context
COPY onlinebookstore.war /app/onlinebookstore.war

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the application
CMD ["java", "-jar",  "onlinebookstore.war"]
