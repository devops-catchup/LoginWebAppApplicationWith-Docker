# Pull the minimal Ubuntu image
FROM tomcat

# update lib
RUN apt-get update && apt-get upgrade -y

# Copy the Nginx config
COPY target/LoginWebAppApplicationWith-Docker.war /usr/local/tomcat/webapps
