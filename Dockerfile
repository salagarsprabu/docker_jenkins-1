FROM jenkins/jenkins:lts
MAINTAINER suresh
USER root
WORKDIR /opt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y apt-utils && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN wget https://www-eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN mkdir /opt/maven
RUN tar -zxvf apache-maven-3.6.3-bin.tar.gz -C /opt/
WORKDIR /opt
COPY settings.xml /opt/maven/apache-maven-3.6.3/conf/
EXPOSE 8080
