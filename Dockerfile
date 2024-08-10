# Use an official Tomcat image as a parent image
FROM tomcat:9.0-jdk11

# Remove the default web application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file to Tomcat's webapps directory
COPY onlinebookstore.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Tomcat will start automatically
