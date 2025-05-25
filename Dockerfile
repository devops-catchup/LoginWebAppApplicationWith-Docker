FROM openjdk:17-jdk-slim

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y curl && \
    curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    mkdir -p /opt/tomcat && \
    tar xzvf apache-tomcat-9.0.85.tar.gz -C /opt/tomcat --strip-components=1 && \
    rm apache-tomcat-9.0.85.tar.gz

# Copy your WAR(s)
COPY target/LoginWebAppApplicationWith-Docker.war $CATALINA_HOME/webapps/

EXPOSE 8080

# Start Tomcat manually
CMD ["catalina.sh", "run"]
