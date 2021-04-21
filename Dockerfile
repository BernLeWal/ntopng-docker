FROM ubuntu:20.04 
MAINTAINER Bernhard Wallisch <bernhard_wallisch@hotmail.com> 

ENV LANG C.UTF-8
ENV TZ=Europe/Vienna
ARG DEBIAN_FRONTEND=noninteractive 
RUN \ 
  apt-get update \ 
  && apt-get install -y -q wget lsb-release gnupg \ 
  && cd /tmp \ 
  && wget --quiet https://packages.ntop.org/apt-stable/20.04/all/apt-ntop-stable.deb \ 
  && dpkg -i apt-ntop-stable.deb \ 
  && apt-get update \ 
  && apt-get install -y -q ntopng nprobe n2n \ 
  && apt-get clean \ 
  && rm -rf /tmp/* \ 
  && rm -rf /var/tmp/* \
  && rm -rf /var/lib/apt/lists/*
