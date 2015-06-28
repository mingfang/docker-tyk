FROM ubuntu:14.04
 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN locale-gen en_US en_US.UTF-8
ENV LANG en_US.UTF-8
RUN echo "export PS1='\e[1;31m\]\u@\h:\w\\$\[\e[0m\] '" >> /root/.bashrc

#Runit
RUN apt-get install -y runit 
CMD export > /etc/envvars && /usr/sbin/runsvdir-start
RUN echo 'export > /etc/envvars' >> /root/.bashrc

#Utilities
RUN apt-get install -y vim less net-tools inetutils-ping wget curl git telnet nmap socat dnsutils netcat tree htop unzip sudo software-properties-common jq psmisc

#Redis
RUN apt-get install -y redis-server

#MongoDB
RUN apt-get install -y mongodb
RUN mkdir -p /data/db

#Tyk
RUN wget https://github.com/lonelycode/tyk/releases/download/1.7/tyk.linux.amd64_1.7-1_all.deb && \
    dpkg -i *deb && \
    rm *deb

#Dashboard
RUN wget -O - https://github.com/lonelycode/tyk/releases/download/1.7/tyk-dashboard-amd64-v0.9.5.tar.gz | tar xvfz -
RUN mv tyk-analytics* tyk-analytics

#script to create test user
ADD newuser /

#Add runit services
ADD sv /etc/service 

