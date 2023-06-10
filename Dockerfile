FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y net-tools

# ENTRYPOINT service ssh start && /bin/bash

