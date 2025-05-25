# Use official Tomcat image with JDK
FROM tomcat:9.0-jdk17

# Remove default apps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat's webapps directory
# Rename it ROOT.war to deploy at the root context, or keep yourapp.war
COPY target/LoginWebAppApplicationWith-Docker.war /usr/local/tomcat/webapps/LoginWebAppApplicationWith-Docker.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat explicitly (optional, as it's the default in the base image)
CMD ["catalina.sh", "run"]
