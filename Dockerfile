# Pull the minimal Ubuntu image
FROM tomcat:9.0

# update lib
RUN apt-get update && apt-get upgrade -y

# Copy the Nginx config
COPY target/LoginWebAppApplicationWith-Docker.war /usr/local/tomcat/webapps

#Expose port 8080
EXPOSE 8080
